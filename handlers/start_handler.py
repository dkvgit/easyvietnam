from telegram import Update, ReplyKeyboardRemove, InlineKeyboardButton, InlineKeyboardMarkup
from telegram.ext import ContextTypes
from config import PDF_LINK, SUPPORT_CHAT, ADMIN_IDS
from keyboards import get_main_menu, get_quick_menu
from supabase_api import save_user_to_supabase, find_nearby_businesses, search_businesses_by_keyword, \
    search_businesses_by_location, update_user_location
from handlers.formatters import format_business_card
from telegram import Update
from telegram import KeyboardButton, ReplyKeyboardMarkup
from keyboards import get_location_keyboard, get_main_menu



async def handle_location(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Обработка геолокации пользователя"""
    location = update.message.location
    latitude = location.latitude
    longitude = location.longitude

    # Проверяем, есть ли сохраненная категория для сортировки
    if 'sort_category' in context.user_data:
        from handlers.category_handler import handle_user_location_for_sorting
        await handle_user_location_for_sorting(update, context)
        return

    # Обычный поиск ближайших мест
    results = await find_nearby_businesses(latitude, longitude, max_distance=2000)

    if not results:
        await update.message.reply_text("😕 Поблизости ничего не найдено в радиусе 2 км.\n"
                                        "Попробуйте воспользоваться поиском по категориям.")
        return

    reply = "📍 <b>Ближайшие места:</b>\n\n"
    for i, r in enumerate(results[:10], 1):
        distance = r['distance']
        distance_str = f"{distance} м" if distance < 1000 else f"{distance / 1000:.1f} км"

        reply += f"{i}. <b>{r['title']}</b>\n"
        reply += f"   📏 {distance_str}"

        if r.get('price_range'):
            reply += f" • 💰 {r['price_range']}"
        if r.get('working_hours'):
            reply += f" • 🕒 {r['working_hours']}"

        reply += "\n\n"

    await update.message.reply_text(reply, parse_mode="HTML")

    # Показываем детальную информацию о первых 5 заведениях
    for business in results[:5]:
        text = format_business_card(business, show_distance=True)

        keyboard = []
        # Кнопка для показа на карте
        if business.get('latitude') and business.get('longitude'):
            keyboard.append([InlineKeyboardButton("🗺 Показать на карте",
                url=f"https://maps.google.com/?q={business['latitude']},{business['longitude']}")])

        # Кнопка для звонка
        contact = business.get('contact', '')
        if contact and ('+' in contact or contact.startswith('0')):
            phone = contact.replace(' ', '').replace('-', '')
            keyboard.append([InlineKeyboardButton("📞 Позвонить", url=f"tel:{phone}")])

        reply_markup = InlineKeyboardMarkup(keyboard) if keyboard else None

        await update.message.reply_text(text, parse_mode="HTML", reply_markup=reply_markup,
            disable_web_page_preview=True)


async def start(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Приветствие /start"""
    user = update.effective_user
    user_id = user.id
    source = context.args[0] if context.args else "direct"

    # Сохраняем пользователя в Supabase
    await save_user_to_supabase(user_id=user.id, username=user.username, first_name=user.first_name, source=source)

    welcome_text = (f"👋 Привет, {user.first_name}!\n"
                    "Ты в мини-гид по г. Ня Чанг, Вьетнам.\n\n Выбирай, что тебе интересно 👇")

    # 1. Отправляем приветствие и Инлайн-меню (как и было)
    await update.message.reply_text(welcome_text)
    await update.message.reply_text("⬇️ Главное меню:", reply_markup=get_main_menu())
    
    

async def guide(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Команда /guide — быстрое меню"""
    await update.message.reply_text("📌 Быстрое меню категорий:", reply_markup=get_quick_menu())


async def search(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Команда /search — поиск заведений"""
    if not context.args:
        await update.message.reply_text("🔍 Введите ключевое слово для поиска.\nПример: `/search кафе`",
                                        parse_mode="Markdown")
        return

    keyword = " ".join(context.args).lower()
    results = await search_businesses_by_keyword(keyword)

    if not results:
        await update.message.reply_text("😕 Ничего не найдено по вашему запросу.")
        return

    for biz in results:
        text = (f"📍 <b>{biz['title']}</b>\n\n"
                f"{biz['description']}\n\n"
                f"📞 {biz.get('contact', '—')}")
        await update.message.reply_text(text, parse_mode="HTML")


async def pdf(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Команда /pdf — отправка ссылки на гайд"""
    await update.message.reply_text(f"📄 Гид по Вьетнаму доступен здесь:\n{PDF_LINK}")


async def feedback(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Команда /feedback — чат поддержки"""
    await update.message.reply_text(f"💬 Если у тебя есть вопросы, пиши в поддержку:\n{SUPPORT_CHAT}")


async def promo(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Команда /promo — рассказ о рекламе"""
    await update.message.reply_text("📢 Хотите разместить рекламу в нашем боте?\n\n"
                                    f"Пишите в поддержку: {SUPPORT_CHAT}")


async def help_command(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Команда /help"""
    await update.message.reply_text("ℹ️ Список команд:\n"
                                    "/start — Главное меню\n"
                                    "/guide — Быстрые категории\n"
                                    "/search — Поиск заведений\n"
                                    "/nearby — Найти рядом\n"
                                    "/pdf — Скачать гайд\n"
                                    "/feedback — Поддержка\n"
                                    "/promo — Информация о рекламе\n"
                                    "/hide — Скрыть меню")


async def hide_keyboard(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Команда /hide — скрыть кнопки"""
    await update.message.reply_text("Меню скрыто. Чтобы вернуть — нажмите /start", reply_markup=ReplyKeyboardRemove())


async def nearby_command(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Команда /nearby - запрос геолокации для поиска рядом"""
    await update.message.reply_text(
        "📍 Чтобы найти ближайшие заведения, отправьте свою геолокацию.\n\n"
        "Нажмите 📎 → Местоположение",
        reply_markup=None
    )


async def advanced_search(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Команда /advanced_search - поиск с фильтрами"""
    if not context.args:
        await update.message.reply_text(
            "🔍 <b>Расширенный поиск</b>\n\n"
            "Используйте команду с параметрами:\n"
            "• <code>/advanced_search кафе цена:100-300</code>\n"
            "• <code>/advanced_search массаж время:09:00-21:00</code>\n"
            "• <code>/advanced_search еда адрес:центр</code>",
            parse_mode="HTML"
        )
        return

    # Получаем координаты пользователя 1 раз для всех результатов
    from handlers.formatters import get_user_location
    user_lat, user_lon = get_user_location()

    query_parts = " ".join(context.args).split()
    keyword = query_parts[0] if query_parts else ""
    filters_dict = {}

    # Парсим фильтры
    for part in query_parts[1:]:
        if ":" in part:
            filter_type, filter_value = part.split(":", 1)
            filters_dict[filter_type] = filter_value

    results = []

    # Поиск по ключевому слову
    if keyword:
        results = await search_businesses_by_keyword(keyword)

    # Применяем фильтры
    if "адрес" in filters_dict:
        location_results = await search_businesses_by_location(filters_dict["адрес"])
        if results:
            result_ids = [r['id'] for r in results]
            results = [r for r in location_results if r['id'] in result_ids]
        else:
            results = location_results

    if "цена" in filters_dict:
        price_filter = filters_dict["цена"]
        if results:
            filtered_results = []
            for r in results:
                price_range = r.get('price_range', '')
                if price_filter.lower() in price_range.lower():
                    filtered_results.append(r)
            results = filtered_results

    if not results:
        await update.message.reply_text("😕 По вашему запросу ничего не найдено.")
        return

    # Показываем результаты
    await update.message.reply_text(
        f"🔍 <b>Найдено:</b> {len(results)} заведений",
        parse_mode="HTML"
    )

    for business in results[:10]:
        # Форматируем карточку с расстоянием
        text = format_business_card(
            business,
            user_lat=user_lat,
            user_lon=user_lon,
            show_distance=True
        )

        keyboard = []
        if business.get('latitude') and business.get('longitude'):
            keyboard.append([InlineKeyboardButton(
                "🗺 На карте",
                url=f"https://maps.google.com/?q={business['latitude']},{business['longitude']}"
            )])

        reply_markup = InlineKeyboardMarkup(keyboard) if keyboard else None
        await update.message.reply_text(
            text,
            parse_mode="HTML",
            reply_markup=reply_markup,
            disable_web_page_preview=True
        )




async def location_handler(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Ловит локацию, сохраняет её и переотправляет последнюю просмотренную карточку"""
    user = update.effective_user
    
    # Защита на случай, если пришло сообщение без локации
    if not update.message.location:
        return

    lat = update.message.location.latitude
    lon = update.message.location.longitude
    
    # 1. Сохраняем новые координаты в базу
    from supabase_api import update_user_location
    await update_user_location(user.id, lat, lon)
    
    # 2. Достаем заведение из "памяти"
    biz_data = context.user_data.get('last_viewed_biz')
    
    if biz_data:
        from handlers.formatters import format_business_card
        
        # 3. Формируем текст с НОВЫМИ координатами
        text = format_business_card(
            biz_data,
            user_lat=lat,
            user_lon=lon,
            show_distance=True
        )
        
        # 4. Собираем кнопки заново (как в button_handler)
        kb = []
        b_lat = biz_data.get('latitude')
        b_lon = biz_data.get('longitude')
        
        if b_lat and b_lon:
            google_url = f"https://www.google.com/maps?q={b_lat},{b_lon}"
            kb.append([InlineKeyboardButton("🗺 На карте", url=google_url)])
        
        cat = biz_data.get('category', 'all')
        sub = biz_data.get('subcategory', 'all')
        kb.append([InlineKeyboardButton("🔙 Вернуться к списку", callback_data=f"subcat_{cat}_{sub}")])
        
        # 5. Уведомляем пользователя и ПРИНУДИТЕЛЬНО УДАЛЯЕМ нижние кнопки (📍 Отправить локацию)
        await update.message.reply_text(
            "✅ Расстояние обновлено по вашим текущим координатам!",
            reply_markup=ReplyKeyboardRemove()
        )
        
        # 6. Присылаем свежую карточку
        await update.message.reply_text(
            text,
            parse_mode="HTML",
            reply_markup=InlineKeyboardMarkup(kb),
            disable_web_page_preview=True
        )
    else:
        # Если в памяти нет последней карточки (просто юзер обновил локацию)
        await update.message.reply_text(
            "✅ Локация сохранена! Теперь я буду показывать актуальное расстояние до всех мест в гиде.",
            reply_markup=ReplyKeyboardRemove()
        )

async def request_location_update(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Срабатывает при нажатии на /update_location в тексте карточки"""
    from keyboards import get_location_keyboard
    
    # Отправляем сообщение с принудительным вызовом нижней клавиатуры
    await update.message.reply_text(
        "Нажми кнопку <b>«📍 Отправить локацию»</b> на клавиатуре внизу 👇\n\n"
        "<i>После этого я пришлю обновленную карточку с точным расстоянием.</i>",
        reply_markup=get_location_keyboard(),
        parse_mode="HTML"
    )