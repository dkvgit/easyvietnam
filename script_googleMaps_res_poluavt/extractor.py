#D:\aRabota\TelegaBoom\08_gid\script_googleMaps_res_poluavt\extractor.py






import re
import time
from bs4 import BeautifulSoup
from selenium.webdriver.common.by import By

def extract_part(driver, mode):
    """
    Основная функция сбора данных.
    Исправлена ошибка поиска карточки во вкладке 'О месте' и защита от NoneType.
    """
    data = {}
    
    # Раскрываем часы работы перед парсингом (только если мы на главной вкладке)
    if mode == "overview":
        try:
            hours_btn = driver.find_element(By.CSS_SELECTOR, "div.OMl5r")
            if hours_btn.get_attribute("aria-expanded") == "false":
                driver.execute_script("arguments[0].click();", hours_btn)
                time.sleep(0.7)
        except:
            pass

    soup = BeautifulSoup(driver.page_source, 'html.parser')

    # --- РЕЖИМ ИНФОРМАЦИЯ (О МЕСТЕ) ---
    if mode == "info":
        # Проверяем наличие контейнеров с услугами (iP2t7d), так как H1 тут может не быть
        info_container = soup.find("div", class_="iP2t7d")
        if not info_container:
            # Если даже контейнера нет, значит вкладка реально не прогрузилась
            print("   ⚠️ [WARNING]: Вкладка 'Информация' не прогрузилась или пуста.")
            return {}
            
        data['additional_info'] = extract_additional_info(soup)
        return data

    # --- РЕЖИМ ОТЗЫВЫ ---
    elif mode == "reviews":
        review_spans = soup.select('span.wiI7pd')
        if not review_spans:
            print("   ⚠️ [WARNING]: Отзывы не найдены! Вы точно перешли во вкладку 'Отзывы'?")
            return {'reviews_data': []}

        reviews = []
        for span in review_spans:
            if len(reviews) >= 3:
                break
            txt = span.get_text(strip=True).replace('\n', ' ')
            if len(txt) > 10:
                reviews.append(txt)
        
        data['reviews_data'] = reviews
        return data

    # --- РЕЖИМ ОБЗОР (OVERVIEW) ---
    elif mode == "overview":
        # Здесь H1 обязателен, чтобы понять, что мы вообще открыли точку
        title_tag = soup.find("h1", class_="DUwDvf")
        if not title_tag:
            print("   ❌ [ERROR]: Карточка объекта не найдена (нет H1)!")
            return {} # ВЕРНИ ПУСТОЙ СЛОВАРЬ ВМЕСТО NONE

        raw_title = title_tag.get_text(strip=True)
        cat_tag = soup.find("button", class_="DkEaL")
        raw_type = cat_tag.get_text(strip=True) if cat_tag else None

        from category_map import get_category_info
        info = get_category_info(raw_type, raw_title)
        data['title'] = info['clean_title']
        
        # HAIR маппинг
        hair_keywords = ['мужская парикмахерская', 'парикмахерская', 'barber', 'hair']
        is_hair = not raw_type or any(word in (raw_type.lower()) for word in hair_keywords)

        if is_hair:
            data['category'] = 'hair'
            data['subcategory'] = raw_type if raw_type else 'Hair salon'
            data['cuisine'] = 'Парикмахерская'
        else:
            data['category'] = info['category']
            data['subcategory'] = info['subcategory']
            data['cuisine'] = info['cuisine']

        # Адрес (фильтр по Нячангу)
        address_elements = soup.select('div.Io6YTe.fontBodyMedium')
        data['address'] = None
        for el in address_elements:
            text = el.get_text(strip=True)
            if any(x in text.lower() for x in ["nha trang", "khanh hoa"]):
                data['address'] = text
                break
        
        data['opening_hours'] = extract_working_hours(soup)
        
        # Координаты
        current_url = driver.current_url
        data['latitude'] = extract_lat(current_url) if 'extract_lat' in globals() else None
        data['longitude'] = extract_lng(current_url) if 'extract_lng' in globals() else None
        
        if not data.get('latitude'):
            coord_match = re.search(r'@(-?\d+\.\d+),(-?\d+\.\d+)', current_url)
            if coord_match:
                data['latitude'], data['longitude'] = coord_match.groups()

        # Рейтинг
        rating_val = soup.select_one('div.fontDisplayLarge')
        if rating_val:
            data['rating'] = rating_val.get_text(strip=True).replace(',', '.')

        # Телефон
        phone_tag = soup.select_one('button[data-item-id^="phone:tel:"]')
        if phone_tag:
            data['contact'] = phone_tag.get('aria-label', '').replace('Телефон: ', '').strip()

    return data

