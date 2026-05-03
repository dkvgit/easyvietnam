#D:\aRabota\TelegaBoom\08_gid\handlers\category_handler.py


import re
import logging
from telegram import Update, InlineKeyboardButton, InlineKeyboardMarkup
from telegram.ext import ContextTypes
from keyboards import get_main_menu, get_back_button, get_promo_keyboard, get_filter_keyboard
from data_structure import CATEGORIES, SUBCATEGORIES, CATEGORIES_DATA
from supabase_api import (
    get_businesses_by_category, get_businesses_with_working_hours, supabase
)
from handlers.formatters import format_business_card
from handlers.slider_handler import show_business_slider

logger = logging.getLogger(__name__)


def sort_businesses_alphabetically(businesses):
    """Сортирует бизнесы: сначала рекомендованные, потом остальные по алфавиту"""
    recommended = [b for b in businesses if b.get('is_recommended', False)]
    regular = [b for b in businesses if not b.get('is_recommended', False)]
    
    recommended.sort(key=lambda x: x.get('title', '').lower())
    regular.sort(key=lambda x: x.get('title', '').lower())
    
    return recommended + regular


def get_category_places_name(category_key):
    """Возвращает правильное название мест для категории (для обратной совместимости)"""
    if category_key in CATEGORIES:
        return f"Все {CATEGORIES[category_key]['name'].lower()}"
    
    places_names = {
        'food': 'Все заведения',
        'housing': 'Все варианты жилья',
        'exchange': 'Все обменники',
        'health': 'Все медучреждения',
        'transport': 'Все транспортные услуги',
        'beauty': 'Все салоны красоты',
        'spa': 'Все спа и массажи',
        'fun': 'Все развлечения',
        'services': 'Все сервисы',
        'chats': 'Все чаты',
        'recommended': 'Все рекомендации',
        'tours': 'Все экскурсии',
        'kids': 'Все для детей',
        'legal': 'Все визовые агентства',
        'tips': 'Все советы'
    }
    return places_names.get(category_key, 'Все заведения')


def get_price_value(price_range):
    """Извлекает числовое значение из строки с ценой для сортировки"""
    import re
    if not price_range:
        return 999999
    
    # Твоя логика: убираем запятые, меняем k на 000 и ищем цифры
    numbers = re.findall(r'\d+', str(price_range).replace('k', '000').replace(',', ''))
    if numbers:
        return int(numbers[0])
    return 999999




