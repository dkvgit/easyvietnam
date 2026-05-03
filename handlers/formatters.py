# D:\aRabota\TelegaBoom\08_gid\handlers\formatters.py

from data_structure import CATEGORY_EMOJIS
from datetime import datetime
import re
import urllib.parse
import math
import requests
import time


# Кэш курса валют
_usd_rate_cache = {
    'rate': 25500,
    'updated_at': 0
}

def get_usd_to_vnd_rate():
    """Получает актуальный курс USD к VND с кэшем на 1 час"""
    import time
    current_time = time.time()
    
    # Обновляем раз в час
    if current_time - _usd_rate_cache['updated_at'] > 3600:
        try:
            import requests
            response = requests.get('https://api.exchangerate-api.com/v4/latest/USD', timeout=5)
            data = response.json()
            _usd_rate_cache['rate'] = data['rates'].get('VND', 25500)
            _usd_rate_cache['updated_at'] = current_time
            print(f"💰 Курс обновлен: 1$ = {_usd_rate_cache['rate']}₫")
        except Exception as e:
            print(f"⚠️ Ошибка получения курса: {e}, использую старый курс {_usd_rate_cache['rate']}₫")
    
    return _usd_rate_cache['rate']

def calculate_distance(lat1, lon1, lat2, lon2):
    """Расстояние между двумя точками в километрах"""
    if not all([lat1, lon1, lat2, lon2]):
        return None
    
    R = 6371  # Радиус Земли в км
    lat1_rad = math.radians(lat1)
    lat2_rad = math.radians(lat2)
    delta_lat = math.radians(lat2 - lat1)
    delta_lon = math.radians(lon2 - lon1)
    
    a = math.sin(delta_lat / 2)**2 + math.cos(lat1_rad) * math.cos(lat2_rad) * math.sin(delta_lon / 2)**2
    c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))
    
    return round(R * c, 1)

def clean_additional_info(info_text):
    """Очищает и форматирует текст additional_info"""
    if not info_text:
        return ""
    
    # 1. Базовая чистка артефактов
    info_text = re.sub(r'[-]', '', info_text)
    info_text = re.sub(r'[·•●]', '', info_text)
    info_text = re.sub(r'\s+', ' ', info_text)
    
    # 2. Удаление ЛГБТ-фраз (твой список)
    remove_phrases = [
        "это место отличается лояльностью к трансгендерам",
        "лояльность к трансгендерам",
        "лгбтк+;"
        "лгбтк+",
        "лгбтк",
        "трансгендерам",
        "лояльность к лгбтк+",
    ]
    result = info_text
    for phrase in remove_phrases:
        result = result.replace(phrase, "")
    
    # 3. Список замен (БЕЗ удаления точек и запятых на этом этапе)
    replacements = [
        ("Есть ", ""), ("есть ", ""), ("Здесь ", ""), ("здесь ", ""),
        ("В меню есть ", ""), ("в меню есть ", ""),
        ("Подходит, чтобы ", ""), ("Подходит для ", ""),
        ("Стоит ", "можно "), ("стоит ", "можно "),
        ("Здесь любят бывать ", ""), ("здесь любят бывать ", ""),
        ("Подходит, ", ""), ("подходит, ", ""),
        ("можно ", "можно "),
        ("указано, что владелец – ", ""), ("доступно ", ""), ("принимаются ", ""),
        ("кредитные карты", "оплата картой"),
        ("дебетовые карты", "оплата картой"),
        ("бесконтактная оплата (nfc) поддерживается", "оплата картой"),
    ]
    
    for old, new in replacements:
        result = result.replace(old, new)
    
    # 4. Разбиваем на пункты по запятой
    items = [item.strip() for item in result.split(',') if item.strip()]
    
    seen = set()
    unique_items = []
    
    # Твой словарь нормализации (полный, без изменений)
    normalize_map = {
        "парковка": "бесплатная парковка",
        "бесплатная парковка": "бесплатная парковка",
        "много мест для парковки": "бесплатная парковка",
        "нет входа с доступом для инвалидов-колясочников": "♿ нет доступа для инвалидов",
        "нет мест для инвалидов-колясочников": "♿ нет доступа для инвалидов",
        "нет парковки с доступом для инвалидов-колясочников": "♿ нет доступа для инвалидов",
        "нет индукционной петли для слуховых аппаратов": "♿ нет доступа для инвалидов",
        "доставка": "доставка",
        "бесконтактная доставка": "доставка",
        "туалет": "туалет",
        "общий туалет": "туалет",
        "wi-fi": "wi-fi",
        "бесплатный wi-fi": "wi-fi",
        "счастливые часы со скидками на еду": "счастливые часы",
        "счастливые часы со скидками на напитки": "счастливые часы",
        "оплата картой": "оплата картой",
        "хорошая винная карта": "хороший выбор вин",
        "хорошая пивная карта": "хороший выбор пива",
        "хорошая чайная карта": "хороший выбор чая",
        "можно с собаками на улице": "можно с собаками",
        "можно с собаками": "можно с собаками",
        "владелец – женщина": "владелица женщина",
        "владелец женщина": "владелица женщина",
    }
    
    for item in items:
        # Убираем точку в конце конкретного пункта, а не во всем тексте сразу
        item_lower = item.lower().strip().replace(".", "")
        
        if item_lower in ["пов", "пов одиночку", "другое", "", "кредитные карты", "трансгендерам", "лгбтк+"]:
            continue
        
        # Твои условия для еды
        if "одиночку" in item_lower:
            item_lower = "можно поесть в одиночку"
        elif item_lower == "пообедать":
            item_lower = "можно пообедать"
        elif item_lower == "поужинать":
            item_lower = "можно поужинать"
        elif "позавтракать" in item_lower:
            item_lower = "можно позавтракать"
        elif "закуски" in item_lower and "хорошие десерты" not in seen:
            item_lower = "закуски"
        elif "десерты" in item_lower and "хорошие десерты" not in seen:
            item_lower = "хорошие десерты"
        
        # Маппинг
        for key, value in normalize_map.items():
            if key in item_lower:
                item_lower = value
                break
        
        if item_lower not in seen:
            seen.add(item_lower)
            unique_items.append(item_lower)
    
    if not unique_items:
        return ""

    # Форматирование (первый с Большой, остальные через запятую)
    formatted_items = []
    for i, item in enumerate(unique_items):
        if i == 0:
            formatted_items.append(item.capitalize())
        else:
            formatted_items.append(item)
    
    return ", ".join(formatted_items)