def parse_avg_check(price_str):
    if not price_str: return None
    nums = re.findall(r"\d+", price_str.replace(" ", "").replace("\xa0", ""))
    return int(nums[0]) if nums else None


def extract_title(soup):
    """Извлекает название из h1 с учетом твоей верстки"""
    
    # Ищем заголовок h1 с твоим классом
    title_tag = soup.find("h1", class_="DUwDvf lfPIob")
    
    if title_tag:
        
        # get_text() соберет весь текст внутри h1,
        # включая тот, что внутри span, и очистит от лишних пробелов
        return title_tag.get_text(strip=True)

    # Резервный поиск по частичному совпадению класса (на случай мелких изменений)
    backup_tag = soup.find("h1", class_=lambda c: c and "DUwDvf" in c)
    if backup_tag:
        return backup_tag.get_text(strip=True)

    return None




def extract_rating(soup):
    """
    Извлекает числовой рейтинг из блока F7nice.
    Пример: '4,5' -> '4.5'
    """
    # Ищем основной контейнер рейтинга
    rating_container = soup.find("div", class_="F7nice")
    
    if rating_container:
        # Ищем первый span, где лежит число
        rating_span = rating_container.find("span", {"aria-hidden": "true"})
        if rating_span:
            rating_text = rating_span.get_text(strip=True)
            # Заменяем запятую на точку для формата float
            return rating_text.replace(",", ".")
            
    # Резервный поиск через регулярку, если структура чуть изменится
    backup_tag = soup.find("span", class_="ce40Ff")
    if backup_tag:
        match = re.search(r"(\d[,\.]\d)", backup_tag.get_text())
        return match.group(1).replace(",", ".") if match else None

    return None


def extract_reviews_count(soup):
    tag = soup.find(class_="UY7F9")
    if tag:
        nums = re.findall(r"\d+", tag.get_text(strip=True).replace("\xa0", "").replace(" ", ""))
        return int("".join(nums)) if nums else None
    return None


def extract_category_raw(soup):
    btn = soup.find("button", class_=lambda c: c and "DkEaL" in c)
    if btn:
        return btn.get_text(strip=True)
    return None


def extract_price_range(soup):
    """Извлекает ценовой диапазон и фильтрует пустые значения типа 'Р'"""
    
    price_selectors = [
        "span[aria-label*='тыс']",
        "span[aria-label*='₫']",
        "span[aria-label*='д.']",
        "div.IbRhrY span:not([class])",
        "span[class*='price']",
        "div.fontBodyMedium span[aria-hidden='true']",
        "button[aria-label*='Цена'] span",
        "div.LBgpqf span",
        "span[aria-label*='Цена']",
        "button[aria-label*='price'] span"
    ]
    
    found_price = None
    for selector in price_selectors:
        try:
            elements = soup.select(selector)
            for elem in elements:
                text = elem.get_text(strip=True)
                if text and ("тыс" in text or "₫" in text or "д." in text or "₽" in text or "РР" in text):
                    if re.search(r"\d", text) or "РР" in text:
                        text = re.sub(r'\s+', ' ', text).strip()
                        text = text.lstrip('·').lstrip('•').lstrip('●').strip()
                        found_price = text
                        break
            if found_price: break
        except:
            pass
    
    if not found_price:
        # Резервный поиск паттернов
        all_text = soup.get_text()
        match = re.search(r'(\d[\d\s]*[–\-]\d[\d\s]*(?:тыс\.?|д\.|₫))', all_text)
        if match:
            found_price = match.group(1).strip()

    # ФИНАЛЬНАЯ ПРОВЕРКА: если цена - это просто "Р" или "РР", возвращаем None
    if found_price:
        clean_p = found_price.strip()
        if clean_p in ["Р", "РР", "РРР", "₽", "₽₽"]:
            return None
        return clean_p
        
    return None


def extract_address(soup):
    btn = soup.find("button", {"data-item-id": "address"})
    if btn:
        div = btn.find(class_=lambda c: c and "Io6YTe" in c)
        if div:
            return div.get_text(strip=True)
    return None






