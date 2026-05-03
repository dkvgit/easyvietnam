#D:\aRabota\TelegaBoom\08_gid\script_googleMaps_res_poluavt\extractor.py






import re
import time
from bs4 import BeautifulSoup
from selenium.webdriver.common.by import By





def extract_part(driver, mode):
    """
    Универсальная функция сбора.
    Никакой логики категорий — только извлечение текста из HTML.
    """
    data = {}
    
    if mode == "overview":
        try:
            hours_btn = driver.find_element(By.CSS_SELECTOR, "div.OMl5r")
            if hours_btn.get_attribute("aria-expanded") == "false":
                driver.execute_script("arguments[0].click();", hours_btn)
                time.sleep(0.7)
        except:
            pass

    soup = BeautifulSoup(driver.page_source, 'html.parser')

    if mode == "info":
        info_container = soup.find("div", class_="iP2t7d")
        if not info_container:
            return {}
        data['additional_info'] = extract_additional_info(soup)
        return data

    elif mode == "reviews":
        data['reviews_data'] = extract_reviews(soup)
        return data

    elif mode == "overview":
        # Находим основной заголовок
        title_tag = soup.find("h1", class_=lambda c: c and "DUwDvf" in c)
        if not title_tag:
            return {}

        # 1. ЗАБИРАЕМ СЫРЫЕ ДАННЫЕ (Без обработки)
        data['title'] = title_tag.get_text(strip=True)
        
        # Та самая категория из Google (напр. "Салон по уходу за ресницами")
        cat_tag = soup.find("button", class_="DkEaL")
        data['subcategory_raw'] = cat_tag.get_text(strip=True) if cat_tag else ""

        # Адрес (фильтр по городу оставляем тут, так как это база)
        address_elements = soup.select('div.Io6YTe.fontBodyMedium')
        data['address'] = None
        for el in address_elements:
            text = el.get_text(strip=True)
            if any(x in text.lower() for x in ["nha trang", "khanh hoa"]):
                data['address'] = text
                break
        
        data['opening_hours'] = extract_working_hours(soup)
        
        # Координаты и ссылка
        current_url = driver.current_url
        data['location_link'] = current_url
        data['latitude'] = extract_lat(current_url)
        data['longitude'] = extract_lng(current_url)

        # Рейтинг (используем F7nice, он точнее для карточки)
        rating_val = soup.select_one('div.F7nice span[aria-hidden="true"]')
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



def extract_reviews(soup):
    """
    Извлекает до 3 уникальных отзывов на русском языке.
    """
    reviews = []
    # Основной класс текста отзывов в Google Maps
    review_blocks = soup.find_all("span", class_="wiI7pd")
    
    def has_cyrillic(text):
        return bool(re.search('[а-яА-ЯёЁ]', text))
    
    for block in review_blocks:
        text = block.get_text(strip=True)
        
        # Минимальная длина, чтобы не брать отзывы типа "Класс!" или "Ок"
        if text and len(text) > 20:
            # Убираем артефакты кнопки "Ещё"
            text = text.replace("…Ещё", "").replace("Ещё", "").strip()
            # Убираем лишние пробелы и переносы
            text = re.sub(r'\s+', ' ', text)
            
            # Если нет кириллицы — пропускаем
            if not has_cyrillic(text):
                continue
            
            # Экранируем одинарную кавычку и обратный слэш для безопасности SQL
            clean_text = text.replace("'", "''").replace("\\", "\\\\")
            
            if clean_text not in reviews:
                reviews.append(clean_text)
                
        # Лимит — 3 штуки
        if len(reviews) >= 3:
            break
            
    return reviews

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


# D:\aRabota\TelegaBoom\08_gid\script_googleMaps_avt\extractor.py

def click_tab(driver, tab_name_ru, tab_name_en):
    """
    Улучшенная функция переключения вкладок.
    Ищет кнопки на русском, английском и вьетнамском.
    """
    # Добавляем вьетнамские эквиваленты, так как Google часто переключает язык локально
    labels_map = {
        "Отзывы": ["Отзывы", "Reviews", "Đánh giá"],
        "О месте": ["О месте", "About", "Giới thiệu", "Thông tin"]
    }
    
    # Получаем список возможных названий для текущей вкладки
    search_labels = labels_map.get(tab_name_ru, [tab_name_ru, tab_name_en])
    
    for label in search_labels:
        try:
            # Ищем всеми способами: по aria-label и по тексту внутри кнопки/дива
            xpath = (
                f"//button[contains(@aria-label, '{label}')] | "
                f"//button//div[contains(text(), '{label}')] | "
                f"//div[@role='tab'][contains(., '{label}')]"
            )
            
            # Используем find_elements (множественное), чтобы не вызывать ошибку, если не найдено
            btns = driver.find_elements(By.XPATH, xpath)
            
            for btn in btns:
                if btn.is_displayed():
                    driver.execute_script("arguments[0].click();", btn)
                    time.sleep(1.8) # Ждем прогрузки контента
                    return True
        except:
            continue
            
    # Если за весь цикл ни одна кнопка не сработала
    print(f"   ⚠️ Вкладка '{tab_name_ru}' не найдена (возможно, её нет у этого места)")
    return False