def format_business_card(business, user_lat=None, user_lon=None, show_distance=True):
    """
    Форматирует карточку заведения.
    Добавлены логи для отладки расстояния в консоль.
    """
    import re
   
    
    def clean_review_text(text):
        if not text:
            return ""
        text = re.sub(r'Ещё|Тип заказа|Еда:\s?\d|Сервис:\s?\d|Атмосфера:\s?\d', '', text)
        return re.sub(r'\s+', ' ', text).strip()

    # Основные данные
    title = business.get('title', 'Без названия')
    rating = business.get('rating')
    reviews_count = business.get('reviews_count')
    additional_info = business.get('additional_info', '')
    contact = business.get('contact', '')
    price_range = business.get('price_range', '')
    working_hours = business.get('working_hours', '')
    address = business.get('address', '')
    description = business.get('description', '')
    category = business.get('category', '')
    is_recommended = business.get('is_recommended', False)
    cuisine = business.get('cuisine', '')
    
    # Координаты заведения
    try:
        lat = float(business.get('latitude')) if business.get('latitude') else None
        lon = float(business.get('longitude')) if business.get('longitude') else None
    except (ValueError, TypeError):
        lat, lon = None, None

    from data_structure import CATEGORY_EMOJIS
    emoji = CATEGORY_EMOJIS.get(category, '📍')

    # 1. Заголовок
    if is_recommended:
        text = f"{emoji} <b>{title}</b> ⭐ <i>Рекомендуем</i>"
    else:
        text = f"{emoji} <b>{title}</b>"
    
    if rating:
        text += f"  ⭐ {rating}"
        if reviews_count:
            text += f" ({reviews_count})"
    text += "\n"

    # 2. ПОДЗАГОЛОВОК
    if cuisine:
        text += f" {cuisine}\n"

    text += "━━━━━━━━━━━━━━\n"
    
    # Специальное для жилья (Отели)
    if category in ['housing', 'stay']:
        subcategory = business.get('subcategory', '')
        sub_names = {'hotel': ' Отель', 'villa': ' Виллы', 'apartment': ' Апартаменты'}
        text += f"{sub_names.get(subcategory, '🏨 Отель')}\n"
    
    # Удобства (только для жилья)
    if category in ['housing', 'stay']:
        amenities = business.get('amenities', [])
        if amenities:
            text += f"✨ <b>Удобства:</b>\n"
            for amenity in amenities[:10]:
                text += f"  • {amenity}\n"
            text += "\n"
    
    # 4. Доп. инфо
    if additional_info:
        
        cleaned_info = clean_additional_info(additional_info)
        if cleaned_info:
            text += f"ℹ️ {cleaned_info}\n\n"
    
    # 5. Цена
    if price_range and price_range.strip() not in ['Р', '', '1 000 000 ₫+']:
        digits = re.sub(r'[^\d]', '', price_range)
        if digits and category in ['housing', 'stay']:
            from handlers.formatters import get_usd_to_vnd_rate
            price_vnd = int(digits)
            usd_rate = get_usd_to_vnd_rate()
            price_usd = round(price_vnd / usd_rate)
            text += f"💰 Цена за сутки: {price_vnd:,} ₫ (~${price_usd})\n\n"
        else:
            text += f"💰 {price_range}\n\n"
    
    # 6. Контакты
    if contact:
        clean_phone = re.sub(r'[^\d+]', '', contact)
        if clean_phone:
            text += f"☎️ <a href='tel:{clean_phone}'>{contact}</a>\n\n"
        else:
            text += f"☎️ {contact}\n\n"
    
    # 7. Адрес
    if address:
        text += f"📍 Адрес: {address}\n\n"
    
    # 8. РАССТОЯНИЕ (Вынес из блока address, чтобы работало всегда)
    if show_distance:
        if all(v is not None for v in [user_lat, user_lon, lat, lon]):
            try:
                u_lat, u_lon = float(user_lat), float(user_lon)
                b_lat, b_lon = float(lat), float(lon)
                
                distance = calculate_distance(u_lat, u_lon, b_lat, b_lon)
                
                if distance is not None:
                    dist_text = f"{int(distance * 1000)} м" if distance < 1 else f"{round(distance, 1)} км"
                    text += f"📏 <b>{dist_text} от вас</b>\n"
                    text += f"└ <i>Актуализировать:</i> /update_location\n\n"
                
            except (ValueError, TypeError) as e:
                # Исправлено: используем business.get('id') вместо biz_data
                print(f"❌ Ошибка расчета расстояния (ID: {business.get('id')}): {e}")
                text += "📏 <i>Ошибка расчета расстояния</i>\n\n"
        else:
            text += "📏 <i>Расстояние не рассчитано.</i>\n"
            text += "└ <i>Отправьте локацию:</i> /update_location\n\n"
    
    # 9. Время работы
    if working_hours:
        from handlers.formatters import format_working_hours
        formatted_hours, is_open_now = format_working_hours(working_hours)
        text += f"🕒 График:\n{formatted_hours}\n\n"
        status = "🟢 Сейчас открыто" if is_open_now else "🔴 Сейчас закрыто"
        text += f"{status}\n\n"
    
    # 10. Описание или Отзывы
    if description:
        if category in ['housing', 'stay']:
            short_desc = description[:500] + "..." if len(description) > 500 else description
            text += f"📋 <b>Описание:</b>\n{short_desc}\n\n"
        else:
            reviews = [clean_review_text(r) for r in description.split('|') if clean_review_text(r)]
            if reviews:
                text += f"📝 <b>Отзывы:</b>\n"
                for i, review in enumerate(reviews[:3], 1):
                    text += f"{i}. <i>«{review}»</i>\n\n"

    return text.strip()