def extract_working_hours(soup):
    """Извлекает часы работы"""
    day_order = ["понедельник", "вторник", "среда", "четверг", "пятница", "суббота", "воскресенье"]
    day_hours = {}

    # Поиск таблицы по классу или по ключевым словам внутри
    table = soup.find("table", class_=lambda c: c and "eK4R0e" in c)
    if not table:
        for t in soup.find_all("table"):
            if "понедельник" in t.get_text().lower():
                table = t
                break

    if table:
        for row in table.find_all("tr"):
            cells = row.find_all("td")
            if len(cells) >= 2:
                day_text = cells[0].get_text(strip=True).lower()
                day_clean = re.sub(r"\(.*?\)", "", day_text).strip()
                
                hours_tag = cells[1].find("li")
                hours = hours_tag.get_text(strip=True) if hours_tag else cells[1].get_text(strip=True)
                
                for d in day_order:
                    if d in day_clean:
                        day_hours[d] = hours
                        break

    if not day_hours:
        return None

    parts = []
    for day in day_order:
        if day in day_hours:
            parts.append(f"{day.capitalize()}: {day_hours[day]}")

    return "; ".join(parts)






def extract_lat(url):
    # Способ 1: ищем !3d (самый надёжный)
    match = re.search(r"!3d(-?\d+\.\d+)", url)
    if match:
        return float(match.group(1))
    
    # Способ 2: ищем последнее вхождение @
    matches = re.findall(r"@(-?\d+\.\d+),(-?\d+\.\d+)", url)
    if matches:
        return float(matches[-1][0])
    
    return None


def extract_lng(url):
    # Способ 1: ищем !4d (самый надёжный)
    match = re.search(r"!4d(-?\d+\.\d+)", url)
    if match:
        return float(match.group(1))
    
    # Способ 2: ищем последнее вхождение @
    matches = re.findall(r"@(-?\d+\.\d+),(-?\d+\.\d+)", url)
    if matches:
        return float(matches[-1][1])
    
    return None



def extract_additional_info(soup):
    """Сбор инфо с чисткой дублей и учетом 'Нет'"""
    all_info = []
    sections = soup.find_all("div", class_="iP2t7d")
    
    for section in sections:
        header_tag = section.find("h2", class_="iL3Qke")
        header = header_tag.get_text(strip=True) if header_tag else ""
        
        items = section.find_all("div", class_="iNvpkb")
        section_items = []
        
        for item in items:
            spans = item.find_all("span")
            if not spans:
                continue
            
            # Очистка текста
            raw_text = spans[-1].get_text().replace('\xa0', ' ').strip()
            if not raw_text:
                continue
            
            # Проверка на значок "X" (отсутствие услуги)
            is_negative = item.find("span", class_=lambda c: c and "OazX1c" in c)
            
            # Формируем итоговую строку для этого пункта
            if is_negative:
                final_item_text = f"Нет {raw_text.lower()}".replace("нет парковка", "нет парковки")
            else:
                final_item_text = raw_text
            
            # Добавляем в список секции, ТОЛЬКО если такого текста там еще нет
            if final_item_text not in section_items:
                section_items.append(final_item_text)
        
        if section_items:
            all_info.append(f"{header}: {', '.join(section_items)}")
            
    return "; ".join(all_info) if all_info else None

def extract_reviews(soup):
    """
    Извлекает ровно 3 уникальных отзыва на русском языке из блоков wiI7pd.
    """
    reviews = []
    # Основной класс текста отзывов
    review_blocks = soup.find_all("span", class_="wiI7pd")
    
    def has_cyrillic(text):
        return bool(re.search('[а-яА-ЯёЁ]', text))
    
    for block in review_blocks:
        text = block.get_text(strip=True)
        
        if text and len(text) > 20:
            # Чистим текст от мусора Google
            text = text.replace("…Ещё", "").replace("Ещё", "").strip()
            text = re.sub(r'\s+', ' ', text)
            
            # Фильтруем по языку
            if not has_cyrillic(text):
                continue
            
            # Экранируем кавычки для SQL и проверяем уникальность
            clean_text = text.replace("'", "''")
            if clean_text not in reviews:
                reviews.append(clean_text)
                
        # Нам нужно строго 3
        if len(reviews) >= 3:
            break
    
    return reviews