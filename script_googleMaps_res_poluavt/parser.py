#D:\aRabota\TelegaBoom\08_gid\script_googleMaps_res_poluavt\parser.py


import os
import time

from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from extractor import extract_part
from sql_generator import generate_sql

CHROME_PROFILE_DIR = r"D:\aRabota\TelegaBoom\08_gid\chromium_profile"
SAVED_LIST_URL = "https://www.google.com/maps/search/%D0%BF%D0%B0%D1%80%D0%B8%D0%BA%D0%BC%D0%B0%D1%85%D0%B5%D1%80%D1%81%D0%BA%D0%B0%D1%8F/@12.2554092,109.1580967,13.75z?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D"



def main():
    options = Options()
    options.add_argument(f"--user-data-dir={CHROME_PROFILE_DIR}")
    options.add_argument("--disable-blink-features=AutomationControlled")
    
    service = Service()
    if os.name == 'nt':
        from subprocess import CREATE_NO_WINDOW
        service.creation_flags = CREATE_NO_WINDOW
    
    driver = webdriver.Chrome(service=service, options=options)
    
    try:
        driver.get(SAVED_LIST_URL)
        
        while True:
            # 1️⃣ Дефолтные значения теперь заточены под hair
            full_data = {
                'category': 'hair',
                'subcategory': 'hair salon',
                'tags': ['open'],
                'reviews_data': []
            }
            
            print("\n" + "="*50)
            print("🚀 СИСТЕМА ГОТОВА (DEFAULT: HAIR)")
            print("="*50)

            # --- ШАГ 1: ОБЗОР ---
            print("👉 1. Вкладка 'ОБЗОР' -> КЛИКНИ МЫШКОЙ...")
            input()
            time.sleep(1)
            data_overview = extract_part(driver, mode="overview")
            
            if not data_overview or (data_overview.get('title') == "Результаты"):
                print("❌ ОШИБКА: Карточка не открыта. Попробуй снова.")
                continue
                
            full_data.update(data_overview)

            # Логика определения категории и cuisine
            sub = str(full_data.get('subcategory', '')).lower()
            
            # 2️⃣ Проверка на парикмахерские услуги
            hair_words = ['hair', 'barber', 'парикмахерская', 'барбершоп']
            beauty_words = ['nail', 'spa', 'массаж', 'маникюр', 'салон', 'beauty']

            if any(word in sub for word in hair_words):
                full_data['category'] = 'hair'
                full_data['cuisine'] = 'Парикмахерская'
            elif any(word in sub for word in beauty_words):
                full_data['category'] = 'beauty'
                if 'маникюр' in sub or 'nail' in sub:
                    full_data['cuisine'] = 'Маникюр и педикюр'
                else:
                    full_data['cuisine'] = full_data.get('subcategory', 'Салон красоты')
            else:
                # Если ничего не подошло, но мы в этом списке — оставляем hair
                full_data['cuisine'] = full_data.get('subcategory', 'Услуги')
            
            # Обновляем теги на основе финальной подкатегории
            full_data['tags'] = [full_data.get('subcategory', 'service'), 'open']

            print(f"\n✅ ОБЗОР СЧИТАН (КАТЕГОРИЯ: {full_data['category']}):")
            print(f"   📍 Название:    {full_data.get('title')}")
            print(f"   🏠 Адрес:       {full_data.get('address')}")
            print(f"   🕒 Часы работы: {full_data.get('opening_hours')}")
            print(f"   ⭐ Рейтинг:     {full_data.get('rating')}")
            print(f"   📞 Телефон:     {full_data.get('contact')}")
            print("-" * 30)

            # --- ШАГ 2: ОТЗЫВЫ ---
            print("👉 2. Вкладка 'ОТЗЫВЫ' -> КЛИКНИ МЫШКОЙ...")
            input()
            time.sleep(1.2)
            data_reviews = extract_part(driver, mode="reviews")
            
            if data_reviews.get('reviews_data'):
                full_data['reviews_data'] = data_reviews['reviews_data']
            
            print(f"✅ ОТЗЫВЫ: Собрано {len(full_data.get('reviews_data', []))} шт.")

            # --- ШАГ 3: ИНФОРМАЦИЯ ---
            print("\n👉 3. Вкладка 'ИНФОРМАЦИЯ' -> КЛИКНИ МЫШКОЙ...")
            input()
            time.sleep(0.5)
            data_info = extract_part(driver, mode="info")
            
            for key, value in data_info.items():
                if value and value != "Результаты":
                    full_data[key] = value
            
            print(f"✅ ИНФОРМАЦИЯ собрана.")

            # --- ГЕНЕРАЦИЯ SQL ---
            sql = generate_sql(full_data)
            
            if sql:
                with open("output.sql", "a", encoding="utf-8") as f:
                    f.write(sql + "\n\n")
                
                print("\n" + "—"*40)
                print(f"🏁 ФИНАЛЬНЫЙ ИТОГ: {full_data.get('title')} -> {full_data['category']}")
                print(f"📝 Запись добавлена в output.sql")
                print("—"*40)
            
            print("-" * 50)
            if input("Продолжить? (ENTER/q): ").lower() == 'q':
                break

    except Exception as e:
        print(f"💥 Ошибка: {e}")
    finally:
        driver.quit()

        
        
if __name__ == "__main__":
    main()
