import os
import time
import atexit
from selenium.webdriver.common.by import By
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from extractor import extract_part, click_tab
from sql_generator import generate_sql

CHROME_PROFILE_DIR = r"D:\aRabota\TelegaBoom\08_gid\chromium_profile"
SAVED_LIST_URL = "https://www.google.com/maps/search/bank/@12.2416409,109.1379422,13.04z/data=!4m2!2m1!6e2?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D"







def get_config():
    """
    Настройки для категории FINANCE (Банки).
    """
    return {
        "default_category": "finance",
        "target_subcategory": "bank",  # Улетит в базу как bank
        "category_map": {
            "банк": "Банк",
            "банкомат": "Банкомат",
            "финансовое учреждение": "Финансы",
            "ngân hàng": "Банк",
            "atm": "Банкомат"
        }
    }


def is_valid_place(data, config):
    title = data.get('title')
    return bool(title and len(str(title).strip()) > 0), "OK" if title else "Пустой заголовок"

# D:\aRabota\TelegaBoom\08_gid\script_googleMaps_avt\parser.py

# D:\aRabota\TelegaBoom\08_gid\script_googleMaps_avt\parser.py

# D:\aRabota\TelegaBoom\08_gid\script_googleMaps_avt\parser.py

def main():
    options = Options()
    options.add_argument(f"--user-data-dir={CHROME_PROFILE_DIR}")
    options.add_experimental_option("excludeSwitches", ["enable-automation"])
    options.add_experimental_option("useAutomationExtension", False)
    options.add_argument("--disable-blink-features=AutomationControlled")
    
    service = Service()
    if os.name == 'nt':
        from subprocess import CREATE_NO_WINDOW
        service.creation_flags = CREATE_NO_WINDOW
    
    driver = webdriver.Chrome(service=service, options=options)
    atexit.register(driver.quit)
    
    driver.execute_cdp_cmd("Page.addScriptToEvaluateOnNewDocument", {
        "source": "Object.defineProperty(navigator, 'webdriver', {get: () => undefined})"
    })
    
    config = get_config()
    WAIT_MAIN_CARD = 4.0
    WAIT_TAB_CONTENT = 3.5
    
    try:
        driver.get(SAVED_LIST_URL)
        print("\n" + "="*50)
        print(f"🚀 ПАРСЕР ЗАПУЩЕН: {config['target_subcategory'].upper()}")
        print("="*50)
        
        input("👇 Настрой список в браузере и жми ENTER...")

        cards = driver.find_elements(By.CSS_SELECTOR, "a.hfpxzc")
        total = len(cards)

        for index, card in enumerate(cards):
            try:
                driver.execute_script("arguments[0].scrollIntoView({block: 'center'});", card)
                time.sleep(0.8)
                driver.execute_script("arguments[0].click();", card)
                time.sleep(WAIT_MAIN_CARD)

                # Собираем данные через универсальный экстрактор
                data_overview = extract_part(driver, mode="overview")
                if not is_valid_place(data_overview, config)[0]:
                    continue

                # --- ЛОГИКА ОПРЕДЕЛЕНИЯ ТИПА (CUISINE) ---
                raw_cat = data_overview.get('subcategory_raw', '').lower()
                current_spec = config["category_map"].get(raw_cat)
                
                if not current_spec:
                    # Поиск по ключевым словам для финансов
                    search_text = (data_overview.get('title', '') + " " + raw_cat).lower()
                    
                    if any(word in search_text for word in ['банк', 'ngân hàng', 'bank', 'bidv', 'vcb', 'vpbank', 'sacom']):
                        current_spec = "Банк"
                    elif any(word in search_text for word in ['atm', 'банкомат', 'máy rút tiền']):
                        current_spec = "Банкомат"
                    elif any(word in search_text for word in ['обмен', 'exchange', 'chuyển tiền', 'валют']):
                        current_spec = "Обмен валюты"
                    else:
                        current_spec = raw_cat.capitalize() if raw_cat else "Финансы"

                # Формируем объект (subcategory берется из конфига и идет в SQL как есть)
                full_data = {
                    'category': config['default_category'],
                    'subcategory': config['target_subcategory'],
                    'tags': [config['default_category'], 'open'],
                    'cuisine': current_spec,
                    'reviews_data': []
                }
                
                full_data.update(data_overview)

                # Переключение на отзывы
                if click_tab(driver, "Отзывы", "Reviews"):
                    time.sleep(WAIT_TAB_CONTENT)
                    res_reviews = extract_part(driver, mode="reviews")
                    full_data['reviews_data'] = res_reviews.get('reviews_data', [])

                # Переключение на инфо
                if click_tab(driver, "О месте", "About"):
                    time.sleep(WAIT_TAB_CONTENT)
                    data_info = extract_part(driver, mode="info")
                    for key, value in data_info.items():
                        if value and value != "Результаты":
                            full_data[key] = value

                # SQL генерация
                sql = generate_sql(full_data)
                if sql:
                    with open("output.sql", "a", encoding="utf-8") as f:
                        f.write(sql + "\n\n")
                    print(f"✅ [{index+1}/{total}] {full_data['title']} -> {current_spec}")

                time.sleep(1.2)

            except Exception as e:
                print(f"💥 Ошибка на {index + 1}: {e}")
                continue

        print(f"\n🏁 Готово! Все данные в output.sql")

    except Exception as e:
        print(f"💥 Критическая ошибка: {e}")
    finally:
        driver.quit()
        
if __name__ == "__main__":
    main()