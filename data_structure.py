# D:\aRabota\TelegaBoom\08_gid\data_structure.py

# ============================================
# КАТЕГОРИИ (единая структура)
# ============================================

CATEGORIES = {
	"stay": {  # 👈 ДОБАВЬ ЭТО
        "id": "stay",
        "emoji": "🏨",
        "name": "Отели",
        "filters": ["all", "price_low", "price_high", "open_now", "distance_near"],
        "sort": "alphabetical",
        "has_subcategories": False,
        "subcategories": ["hotel", "apartment", "villa" ]
    },
	"recommended": {
		"id": "recommended",
		"emoji": "📍",
		"name": "Рекомендуем",
		"filters": ["all", "price_low", "price_high", "open_now"],
		"sort": "recommended_first"
	},
	"housing": {
	    "id": "housing",
	    "emoji": "🏠",
	    "name": "Отели / Жильё",
	    "filters": ["all", "price_low", "price_high", "open_now", "distance_near"],
	    "sort": "alphabetical",
	    "has_subcategories": True,  # 👈 ВКЛЮЧАЕМ ПОДКАТЕГОРИИ
	    "subcategories": ["hotel",  "apartment", "villa"]  # 👈 ДОБАВЛЯЕМ
	},
	
	"food": {
		"id": "food",
		"emoji": "🍜",
		"name": "Кафе и рестораны",
		"filters": ["all", "price_low", "price_high", "open_now", "distance_near"],
		"sort": "alphabetical",
		"has_subcategories": True,
		# Мы добавили: russian, restaurant, breakfast
		"subcategories": ["cafe", "restaurant", "bars"]
	},
	"spa": {
		"id": "spa",
		"emoji": "💆",
		"name": "SPA и массаж",
		"filters": ["all", "price_low", "price_high", "open_now", "distance_near"],
		"sort": "alphabetical",
		"has_subcategories": False,
		"subcategories": []
	},
	"beauty": {
		"id": "beauty",
		"emoji": "💅",
		"name": "Красота",
		"filters": ["all", "price_low", "price_high", "open_now"],
		"sort": "alphabetical",
		"has_subcategories": True,
		"subcategories": ["nails", "hair", "cosmetic", "lashes"]
	},
	"transport": {
		"id": "transport",
		"emoji": "🛵",
		"name": "Транспорт",
		"filters": ["all", "price_low", "open_now"],
		"sort": "alphabetical"
	},
	"tours": {
		"id": "tours",
		"emoji": "🧳",
		"name": "Экскурсии",
		"filters": ["all", "price_low", "open_now"],
		"sort": "alphabetical"
	},
	"fun": {
        "id": "fun",
        "emoji": "🎯",
        "name": "Развлечения",
        "filters": ["all", "price_low", "price_high", "open_now", "distance_near"],
        "sort": "alphabetical",
        "has_subcategories": True,
        "subcategories": [
            "karaoke",
            "billiard",
            "casino",
            "nightclub",
            "themepark",
            "zoo",
            "museum",
            "playground",
            "hotsprings",
            "active",
            "cinema",
            "bowling",
            "boardgames",
            "touragency"
        ]
    },
	"kids": {
		"id": "kids",
		"emoji": "🧒",
		"name": "Дети",
		"filters": ["all", "open_now"],
		"sort": "alphabetical"
	},
	"health": {
		"id": "health",
		"emoji": "💊",
		"name": "Здоровье",
		"filters": ["all", "open_now", "distance_near"],
		"sort": "alphabetical",
		"has_subcategories": True,
		"subcategories": ["pharmacy", "hospital"]
	},
	
	"finance": {
		"id": "finance",
		"emoji": "💵",
		"name": "Финансы",
		"filters": ["all", "open_now", "distance_near"],
		"sort": "alphabetical",
		"has_subcategories": True,
		"subcategories": ["bank", "currency_exchange"]
	},
	"legal": {
		"id": "legal",
		"emoji": "📋",
		"name": "Визы и документы",
		"filters": ["all", "open_now"],
		"sort": "alphabetical"
	},
	"services": {
		"id": "services",
		"emoji": "🛠",
		"name": "Услуги",
		"filters": ["all", "open_now", "distance_near"],
		"sort": "alphabetical"
	},
	"chats": {
		"id": "chats",
		"emoji": "📱",
		"name": "Чаты",
		"filters": ["all"],
		"sort": "alphabetical"
	},
	"tips": {
		"id": "tips",
		"emoji": "💡",
		"name": "Советы",
		"filters": ["all"],
		"sort": "alphabetical"
	},
	
	"predictions": {
		"id": "predictions",
		"emoji": "🔮",
		"name": "Предсказания",
		"filters": ["all", "price_low", "price_high", "distance_near"],
		"sort": "alphabetical",
		"has_subcategories": True,
		"subcategories": ["tarot", "astrology", "numerology", "palmistry"]
	},
	
}

# ============================================
# ПОДКАТЕГОРИИ
# ============================================

