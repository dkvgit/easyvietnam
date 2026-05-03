#D:\aRabota\TelegaBoom\08_gid\keyboards.py

from telegram import ReplyKeyboardMarkup, KeyboardButton
from telegram import InlineKeyboardMarkup, InlineKeyboardButton
from data_structure import CATEGORIES, FILTERS, NAVIGATION, MAIN_MENU_ORDER, SUBCATEGORIES


def get_main_menu():
    """Главное меню"""
    keyboard = []
    current_row = []
    
    for key in MAIN_MENU_ORDER:
        if key not in CATEGORIES:
            continue
        data = CATEGORIES[key]
        button = InlineKeyboardButton(
            f"{data['emoji']} {data['name']}",
            callback_data=f"cat_{key}"
        )
        current_row.append(button)
        
        if len(current_row) == 2:
            keyboard.append(current_row)
            current_row = []
    
    if current_row:
        keyboard.append(current_row)
    
    # Разделитель
    keyboard.append([InlineKeyboardButton("• • •", callback_data="dummy")])
    
    # Нижнее меню
    keyboard.append([
        InlineKeyboardButton("📄 PDF", callback_data="pdf"),
        InlineKeyboardButton("💼 Реклама", callback_data="advertise")
    ])
    keyboard.append([
        InlineKeyboardButton("🆔 Мой ID", callback_data="my_id"),
        InlineKeyboardButton("ℹ️ О нас", callback_data="about")
    ])
    keyboard.append([
        InlineKeyboardButton("💳 Оплата", callback_data="buy"),
        InlineKeyboardButton("💬 Поддержка", url="https://t.me/your_support_bot")
    ])
    
    return InlineKeyboardMarkup(keyboard)


def get_filter_keyboard(category_key):
    """Клавиатура фильтров и ПОДКАТЕГОРИЙ для категории"""
    category = CATEGORIES.get(category_key)
    if not category:
        return get_back_button()
    
    keyboard = []
    
    # 1. Сначала добавляем ПОДКАТЕГОРИИ (банки, обменники и т.д.)
    # Именно тут мы берем правильные ключи типа currency_exchange
    for sub_key in category.get("subcategories", []):
        sub_info = SUBCATEGORIES.get(sub_key)
        if sub_info:
            keyboard.append([InlineKeyboardButton(
                sub_info["name"],
                callback_data=f"subcat_{category_key}_{sub_key}"
            )])

    # 2. Затем добавляем ОБЩИЕ ФИЛЬТРЫ (работающие сейчас, рядом)
    for filter_key in category.get("filters", ["all"]):
        filter_data = FILTERS.get(filter_key)
        if filter_data:
            keyboard.append([InlineKeyboardButton(
                filter_data["name"],
                callback_data=f"filter_{category_key}_{filter_key}"
            )])
    
    # Кнопка "Главное меню"
    keyboard.append([InlineKeyboardButton(
        NAVIGATION["main_menu"]["text"],
        callback_data=NAVIGATION["main_menu"]["callback"]
    )])
    
    return InlineKeyboardMarkup(keyboard)

def get_back_button(back_callback="main_menu"):
    """Универсальная кнопка назад"""
    return InlineKeyboardMarkup([[
        InlineKeyboardButton(NAVIGATION["back"]["text"], callback_data=back_callback)
    ]])


def get_back_to_filters_button(category_key):
    """Кнопка возврата к фильтрам"""
    return InlineKeyboardMarkup([[
        InlineKeyboardButton(
            NAVIGATION["back_to_filters"]["text"],
            callback_data=f"cat_{category_key}"
        )
    ]])


def get_quick_menu():
    """Быстрое меню для /guide"""
    keyboard = []
    current_row = []
    
    for key in MAIN_MENU_ORDER[:6]:
        if key not in CATEGORIES:
            continue
        data = CATEGORIES[key]
        button = InlineKeyboardButton(
            f"{data['emoji']} {data['name']}",
            callback_data=f"cat_{key}"
        )
        current_row.append(button)
        
        if len(current_row) == 3:
            keyboard.append(current_row)
            current_row = []
    
    if current_row:
        keyboard.append(current_row)
    
    # Единая кнопка "Главное меню"
    keyboard.append([InlineKeyboardButton(
        NAVIGATION["main_menu"]["text"],
        callback_data=NAVIGATION["main_menu"]["callback"]
    )])
    
    return InlineKeyboardMarkup(keyboard)


def get_category_keyboard():
    """Для совместимости"""
    return get_main_menu()


def get_promo_keyboard():
    """Клавиатура для рекламы"""
    keyboard = [
        [InlineKeyboardButton("📝 Оставить заявку", url="https://t.me/dekavetel")],
        [InlineKeyboardButton("💰 Прайс-лист", callback_data="price_list")],
        [InlineKeyboardButton(NAVIGATION["back"]["text"], callback_data="main_menu")]
    ]
    return InlineKeyboardMarkup(keyboard)


def get_pdf_keyboard():
    """Клавиатура для PDF"""
    keyboard = [
        [InlineKeyboardButton("📥 Скачать PDF-гайд", url="https://drive.google.com/your-pdf-link")],
        [InlineKeyboardButton(NAVIGATION["back"]["text"], callback_data="main_menu")]
    ]
    return InlineKeyboardMarkup(keyboard)


from telegram import ReplyKeyboardMarkup, KeyboardButton

# keyboards.py
def get_location_keyboard():
    keyboard = [
        [KeyboardButton("📍 Отправить локацию", request_location=True)],
        ["🏠 Главное меню"]
    ]
    return ReplyKeyboardMarkup(
        keyboard,
        resize_keyboard=True,
        one_time_keyboard=True  # Кнопка скроется после нажатия
    )