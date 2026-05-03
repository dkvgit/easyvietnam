import re

# Можешь расширить этот список, чтобы базовое определение работало точнее
CATEGORY_MAP = {
    "массаж": ("beauty", "massage"),
    "massage": ("beauty", "massage"),
    "спа-салон": ("beauty", "spa"),
    "spa": ("beauty", "spa"),
    "ресторан": ("food", "restaurant"),
    "кафе": ("food", "cafe"),
    "бар": ("food", "bars"),
    "ночной клуб": ("fun", "nightclub"),
    "nightclub": ("fun", "nightclub"),
    "парк": ("fun", "themepark"),
    "зоопарк": ("fun", "zoo"),
    "бильярд": ("fun", "billiard"),
    "billiard": ("fun", "billiard"),
    "казино": ("fun", "casino"),
    "casino": ("fun", "casino"),
}

def clean_name(name: str) -> str:
    """Чистит иероглифы, сохраняя приписки через дефис."""
    if not name: return ""
    name = re.sub(r'\s?\([^\)]*[\u3040-\u30ff\u3400-\u4dbf\u4e00-\u9fff\uac00-\ud7af\uff00-\uffef][^\)]*\)', '', name)
    name = re.sub(r'[\u3040-\u30ff\u3400-\u4dbf\u4e00-\u9fff\uac00-\ud7af\uff00-\uffef]+', '', name)
    name = re.sub(r'\s?\(\s?\)', '', name)
    name = re.sub(r'\s+', ' ', name)
    return name.strip()

def get_category_info(raw_type: str, raw_title: str = None):
    """Определяет базовую категорию. Если не найдено - ставит заглушку."""
    key = raw_type.lower().strip() if raw_type else ""
    
    # ❗ ИСПРАВЛЕНО: Убрали принудительный "beauty".
    # Теперь ставим "other", если совпадений нет.
    category, subcategory = ("other", "service")
    
    for map_key, (cat, sub) in CATEGORY_MAP.items():
        if map_key in key:
            category, subcategory = cat, sub
            break
            
    return {
        "category": category,
        "subcategory": subcategory,
        "cuisine": raw_type.strip() if raw_type else "Service",
        "clean_title": clean_name(raw_title)
    }

def map_category(raw_type: str):
    info = get_category_info(raw_type)
    return info["category"], info["subcategory"], info["cuisine"]