SUBCATEGORIES = {
	
	# Для finance (Финансы)
    "bank": {"name": "Банки", "parent": "finance"},
    "currency_exchange": {"name": "Обмен валюты", "parent": "finance"},
  
	
	# Для fun (Развлечения)
    "karaoke": {"name": "🎤 Караоке", "parent": "fun"},
    "billiard": {"name": "🎱 Бильярд", "parent": "fun"},
    "casino": {"name": "🎰 Казино", "parent": "fun"},
    "nightclub": {"name": "💃 Ночные клубы", "parent": "fun"},
    "themepark": {"name": "🎡 Парки аттракционов", "parent": "fun"},
    "zoo": {"name": "🦁 Зоопарки", "parent": "fun"},
    "museum": {"name": "🏛 Музеи и культура", "parent": "fun"},
    "playground": {"name": "🎈 Детские площадки", "parent": "fun"},
    "hotsprings": {"name": "♨️ Термальные ванны", "parent": "fun"},
    "active": {"name": "🧗 Активный отдых", "parent": "fun"},
    "cinema": {"name": "🎬 Кинотеатры", "parent": "fun"},
    "bowling": {"name": "🎳 Боулинг", "parent": "fun"},
    "boardgames": {"name": "🎲 Настольные игры", "parent": "fun"},
    "touragency": {"name": "🗺 Туры и экскурсии", "parent": "fun"},
	"beach": {"name": "🏖 Пляж", "parent": "fun"},
	
	# Для health (Здоровье)
    "pharmacy": {"name": "💊 Аптеки", "parent": "health"},
    "hospital": {"name": "🏥 Больницы / Врачи", "parent": "health"},
    # Для spa
    "spa": {"name": "💆 SPA и массаж", "parent": "spa"},
    
    # Для food
    "vietnamese": {"name": "🍜 Вьетнамская", "parent": "food"},
    "european": {"name": "🍕 Европейская", "parent": "food"},
    "asian": {"name": "🍱 Азиатская", "parent": "food"},
    "cafe": {"name": "☕️ Кафе", "parent": "food"},
    "bars": {"name": "🍺 Бары", "parent": "food"},
    "russian": {"name": "🪆 Русская", "parent": "food"},
    "restaurant": {"name": "🍽 Рестораны", "parent": "food"},
    "breakfast": {"name": "🍳 Завтраки", "parent": "food"},
    
    # Для housing
    "hotel": {"name": "🏨 Отели", "parent": "housing"},
    "apartment": {"name": "🏢 Апартаменты", "parent": "housing"},
    "villa": {"name": "🏡 Виллы", "parent": "housing"},
    
    # Для beauty
    "nails": {"name": "💅 Маникюр / Педикюр", "parent": "beauty"},
    "hair": {"name": "💇‍♀️ Парикмахерские", "parent": "beauty"},
    "cosmetic": {"name": "💄 Салоны красоты", "parent": "beauty"},
    "lashes": {"name": "👁 Брови/Ресницы", "parent": "beauty"},


    
    # Для predictions (Предсказания)
    "tarot": {"name": "🔮 Таро", "parent": "predictions"},
    "astrology": {"name": "✨ Астрология", "parent": "predictions"},
    "numerology": {"name": "🔢 Нумерология", "parent": "predictions"},
    "palmistry": {"name": "🖐 Хиромантия", "parent": "predictions"},
}
# ============================================
# ФИЛЬТРЫ
# ============================================

FILTERS = {
	"all": {"name": "📋 Все заведения", "callback": "all"},
	"price_low": {"name": "💰 Сначала дешевые", "callback": "price_low"},
	"price_high": {"name": "💰 Сначала дорогие", "callback": "price_high"},
	"open_now": {"name": "🕒 Работающие сейчас", "callback": "open_now"},
	"distance_near": {"name": "📍 Ближайшие", "callback": "distance_near"},
	"distance_far": {"name": "📍 Дальние", "callback": "distance_far"}
}

# ============================================
# ЭМОДЗИ ДЛЯ КАРТОЧЕК (для formatters.py)
# ============================================

CATEGORY_EMOJIS = {
	"food": "🍜", "housing": "🏠", "exchange": "💵", "health": "💊",
	"transport": "🛵", "beauty": "💇", "spa": "💆", "fun": "🎯",
	"services": "💼", "chats": "📱", "recommended": "⭐", "tours": "🧳",
	"kids": "🧒", "legal": "📋", "tips": "💡", "predictions": "🔮", "stay": "🏨",
}

# ============================================
# ПОРЯДОК КНОПОК В ГЛАВНОМ МЕНЮ
# ============================================

MAIN_MENU_ORDER = [
	"recommended", "housing",
	"food", "spa",
	"beauty", "transport",
	"tours", "fun",
	"kids", "health",
	"finance", "predictions",
	"legal",
	"services", "chats",
	"tips",
	
	
]

# ============================================
# ДЛЯ СОВМЕСТИМОСТИ СО СТАРЫМ КОДОМ
# ============================================

# Старый формат CATEGORIES_DATA (для обратной совместимости)
CATEGORIES_DATA = {
    key: {
        "label": f"{data['emoji']} {data['name']}",
        "has_subcategories": data.get("has_subcategories", False),
        "subs": data.get("subcategories", [])  # 👈 ДОБАВЬ ЭТО
    }
    for key, data in CATEGORIES.items()
}

# Старый MESSAGES (для обратной совместимости)
MESSAGES = {
	"welcome": "👋 Добро пожаловать!",
	"promo": "📢 Узнайте, как разместить рекламу в нашем боте!"
}


# ============================================
# НАВИГАЦИОННЫЕ КНОПКИ
# ============================================

NAVIGATION = {
	"back": {"text": "⬅️ Назад", "callback": "back"},
	"main_menu": {"text": "🏠 Главное меню", "callback": "main_menu"},
	"back_to_filters": {"text": "⬅️ К фильтрам", "callback": "back_to_filters"}
}