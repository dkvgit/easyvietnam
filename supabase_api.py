# D:\aRabota\TelegaBoom\08_gid\supabase_api.py


from config import SUPABASE_URL, SUPABASE_KEY
from datetime import datetime, timedelta
import math

assert SUPABASE_URL, "❌ SUPABASE_URL is missing!"
assert SUPABASE_KEY, "❌ SUPABASE_KEY is missing!"

from supabase import create_client
from config import SUPABASE_URL, SUPABASE_KEY

supabase = create_client(SUPABASE_URL, SUPABASE_KEY)


def haversine(lat1, lon1, lat2, lon2):
    """Вычисляет расстояние между двумя точками на Земле в метрах"""
    R = 6371000  # радиус Земли в метрах
    phi1 = math.radians(lat1)
    phi2 = math.radians(lat2)
    delta_phi = math.radians(lat2 - lat1)
    delta_lambda = math.radians(lon2 - lon1)
    a = (math.sin(delta_phi / 2) ** 2 + math.cos(phi1) * math.cos(phi2) * math.sin(delta_lambda / 2) ** 2)
    c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))
    return int(R * c)


async def find_nearby_businesses(user_lat, user_lon, max_distance=2000, category=None):
    """Находит ближайшие заведения с сортировкой по расстоянию"""
    query = supabase.table("businesses").select("*")

    # Фильтр по категории, если указана
    if category:
        query = query.eq("category", category)

    response = query.execute()
    businesses = response.data or []

    nearby = []
    for b in businesses:
        if b.get("latitude") and b.get("longitude"):
            dist = haversine(user_lat, user_lon, float(b["latitude"]), float(b["longitude"]))
            if dist <= max_distance:
                b["distance"] = dist
                nearby.append(b)

    # Сортируем по расстоянию
    nearby.sort(key=lambda x: x["distance"])
    return nearby


async def search_businesses_by_location(address_query):
    """Поиск заведений по адресу"""
    response = supabase.table("businesses").select("*") \
        .ilike("address", f"%{address_query}%") \
        .execute()

    return response.data or []

async def filter_businesses_by_price(category=None, max_price=None):
    """Фильтрация заведений по ценовому диапазону"""
    query = supabase.table("businesses").select("*")

    if category:
        query = query.eq("category", category)

    # Простая фильтрация по цене (можно усложнить)
    if max_price:
        query = query.ilike("price_range", f"%{max_price}%")

    response = query.execute()
    return response.data or []

async def get_businesses_with_working_hours(is_open_now=False):
    """Получить заведения с корректной проверкой времени работы"""
    query = supabase.table("businesses").select("*").not_.is_("working_hours", "null")
    response = query.execute()
    businesses = response.data or []

    if is_open_now:
        # Текущее время во Вьетнаме (UTC+7)
        now = datetime.utcnow() + timedelta(hours=7)
        current_time = now.hour * 100 + now.minute
        
        open_businesses = []
        for b in businesses:
            hours = b.get("working_hours", "")
            if not hours or "-" not in hours:
                continue
                
            try:
                # Убираем пробелы и делим на Старт - Конец
                parts = hours.replace(" ", "").split("-")
                start_t = int(parts[0].replace(":", ""))
                end_t = int(parts[1].replace(":", ""))

                if start_t < end_t:
                    # Дневной график (напр. 08:00 - 22:00)
                    if start_t <= current_time <= end_t:
                        open_businesses.append(b)
                else:
                    # Ночной график (напр. 22:00 - 03:00)
                    if current_time >= start_t or current_time <= end_t:
                        open_businesses.append(b)
            except:
                continue
        return open_businesses
    return businesses




