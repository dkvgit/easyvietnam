# D:\aRabota\TelegaBoom\08_gid\script_googleMaps_res_poluavt\category_map.py
import re

CATEGORY_MAP = {
    # --- РЕСТОРАНЫ (food, restaurant) ---
    "ресторан": ("food", "restaurant"),
    "вьетнамская кухня": ("food", "restaurant"),
    "ресторан вьетнамской кухни": ("food", "restaurant"),
    "азиатская кухня": ("food", "restaurant"),
    "русская кухня": ("food", "restaurant"),
    "итальянская кухня": ("food", "restaurant"),
    "европейская кухня": ("food", "restaurant"),
    "японская кухня": ("food", "restaurant"),
    "китайская кухня": ("food", "restaurant"),
    "индийская кухня": ("food", "restaurant"),
    "корейская кухня": ("food", "restaurant"),
    "морепродукты": ("food", "restaurant"),
    "seafood": ("food", "restaurant"),
    "пиццерия": ("food", "restaurant"),
    "pizza": ("food", "restaurant"),
    "стейк-хаус": ("food", "restaurant"),
    "steakhouse": ("food", "restaurant"),
    "барбекю": ("food", "restaurant"),
    "bbq": ("food", "restaurant"),
    "гриль": ("food", "restaurant"),
    "grill": ("food", "restaurant"),
    "суши": ("food", "restaurant"),
    "sushi": ("food", "restaurant"),
    "вегетарианская кухня": ("food", "restaurant"),
    "веганский ресторан": ("food", "restaurant"),

    # --- КАФЕ (food, cafe) ---
    "кафе": ("food", "cafe"),
    "кофейня": ("food", "cafe"),
    "coffee": ("food", "cafe"),
    "cafe": ("food", "cafe"),
    "закусочная": ("food", "cafe"),
    "стритфуд": ("food", "cafe"),
    "уличная еда": ("food", "cafe"),
    "фастфуд": ("food", "cafe"),
    "fast food": ("food", "cafe"),
    "мороженое": ("food", "cafe"),
    "десерты": ("food", "cafe"),
    "выпечка": ("food", "cafe"),
    "кондитерская": ("food", "cafe"),
    "пекарня": ("food", "cafe"),
    "bakery": ("food", "cafe"),
    "smoothie": ("food", "cafe"),
    "чайный дом": ("food", "cafe"),

    # --- БАРЫ И КЛУБЫ (food, bars / fun, nightclub) ---
    "бар": ("food", "bars"),
    "спорт-бар": ("food", "bars"),
    "спортивный бар": ("food", "bars"),
    "хостес-бар": ("food", "bars"),
    "паб": ("food", "bars"),
    "pub": ("food", "bars"),
    "винный бар": ("food", "bars"),
    "wine bar": ("food", "bars"),
    "пивоварня": ("food", "bars"),
    "brewery": ("food", "bars"),
    "пивной бар": ("food", "bars"),
    "beer": ("food", "bars"),
    "коктейль-бар": ("food", "bars"),
    "cocktail bar": ("food", "bars"),
    "пляжный клуб": ("food", "bars"),
    "beach club": ("food", "bars"),
    "дистрибьютор напитков": ("food", "bars"),
    "ночной клуб": ("fun", "nightclub"),
    "nightclub": ("fun", "nightclub"),
    "дискотека": ("fun", "nightclub"),

    # --- КРАСОТА И СПА (beauty, hair, ...) ---
    "массажный салон": ("beauty", "massage"),
    "massage": ("beauty", "massage"),
    "спа-салон": ("beauty", "spa"),
    "spa": ("beauty", "spa"),
    "салон красоты": ("beauty", "beauty_salon"),
    "beauty salon": ("beauty", "beauty_salon"),
    
    # Эти теперь летят в категорию hair, как ты и просил
    "парикмахерская": ("hair", "haircut"),
    "мужская парикмахерская": ("hair", "haircut"),
    "barbershop": ("hair", "haircut"),
    "барбершоп": ("hair", "haircut"),
    
    "ногтевая студия": ("beauty", "nail"),
    "маникюр": ("beauty", "nail"),
    "педикюр": ("beauty", "nail"),
    "nail": ("beauty", "nail"),
    "nails": ("beauty", "nail"),

    # --- РАЗВЛЕЧЕНИЯ (fun, ...) ---
    "караоке-бар": ("food", "bars"),
    "караоке": ("fun", "karaoke"),
    "karaoke": ("fun", "karaoke"),
    "бильярд": ("fun", "billiards"),
    "billiards": ("fun", "billiards"),
    "тренажерный зал": ("fun", "gym"),
    "фитнес-центр": ("fun", "gym"),
    "gym": ("fun", "gym"),
    "сауна": ("beauty", "spa"),
}

def clean_name(name: str) -> str:
    """
    Чистит только иероглифы.
    Оставляет дефисы и уточнения типа - Nails, - Nha Trang.
    """
    if not name:
        return ""
    
    # 1. Удаляем только те скобки, внутри которых есть иероглифы
    # 'Nora (네일아트) - Nails' -> 'Nora  - Nails'
    name = re.sub(r'\s?\([^\)]*[\u3040-\u30ff\u3400-\u4dbf\u4e00-\u9fff\uac00-\ud7af\uff00-\uffef][^\)]*\)', '', name)
    
    # 2. Удаляем любые одиночные иероглифы, если они не в скобках
    name = re.sub(r'[\u3040-\u30ff\u3400-\u4dbf\u4e00-\u9fff\uac00-\ud7af\uff00-\uffef]+', '', name)
    
    # 3. Удаляем пустые скобки, которые могли остаться (на всякий случай)
    name = re.sub(r'\s?\(\s?\)', '', name)
    
    # 4. Убираем двойные пробелы, которые могли возникнуть после удаления символов
    name = re.sub(r'\s+', ' ', name)
    
    return name.strip()


def get_category_info(raw_type: str, raw_title: str = None):
    """
    Обновленная функция: возвращает чистое от иероглифов название,
    но сохраняет все важные приписки через дефис.
    """
    key = raw_type.lower().strip() if raw_type else ""
    
    category, subcategory = ("food", "restaurant")
    
    for map_key, (cat, sub) in CATEGORY_MAP.items():
        if map_key in key:
            category, subcategory = cat, sub
            break
            
    # Формируем подзаголовок (cuisine)
    if category == "beauty" and any(word in key for word in ["маникюр", "педикюр", "nail", "ногт"]):
        cuisine = "Маникюр и педикюр"
    else:
        cuisine = raw_type.strip().capitalize() if raw_type else ""

    return {
        "category": category,
        "subcategory": subcategory,
        "cuisine": cuisine,
        "clean_title": clean_name(raw_title) # Здесь теперь сохраняются Nails и Nha Trang
    }


def map_category(raw_type: str):
    """
    Обертка для обратной совместимости.
    Возвращает кортеж (category, subcategory, cuisine).
    """
    info = get_category_info(raw_type)
    return info["category"], info["subcategory"], info["cuisine"]