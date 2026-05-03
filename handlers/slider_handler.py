from telegram import InlineKeyboardButton, InlineKeyboardMarkup, Update
from telegram.ext import CallbackContext
from handlers.formatters import format_business_card


def get_business_slider_keyboard(index, total, lat=None, lon=None, category_key=None, subcategory_name=None):
    """Клавиатура для слайдера с кнопками навигации"""
    buttons = []

    # Кнопки навигации по слайдеру
    nav_buttons = []
    if index > 0:
        nav_buttons.append(InlineKeyboardButton("◀️ Назад", callback_data=f"slider_{index - 1}"))
    if index < total - 1:
        nav_buttons.append(InlineKeyboardButton("▶️ Далее", callback_data=f"slider_{index + 1}"))
    if nav_buttons:
        buttons.append(nav_buttons)

    # Кнопка "К списку (Астрология)" - без эмодзи в названии
    if category_key and subcategory_name:
        # Убираем эмодзи из названия (если есть)
        clean_name = subcategory_name
        # Удаляем эмодзи в начале строки (например "🔮 Таро" -> "Таро")
        if clean_name and len(clean_name) > 2 and clean_name[0] in ['🔮', '✨', '🔢', '🖐']:
            clean_name = clean_name[2:]  # убираем эмодзи и пробел
        buttons.append([InlineKeyboardButton(
            f"⬅️ К списку ({clean_name})",
            callback_data=f"cat_{category_key}"
        )])
    elif category_key:
        buttons.append([InlineKeyboardButton(
            "⬅️ К списку",
            callback_data=f"cat_{category_key}"
        )])

    # Кнопка "Главное меню"
    buttons.append([InlineKeyboardButton("🏠 Главное меню", callback_data="main_menu")])

    # Кнопка карты
    if lat and lon:
        buttons.append([InlineKeyboardButton("📍 На карте", url=f"https://maps.google.com/?q={lat},{lon}")])

    return InlineKeyboardMarkup(buttons)



async def show_business_slider(update: Update, context: CallbackContext, businesses, index=0, category_key=None, subcategory_name=None):
    """Показывает слайдер с заведениями"""
    if not businesses:
        return
    
    # Получаем координаты пользователя для отображения расстояния
    from handlers.formatters import get_user_location
    user_lat, user_lon = get_user_location()
    
    business = businesses[index]
    
    # Форматируем карточку с расстоянием
    text = f"<b>#{index + 1}</b>\n" + format_business_card(
        business,
        user_lat=user_lat,
        user_lon=user_lon,
        show_distance=True
    )

    lat = business.get("latitude")
    lon = business.get("longitude")

    reply_markup = get_business_slider_keyboard(index, len(businesses), lat, lon, category_key, subcategory_name)

    if hasattr(update, 'callback_query') and update.callback_query:
        await update.callback_query.edit_message_text(
            text=text, parse_mode="HTML", reply_markup=reply_markup, disable_web_page_preview=True
        )
    elif hasattr(update, "message"):
        await update.message.reply_text(
            text=text, parse_mode="HTML", reply_markup=reply_markup, disable_web_page_preview=True
        )
    else:
        await update.edit_message_text(
            text=text, parse_mode="HTML", reply_markup=reply_markup, disable_web_page_preview=True
        )
        
        


async def handle_slider_callback(update: Update, context: CallbackContext):
    """Обработчик навигации по слайдеру"""
    query = update.callback_query
    await query.answer()

    data = query.data
    if not data.startswith("slider_"):
        return

    index = int(data.split("_")[1])
    businesses = context.user_data.get("slider_businesses", [])
    category_key = context.user_data.get("current_category")  # сохраняем категорию при вызове

    if not businesses or index >= len(businesses):
        await query.edit_message_text("❌ Ошибка загрузки данных.")
        return

    await show_business_slider(update=update, context=context, businesses=businesses, index=index, category_key=category_key)