async def get_statistics():
    """Получить статистику по пользователям и заведениям"""
    users_resp = supabase.table("users").select("*", count="exact").execute()
    businesses_resp = supabase.table("businesses").select("*", count="exact").execute()

    total_users = users_resp.count or 0
    total_businesses = businesses_resp.count or 0

    last_week = (datetime.utcnow() - timedelta(days=7)).isoformat()
    recent_resp = supabase.table("businesses") \
        .select("*", count="exact") \
        .gte("created_at", last_week) \
        .execute()
    new_last_week = recent_resp.count or 0

    return {
        "users": total_users,
        "businesses": total_businesses,
        "recent": new_last_week
    }

async def search_businesses_by_keyword(keyword):
    """Поиск заведений по ключевому слову"""
    # Поиск по названию
    response = supabase.table("businesses") \
        .select("*") \
        .ilike("title", f"%{keyword}%") \
        .execute()

    results = response.data or []

    # Если не найдено по названию, ищем по описанию
    if not results:
        response = supabase.table("businesses") \
            .select("*") \
            .ilike("description", f"%{keyword}%") \
            .execute()
        results = response.data or []

    # Также ищем по адресу
    if not results:
        response = supabase.table("businesses") \
            .select("*") \
            .ilike("address", f"%{keyword}%") \
            .execute()
        results = response.data or []

    return results

async def add_business(data: dict):
    """Добавить новое заведение"""
    # Добавим дату создания, если не передана
    if "created_at" not in data:
        data["created_at"] = datetime.utcnow().isoformat()

    try:
        response = supabase.table("businesses").insert(data).execute()
        print("✅ Бизнес добавлен:", data.get("title", "Без названия"))
        return response.data
    except Exception as e:
        print("❌ Ошибка при добавлении:", str(e))
        return None


async def get_businesses_by_category(category_key):
    """Получить заведения по категории (ищем и в category, и в subcategory)"""
    try:
        # Используем фильтр .or_ для поиска по двум колонкам сразу
        # Это гарантирует, что Manu Spa найдется, даже если он 'beauty' -> 'spa'
        response = supabase.table("businesses") \
            .select("*") \
            .or_(f"category.eq.{category_key},subcategory.eq.{category_key}") \
            .eq("is_test", False) \
            .execute()

        businesses = response.data or []

        # Логика проверки срока рекламы (оставляем без изменений)
        current_time = datetime.utcnow()
        for business in businesses:
            if business.get('is_recommended') and business.get('recommended_until'):
                # Добавляем проверку на None для безопасности
                until_str = business['recommended_until']
                if until_str:
                    recommended_until = datetime.fromisoformat(until_str.replace('Z', '+00:00'))
                    if current_time > recommended_until:
                        supabase.table("businesses") \
                            .update({"is_recommended": False, "recommended_until": None}) \
                            .eq("id", business['id']) \
                            .execute()
                        business['is_recommended'] = False

        print(f"🔍 Найдено {len(businesses)} заведений для ключа: {category_key}")
        return businesses
    except Exception as e:
        print("❌ Ошибка при получении заведений:", str(e))
        return []
    
    
    
async def save_user_to_supabase(user_id, username, first_name, source="direct"):
    """Сохранить пользователя в базу данных"""
    from datetime import datetime
    
    payload = {
        "user_id": user_id,
        "username": username,
        "first_name": first_name,
        "joined_at": datetime.utcnow().isoformat(),
        "source": source
    }

    try:
        # upsert вместо insert - не будет ошибки duplicate
        response = supabase.table("bot_users").upsert(payload, on_conflict="user_id").execute()
        print("✅ Пользователь сохранён")
        return response.data
    except Exception as e:
        print(f"⚠️ Ошибка: {e}")
        return None

async def update_user_location(user_id, lat, lon):
    """
    Чистая функция для обновления координат в базе данных.
    """
    try:
        # Исправлено на bot_users
        response = supabase.table("bot_users").update({
            "lat": lat,
            "lon": lon
        }).eq("user_id", user_id).execute()
        
        print(f"✅ Локация юзера {user_id} обновлена в DB: {lat}, {lon}")
        return response.data
    except Exception as e:
        print(f"❌ Ошибка записи в базу: {e}")
        return None