def get_user_location(user_id):
    """
    Тянет сохраненные координаты юзера из Supabase.
    Использует клиент из supabase_api.py
    """
    from supabase_api import supabase
    
    try:
        # ЗАМЕНИЛИ 'users' на 'bot_users'
        response = supabase.table('bot_users').select('lat, lon').eq('user_id', user_id).execute()
        
        if response.data and len(response.data) > 0:
            user_data = response.data[0]
            lat = user_data.get('lat')
            lon = user_data.get('lon')
            
            # Проверяем, что в базе не NULL
            if lat is not None and lon is not None:
                return float(lat), float(lon)
                
    except Exception as e:
        # Теперь здесь не будет ошибки 404, так как таблица верная
        print(f"❌ [DB ERR] Ошибка получения локации юзера {user_id}: {e}")
        
    return None, None



def format_working_hours(working_hours):
    """
    Форматирует строку или словарь рабочих часов в читаемый вид.
    Возвращает (текст_графика, открыто_сейчас_bool)
    """
    if not working_hours:
        return "График не указан", False
    
    # Если это словарь (из Google Maps)
    if isinstance(working_hours, dict):
        # Логика упрощена: берем сегодняшний день или возвращаем как есть
        # Можно доработать под твою структуру
        return str(working_hours.get('current_day_text', 'Инфо отсутствует')), False
    
    # Если это строка
    return str(working_hours), False