async def button_handler(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Главный обработчик inline кнопок"""
    
    query = update.callback_query
    data = query.data
    
    # Сразу отвечаем на callback, чтобы кнопка не "висела"
    await query.answer()
    
    print(f"\n[BUTTON] 🔴 ВЫЗВАН: data='{data}'")
    
    try:
        # 1. ГЛАВНОЕ МЕНЮ
        if data == "main_menu" or data == "back":
            print("🏠 [LOG] Действие: Возврат в главное меню")
            await query.message.reply_text("🏠 Главное меню", reply_markup=get_main_menu())
            return
        
        # 1.1. СПИСОК КАТЕГОРИЙ (Твоя кнопка из пустого раздела)
        if data == "show_categories":
            print("📂 [LOG] Действие: Показ списка категорий")
            from data_structure import CATEGORIES
            from telegram import InlineKeyboardButton, InlineKeyboardMarkup
            
            keyboard = []
            row = []
            for key, cat_data in CATEGORIES.items():
                row.append(InlineKeyboardButton(cat_data.get("name", key), callback_data=f"cat_{key}"))
                if len(row) == 2:
                    keyboard.append(row)
                    row = []
            if row:
                keyboard.append(row)
            
            keyboard.append([InlineKeyboardButton("🏠 Главное меню", callback_data="main_menu")])
            
            await query.message.edit_text(
                "<b>📂 Категории заведений</b>\n\nВыберите раздел:",
                reply_markup=InlineKeyboardMarkup(keyboard),
                parse_mode="HTML"
            )
            print("✅ [LOG] Меню категорий успешно отрисовано")
            return

        if data == "dummy":
            return
            
        # 2. ПАГИНАЦИЯ
        if data.startswith("p:"):
            page_idx = int(data.split(":")[1])
            cat_key = context.user_data.get("last_cat")
            sub_key = context.user_data.get("last_sub")
            
            print(f"📑 [LOG] Пагинация: Переход на стр {page_idx} для подкатегории '{sub_key}'")
            
            if cat_key and sub_key:
                await show_businesses_by_subcategory(
                    query=query,
                    category_key=cat_key,
                    subcategory_key=sub_key,
                    context=context,
                    page=page_idx
                )
            else:
                print("❌ [ERR] Ошибка пагинации: Ключи потеряны в user_data")
            return
        
        # 3. КАТЕГОРИИ (cat_)
        if data.startswith("cat_"):
            category_key = data.replace("cat_", "")
            print(f"📂 [LOG] Категория: '{category_key}'")
            
            context.user_data["last_cat"] = category_key
            
            from data_structure import CATEGORIES
            category_data = CATEGORIES.get(category_key, {})
            
            if category_data.get("has_subcategories"):
                # Убедись, что эта функция импортирована или объявлена выше
                await show_subcategories_menu(query, category_key, context)
            else:
                context.user_data["last_sub"] = category_key
                await show_businesses_by_subcategory(
                    query=query,
                    category_key=category_key,
                    subcategory_key=category_key,
                    context=context,
                    page=0
                )
            return
        
        # 4. ПОДКАТЕГОРИИ (subcat_)
       
        if data.startswith("subcat_"):
            # Разбиваем максимум на 3 части: ['subcat', 'category', 'остаток_с_подчеркиваниями']
            parts = data.split("_", 2)
            if len(parts) >= 3:
                category_key = parts[1]
                subcategory_key = parts[2] # Теперь тут будет "currency_exchange" целиком
                
                context.user_data["last_cat"] = category_key
                context.user_data["last_sub"] = subcategory_key
                
                print(f"🔮 [LOG] Подкатегория: '{subcategory_key}' (cat: {category_key})")
                
                await show_businesses_by_subcategory(
                    query=query,
                    category_key=category_key,
                    subcategory_key=subcategory_key,
                    context=context,
                    page=0
                )
            return
        
        # 5. КАРТОЧКА ЗАВЕДЕНИЯ (show_biz_)
        if data.startswith("show_biz_"):
            biz_id = data.replace("show_biz_", "")
            user_id = query.from_user.id
            print(f"📄 [LOG] Карточка: ID {biz_id} для юзера {user_id}")
            
            all_biz = context.user_data.get("temp_businesses", [])
            biz_data = next((b for b in all_biz if str(b['id']) == biz_id), None)
            
            if biz_data:
                context.user_data['last_viewed_biz'] = biz_data
                from handlers.formatters import format_business_card, get_user_location
                from telegram import InlineKeyboardButton, InlineKeyboardMarkup
                
                user_lat, user_lon = get_user_location(user_id)
                text = format_business_card(biz_data, user_lat=user_lat, user_lon=user_lon, show_distance=True)
                
                kb = []
                lat, lon = biz_data.get('latitude'), biz_data.get('longitude')
                if lat and lon:
                    google_url = f"https://www.google.com/maps?q={lat},{lon}"
                    kb.append([InlineKeyboardButton("🗺 На карте", url=google_url)])
                
                cat = biz_data.get('category')
                sub = biz_data.get('subcategory')
                back_callback = f"cat_{cat}" if not sub else f"subcat_{cat}_{sub}"
                
                kb.append([InlineKeyboardButton("🔙 Вернуться к списку", callback_data=back_callback)])
                
                await query.message.reply_text(
                    text,
                    parse_mode="HTML",
                    reply_markup=InlineKeyboardMarkup(kb),
                    disable_web_page_preview=True
                )
            else:
                print(f"❌ [ERR] Бизнес с ID {biz_id} не найден")
            return
        
        # 6. ФИЛЬТРЫ (filter_)
        if data.startswith("filter_"):
            print(f"🎛 [LOG] Фильтр: {data}")
            await handle_filter(update, query, data, context)
            return
        
        # 7. НЕИЗВЕСТНО
        print(f"❓ [LOG] Необработанная кнопка: {data}")

    except Exception as e:
        print(f"❌ [CRITICAL] Ошибка в button_handler: {e}")
        import traceback
        traceback.print_exc()






async def show_subcategories_menu(query, category_key, context):
    from data_structure import CATEGORIES_DATA, SUBCATEGORIES
    from telegram import InlineKeyboardButton, InlineKeyboardMarkup

    print(f"🔍 [DEBUG] Вход в show_subcategories_menu. Ключ: {category_key}")

    category_info = CATEGORIES_DATA.get(category_key, {})
    category_name = category_info.get("label", category_key)
    subs_to_show = category_info.get("subs", [])
    
    keyboard = []
    current_row = []
    
    for sub_key in subs_to_show:
        # Ищем красивое имя в словаре подкатегорий
        sub_info = SUBCATEGORIES.get(sub_key, {})
        label = sub_info.get("name", sub_key) # Если не нашли, останется тех. имя
        
        # Обрезаем только если реально слишком длинно (для 2 кнопок в ряд лучше 25 симв)
        if len(label) > 25:
            label = label[:22] + "..."
            
        button = InlineKeyboardButton(label, callback_data=f"subcat_{category_key}_{sub_key}")
        current_row.append(button)
        
        if len(current_row) == 2:
            keyboard.append(current_row)
            current_row = []

    if current_row:
        keyboard.append(current_row)

    # Кнопки навигации
    keyboard.append([InlineKeyboardButton(f"📋 Все {category_name}", callback_data=f"filter_{category_key}_all")])
    keyboard.append([InlineKeyboardButton("🏠 Главное меню", callback_data="main_menu")])

    text = f"<b>{category_name}</b>\nВыберите тип заведения:"
    
    try:
        await query.message.edit_text(
            text,
            reply_markup=InlineKeyboardMarkup(keyboard),
            parse_mode="HTML"
        )
    except Exception as e:
        if "Message is not modified" not in str(e):
            await query.message.reply_text(text, reply_markup=InlineKeyboardMarkup(keyboard), parse_mode="HTML")

async def show_businesses_by_subcategory(query, category_key, subcategory_key, context, page=0):
    from supabase_api import supabase
    from data_structure import SUBCATEGORIES, CATEGORIES
    from telegram import InlineKeyboardButton, InlineKeyboardMarkup

    per_page = 10
    context.user_data["last_cat"] = category_key
    context.user_data["last_sub"] = subcategory_key
    
    # 1. ПОЛУЧАЕМ КРАСИВОЕ НАЗВАНИЕ (ИСПРАВЛЕНО)
    # Если мы зашли в основную категорию (cat == sub), берем имя из CATEGORIES
    if category_key == subcategory_key:
        display_name = CATEGORIES.get(category_key, {}).get("name", category_key)
    else:
        # Иначе ищем в подкатегориях
        display_name = SUBCATEGORIES.get(subcategory_key, {}).get("name", subcategory_key)

    # 2. Определяем тип контента для текста
    noun_map = {
        "legal": "предложений", "chats": "чатов", "finance": "сервисов",
        "tips": "советов", "housing": "вариантов жилья", "food": "заведений",
        "spa": "салонов", "beauty": "мастеров", "transport": "объявлений",
        "kids": "предложений", "health": "клиник/врачей"
    }
    item_type = noun_map.get(category_key, "предложений")
    
    # 3. ПОДГОТОВКА ЗАПРОСА
    search_category = category_key
    
    # 4. Получение данных
    if "temp_businesses" in context.user_data and context.user_data.get("cached_sub") == subcategory_key:
        all_businesses = context.user_data["temp_businesses"]
    else:
        try:
            print(f"📥 [DB] Ищу: cat={search_category}, sub_key={subcategory_key}")
            
            # Базовый запрос по главной категории
            db_query = supabase.table("businesses").select("*").eq("category", search_category)
            
            # ИСПРАВЛЕНИЕ:
            # Если subcategory_key равен самой категории или "all",
            # мы НЕ добавляем фильтр по подкатегории. Тогда база выдаст ВСЁ:
            # и где subcategory='kids', и где subcategory='', и где subcategory=NULL.
            if subcategory_key not in [category_key, "all", ""]:
                db_query = db_query.eq("subcategory", subcategory_key)
            
            response = db_query.execute()
            data = response.data or []
            
            # Сортировка по алфавиту
            all_businesses = sorted(data, key=lambda x: x.get('title', '').lower())
            
            context.user_data["temp_businesses"] = all_businesses
            context.user_data["cached_sub"] = subcategory_key
        except Exception as e:
            print(f"❌ [ERROR] Ошибка БД: {e}")
            all_businesses = []
    
    # 5. Если пусто
    if not all_businesses:
        keyboard = [[InlineKeyboardButton("🏠 В главное меню", callback_data="main_menu")]]
        await query.message.edit_text(
            f"😕 В разделе <b>«{display_name}»</b> пока нет {item_type}.\n\nПожалуйста, выберите другое направление.",
            reply_markup=InlineKeyboardMarkup(keyboard),
            parse_mode="HTML"
        )
        return
    
    # 6. Рендерим список
    total = len(all_businesses)
    start_idx = page * per_page
    end_idx = start_idx + per_page
    current_batch = all_businesses[start_idx:end_idx]
    
    keyboard = []
    row = []
    for i, biz in enumerate(current_batch, start=start_idx + 1):
        biz_title = biz.get('title', 'Без названия')
        title = biz_title[:35] + ".." if len(biz_title) > 37 else biz_title
        row.append(InlineKeyboardButton(f"{i}. {title}", callback_data=f"show_biz_{biz['id']}"))
        if len(row) == 2:
            keyboard.append(row)
            row = []
    if row: keyboard.append(row)
    
    nav_row = []
    if page > 0:
        nav_row.append(InlineKeyboardButton("⬅️ Назад", callback_data=f"p:{page - 1}"))
    if end_idx < total:
        nav_row.append(InlineKeyboardButton(f"Далее ({total - end_idx}) ➡️", callback_data=f"p:{page + 1}"))
    if nav_row: keyboard.append(nav_row)
    
    # Кнопка назад к подкатегориям
    cat_data = CATEGORIES.get(category_key, {})
    if cat_data.get("has_subcategories") and category_key != subcategory_key:
        keyboard.append([InlineKeyboardButton("📂🔙 К списку подразделов", callback_data=f"cat_{category_key}")])
    
    keyboard.append([InlineKeyboardButton("🏠 Главное меню", callback_data="main_menu")])
    
    text = f"<b>{display_name}</b>\nНайдено {item_type}: {total}\n\nВыберите нужный вариант:"
    
    try:
        await query.message.edit_text(text, reply_markup=InlineKeyboardMarkup(keyboard), parse_mode="HTML")
    except Exception as e:
        if "Message is not modified" not in str(e):
            await query.message.reply_text(text, reply_markup=InlineKeyboardMarkup(keyboard), parse_mode="HTML")
            
            
            
async def show_business_details(query, biz_id):
    from supabase_api import supabase
    from handlers.formatters import format_business_card, get_user_location
    from telegram import InlineKeyboardButton, InlineKeyboardMarkup

    print(f"🔍 [DEBUG] Вход в show_business_details. ID: {biz_id}")

    try:
        response = supabase.table("businesses").select("*").eq("id", biz_id).single().execute()
        biz = response.data
        
        if not biz:
            print(f"⚠️ [DEBUG] Бизнес с ID {biz_id} не найден")
            await query.answer("❌ Заведение не найдено")
            return

        user_lat, user_lon = get_user_location()

        text = format_business_card(
            biz,
            user_lat=user_lat,
            user_lon=user_lon,
            show_distance=True
        )

        keyboard = []
        if biz.get('location_link'):
            keyboard.append([InlineKeyboardButton("📍 На карту", url=biz['location_link'])])
        
        keyboard.append([InlineKeyboardButton("🔙 Назад к списку", callback_data="back_to_list")])
        
        await query.message.edit_text(
            text,
            reply_markup=InlineKeyboardMarkup(keyboard),
            parse_mode="HTML"
        )
        print(f"✅ [DEBUG] Карточка {biz_id} отправлена")
    except Exception as e:
        print(f"❌ [ERROR] Ошибка в show_business_details: {e}")
    
    
async def show_category_filter_menu(query, category_key):
    """Показать меню фильтрации для категории"""
    from data_structure import CATEGORIES_DATA
    
    category_data = CATEGORIES_DATA.get(category_key)
    if not category_data:
        await query.message.reply_text("❌ Неизвестная категория.", reply_markup=get_back_button())
        return
    
    category_label = category_data["label"]
    
    # Отправляем заголовок
    await query.message.reply_text(
        f"📂 <b>{category_label}</b>\n\nВыберите способ отображения:",
        reply_markup=get_filter_keyboard(category_key),
        parse_mode="HTML"
    )

async def handle_filter(update: Update, query, data, context):
    """Обработка выбранного фильтра (цена, открыто, все)"""
    from supabase_api import supabase
    from telegram import InlineKeyboardButton, InlineKeyboardMarkup

    parts = data.split("_")
    if len(parts) < 3:
        return
    
    category_key = parts[1]
    filter_type = parts[2]
    filter_direction = parts[3] if len(parts) > 3 else None
    
    print(f"🔎 [FILTER] Применен фильтр: {filter_type} для {category_key}")

    # 1. Настройка контекста для пагинации
    context.user_data["last_cat"] = category_key
    cache_key = f"filter_{category_key}_{filter_type}_{filter_direction or ''}"
    context.user_data["last_sub"] = cache_key

    # 2. Запрос к базе
    response = supabase.table("businesses") \
        .select("*") \
        .eq("category", category_key) \
        .eq("is_test", False) \
        .execute()
    
    businesses = response.data or []
    if not businesses:
        await query.message.reply_text("😕 В этой категории пока нет заведений.")
        return

    # 3. ЛОГИКА ФИЛЬТРАЦИИ
    if filter_type == "all":
        sorted_businesses = sort_businesses_alphabetically(businesses)
        title_prefix = "Все заведения"

    elif filter_type == "price":
        recommended = [b for b in businesses if b.get('is_recommended', False)]
        regular = [b for b in businesses if not b.get('is_recommended', False)]
        
        reverse_sort = (filter_direction != "low")
        
        # Сортируем твоим способом
        recommended.sort(key=lambda x: get_price_value(x.get('price_range', '')), reverse=reverse_sort)
        regular.sort(key=lambda x: get_price_value(x.get('price_range', '')), reverse=reverse_sort)
        
        sorted_businesses = recommended + regular
        title_prefix = "💰 По цене"

    elif filter_type == "open":
        # Здесь можно оставить твою сортировку или фильтрацию
        sorted_businesses = sort_businesses_alphabetically(businesses)
        title_prefix = "🕒 Сейчас открыты"

    elif filter_type == "distance":
        context.user_data['sort_category'] = category_key
        await query.message.reply_text("📍 Отправьте геолокацию для сортировки по расстоянию.")
        return
    
    else:
        sorted_businesses = sort_businesses_alphabetically(businesses)
        title_prefix = "Список"

    # 4. Сохраняем результат в кэш
    context.user_data["temp_businesses"] = sorted_businesses
    context.user_data["cached_sub"] = cache_key

    # 5. Передаем управление общей функции списка (там нумерация и кнопки)
    await show_businesses_by_subcategory(
        query=query,
        category_key=category_key,
        subcategory_key=title_prefix,
        context=context,
        page=0
    )
    




async def show_businesses_list(query_or_update, businesses, category_label, filter_title, category_key, show_distance=False):
    """Показать список заведений"""
    if hasattr(query_or_update, 'callback_query'):
        message = query_or_update.message
    elif hasattr(query_or_update, 'message'):
        message = query_or_update.message
    else:
        message = query_or_update
    
    if not businesses:
        await message.reply_text(
            f"🚫 В категории «{category_label}» ничего не найдено.",
            reply_markup=get_filter_keyboard(category_key)
        )
        return
    
    # Получаем координаты пользователя, если нужно показывать расстояние
    user_lat = None
    user_lon = None
    if show_distance:
        from handlers.formatters import get_user_location
        user_lat, user_lon = get_user_location()
    
    await message.reply_text(
        f"Вы выбрали: <b>{category_label}</b>\n"
        f"🔍 {filter_title}\n"
        f"📊 Найдено заведений: {len(businesses)}",
        parse_mode="HTML"
    )
    
    for i, biz in enumerate(businesses[:10], 1):
        # Форматируем карточку с расстоянием, если нужно
        text = f"<b>#{i}</b>\n" + format_business_card(
            biz,
            user_lat=user_lat,
            user_lon=user_lon,
            show_distance=show_distance
        )
        
        keyboard = []
        
        if biz.get('latitude') and biz.get('longitude'):
            keyboard.append([InlineKeyboardButton(
                "🗺 Показать на карте",
                url=f"https://maps.google.com/?q={biz['latitude']},{biz['longitude']}"
            )])
        
        contact = biz.get('contact', '')
        if contact:
            phone_match = re.search(r'[\+]?[\d\s\-\(\)]+', contact)
            if phone_match:
                phone = phone_match.group().replace(' ', '').replace('-', '').replace('(', '').replace(')', '')
                if len(re.sub(r'\D', '', phone)) >= 7:
                    if not phone.startswith('+'):
                        phone = '+84' + phone.lstrip('0')
                    keyboard.append([InlineKeyboardButton("📞 Позвонить", url=f"tel:{phone}")])
        
        reply_markup = InlineKeyboardMarkup(keyboard) if keyboard else None
        
        try:
            await message.reply_text(text, parse_mode="HTML", reply_markup=reply_markup, disable_web_page_preview=True)
        except Exception as e:
            logger.error(f"Ошибка отправки: {e}")
    
    if len(businesses) > 10:
        await message.reply_text(
            f"📊 Показаны первые 10 из {len(businesses)} заведений.\n"
            "Для более точного поиска используйте команду /search",
            parse_mode="HTML"
        )
    
    nav_keyboard = InlineKeyboardMarkup([
        [InlineKeyboardButton("⬅️ Вернуться к фильтрам", callback_data=f"cat_{category_key}")],
        [InlineKeyboardButton("🏠 Главное меню", callback_data="main_menu")]
    ])
    
    await message.reply_text("Что дальше?", reply_markup=nav_keyboard)
    

async def handle_user_location_for_sorting(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Обработка геолокации для сортировки"""
    location = update.message.location
    latitude = location.latitude
    longitude = location.longitude
    
    category_key = context.user_data.get('sort_category')
    sort_direction = context.user_data.get('sort_direction')
    
    if not category_key:
        return
    
    businesses = await get_businesses_by_category(category_key)
    
    # Рассчитываем расстояние для каждого бизнеса
    from math import radians, sin, cos, sqrt, atan2
    
    for biz in businesses:
        if biz.get('latitude') and biz.get('longitude'):
            lat1, lon1 = radians(latitude), radians(longitude)
            lat2, lon2 = radians(biz['latitude']), radians(biz['longitude'])
            dlat = lat2 - lat1
            dlon = lon2 - lon1
            a = sin(dlat / 2) ** 2 + cos(lat1) * cos(lat2) * sin(dlon / 2) ** 2
            c = 2 * atan2(sqrt(a), sqrt(1 - a))
            distance_km = c * 6371
            biz['distance_km'] = round(distance_km, 1)
            biz['distance_m'] = round(distance_km * 1000)
        else:
            biz['distance_km'] = 999
    
    # Сортируем по расстоянию
    reverse = (sort_direction == "far")
    businesses.sort(key=lambda x: x.get('distance_km', 999), reverse=reverse)
    
    category_data = CATEGORIES_DATA.get(category_key)
    category_label = category_data["label"] if category_data else category_key
    filter_title = "📍 Сначала дальние" if reverse else "📍 Сначала ближайшие"
    
    # Очищаем временные данные
    del context.user_data['sort_category']
    del context.user_data['sort_direction']
    
    await show_businesses_list(update, businesses, category_label, filter_title, category_key, show_distance=True)


async def handle_other_callbacks(query, data):
    """Обработка остальных callback_data"""
    print(f"🔍 handle_other_callbacks вызвана с data={data}")  # ПРИНТ
    
    if data == "advertise":
        print("📢 Обработка advertise")
        await show_advertise_info(query)
    elif data == "price_list":
        print("💰 Обработка price_list")
        await show_price_list(query)
    elif data == "pdf":
        print("📄 Обработка pdf")
        await show_pdf_info(query)
    elif data == "my_id":
        print(f"🆔 Обработка my_id, user_id={query.from_user.id}")  # ПРИНТ
        await show_my_id(query)
    elif data == "about":
        print("ℹ️ Обработка about")
        await show_about_info(query)
    elif data == "buy":
        print("💳 Обработка buy")
        await query.message.reply_text(
            "💳 <b>Оплата услуг</b>\n\n"
            "Здесь вы сможете оплатить премиум-доступ.\n"
            "Функция в разработке.",
            reply_markup=get_back_button(),
            parse_mode="HTML"
        )
    else:
        print(f"❓ Неизвестная кнопка: {data}, проверяю маппинг категорий")
        # Маппинг callback_data из главного меню на категории
        category_mappings = {
            'recommended': 'recommended', 'housing': 'housing', 'food': 'food',
            'spa': 'spa', 'beauty': 'beauty', 'transport': 'transport',
            'tours': 'tours', 'entertainment': 'fun', 'kids': 'kids',
            'health': 'health', 'exchange': 'exchange', 'legal': 'legal',
            'services': 'services', 'chats': 'chats', 'tips': 'tips'
        }
        
        if data in category_mappings:
            category_key = category_mappings.get(data)
            print(f"📂 Маппинг: {data} -> {category_key}")
            if category_key in CATEGORIES_DATA:
                await show_category_filter_menu(query, category_key)
            else:
                print(f"❌ Категория {category_key} не найдена в CATEGORIES_DATA")
                await query.message.reply_text(
                    f"🚧 Раздел «{data}» находится в разработке.",
                    reply_markup=get_back_button()
                )
        else:
            print(f"❌ Нет маппинга для {data}")
            await query.message.reply_text(
                f"🚧 Раздел «{data}» находится в разработке.",
                reply_markup=get_back_button()
            )

async def show_advertise_info(query):
    """Информация о рекламе"""
    await query.message.reply_text(
        "📢 <b>Реклама в боте</b>\n\n"
        "Разместите информацию о вашем бизнесе в нашем боте!\n\n"
        "✅ Тысячи активных пользователей\n"
        "✅ Целевая аудитория туристов и экспатов\n"
        "✅ Гибкие тарифы\n\n"
        "Нажмите кнопку ниже для детальной информации.",
        reply_markup=get_promo_keyboard(),
        parse_mode="HTML"
    )


async def show_price_list(query):
    """Прайс-лист на рекламу"""
    price_message = (
        "💰 <b>Детальный прайс-лист</b>\n\n"
        "🔹 Размещение в категории: 50,000 VND/месяц\n"
        "🔹 Приоритетное отображение: 100,000 VND/месяц\n"
        "🔹 Реклама с геолокацией: 150,000 VND/месяц\n"
        "🔹 Полный пакет: 200,000 VND/месяц"
    )
    
    keyboard = [
        [InlineKeyboardButton("📝 Оставить заявку", url="https://t.me/dekavetel")],
        [InlineKeyboardButton("⬅️ Назад", callback_data='advertise')]
    ]
    await query.message.reply_text(price_message, reply_markup=InlineKeyboardMarkup(keyboard), parse_mode="HTML")


async def show_pdf_info(query):
    """Информация о PDF гайде"""
    pdf_message = (
        "📄 <b>PDF-гид по Ня Чангу</b>\n\n"
        "Подробный путеводитель включает:\n"
        "• Лучшие рестораны и кафе\n"
        "• Экскурсии и достопримечательности\n"
        "• Практические советы\n"
        "• Карты и контакты\n"
        "• Актуальные цены"
    )
    
    keyboard = [
        [InlineKeyboardButton("📥 Скачать PDF", url="https://drive.google.com/your-link")],
        [InlineKeyboardButton("⬅️ Назад", callback_data='main_menu')]
    ]
    await query.message.reply_text(pdf_message, reply_markup=InlineKeyboardMarkup(keyboard), parse_mode="HTML")


async def show_my_id(query):
    """Показать ID пользователя"""
    user_id = query.from_user.id
    print(f"🆔 Показываю ID пользователя: {user_id}")  # ПРИНТ
    await query.message.reply_text(
        f"🆔 Ваш Telegram ID: <code>{user_id}</code>",
        reply_markup=get_back_button(),
        parse_mode="HTML"
    )


async def show_about_info(query):
    """Информация о боте"""
    await query.message.reply_text(
        "ℹ️ <b>О нашем боте</b>\n\n"
        "Мы помогаем туристам и экспатам в Ня Чанге найти лучшие места для:\n"
        "• Еды и развлечений\n"
        "• Красоты и здоровья\n"
        "• Жилья и услуг\n"
        "• И многого другого!\n\n"
        "Бот постоянно обновляется новыми заведениями.",
        reply_markup=get_back_button(),
        parse_mode="HTML"
    )