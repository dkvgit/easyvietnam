#D:\aRabota\TelegaBoom\08_gid\script_googleMaps_res_poluavt\sql_generator.py




import re

def generate_sql(data, only_description=False):
    """
    Генерирует INSERT SQL с DO UPDATE. Исправлено для Python 3.11+
    """
    
    title_raw = data.get('title', '')
    if not title_raw:
        return None
    
    def sql_escape(value):
        if value is None or value == "":
            return "NULL"
        safe_val = str(value).replace("'", "''")
        return f"'{safe_val}'"

    # Эскейпим название
    title_escaped = str(title_raw).replace("'", "''")
    
    # Отзывы в описание
    if not data.get('description') and data.get('reviews_data'):
        data['description'] = " | ".join(data['reviews_data'])
    
    description = sql_escape(data.get('description'))
    
    # Категории по умолчанию для текущего парсинга
    category = data.get('category', 'hair')
    subcategory = data.get('subcategory', 'hair salon')
    cuisine = sql_escape(data.get('cuisine'))
    
    lat = data.get('latitude')
    lng = data.get('longitude')
    
    # --- ССЫЛКА НА КАРТЫ ---
    loc_link = data.get('location_link', '')
    is_bad_link = not loc_link or "googleusercontent" in str(loc_link) or str(loc_link).endswith('/0')
    
    if is_bad_link and lat and lng:
        # Корректный формат для карт Google
        loc_link = f"https://www.google.com/maps?q={lat},{lng}"
    
    location_link_sql = sql_escape(loc_link)

    price_range = sql_escape(data.get('price_range'))
    contact = sql_escape(data.get('contact'))
    
    raw_hours = data.get('opening_hours') or data.get('working_hours')
    working_hours = sql_escape(raw_hours)
    
    address = sql_escape(data.get('address'))
    additional_info = sql_escape(data.get('additional_info'))
    
    # Средний чек из цены
    avg_check = data.get('avg_check')
    if avg_check is None and data.get('price_range'):
        numbers = re.findall(r'(\d+[\d\s]*)', str(data.get('price_range')))
        if numbers:
            try:
                val = re.sub(r'\s', '', numbers[0])
                avg_check = int(val)
            except:
                avg_check = "NULL"
    
    if avg_check is None:
        avg_check = "NULL"

    rating = data.get('rating', 'NULL')
    
    # ТЕГИ: исправление для 3.11 (используем двойные кавычки внутри replace)
    raw_tags = data.get('tags', [subcategory, 'open'])
    tags_list = []
    for t in raw_tags:
        safe_tag = str(t).replace("'", "''")
        tags_list.append(f"'{safe_tag}'")
    
    tags_sql = f"ARRAY[{', '.join(tags_list)}]::text[]" if tags_list else "ARRAY[]::text[]"

    if only_description:
        update_logic = """DO UPDATE SET
  description = EXCLUDED.description,
  additional_info = EXCLUDED.additional_info"""
    else:
        update_logic = """DO UPDATE SET
  description = EXCLUDED.description,
  category = EXCLUDED.category,
  subcategory = EXCLUDED.subcategory,
  price_range = EXCLUDED.price_range,
  contact = EXCLUDED.contact,
  working_hours = EXCLUDED.working_hours,
  address = EXCLUDED.address,
  additional_info = EXCLUDED.additional_info,
  latitude = EXCLUDED.latitude,
  longitude = EXCLUDED.longitude,
  tags = EXCLUDED.tags,
  avg_check = EXCLUDED.avg_check,
  cuisine = EXCLUDED.cuisine,
  location_link = EXCLUDED.location_link,
  rating = EXCLUDED.rating"""

    lat_val = lat if lat is not None else "NULL"
    lng_val = lng if lng is not None else "NULL"

    sql = f"""INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('{title_escaped}', {description}, '{category}', '{subcategory}', {price_range},
   {contact}, {working_hours}, {address}, {additional_info}, {lat_val}, {lng_val},
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', {tags_sql}, {avg_check},
   false, {cuisine}, {location_link_sql}, {rating})
ON CONFLICT (title)
{update_logic};"""

    return sql