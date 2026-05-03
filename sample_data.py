# sample_data.py - скрипт для заполнения базы данных тестовыми данными

import asyncio
from supabase_api import add_business

# Тестовые данные с новыми полями
SAMPLE_BUSINESSES = [# Кафе и рестораны
    {"title": "Lanterns Vietnamese Restaurant", "description": "Аутентичная вьетнамская кухня с видом на море", "category": "food", "contact": "+84 258 352 8888", "price_range": "150-400k VND", "working_hours": "11:00-22:00", "address": "60A Tran Phu St, Ня Чанг", "latitude": 12.2451, "longitude": 109.1943},
    {"title": "Sailing Club Nha Trang", "description": "Пляжный клуб с международной кухней и коктейлями", "category": "food", "contact": "+84 258 352 4628", "price_range": "200-600k VND", "working_hours": "07:00-02:00", "address": "72-74 Tran Phu St, Ня Чанг", "latitude": 12.2434, "longitude": 109.1962},
    {"title": "Yen's Restaurant", "description": "Домашняя вьетнамская кухня, семейный ресторан", "category": "food", "contact": "+84 932 123 456", "price_range": "80-250k VND", "working_hours": "10:00-21:30", "address": "3/2A Tran Quang Khai St, Ня Чанг", "latitude": 12.2388, "longitude": 109.1967},

    # Жилье
    {"title": "Moonlight Hotel Hue", "description": "Комфортабельный отель в центре города", "category": "housing", "contact": "+84 258 352 9999", "price_range": "800-1500k VND/ночь", "working_hours": "24/7", "address": "6 Nguyen Thien Thuat St, Ня Чанг", "latitude": 12.2407, "longitude": 109.1954},
    {"title": "Backpacker Hostel Central", "description": "Бюджетное жилье для путешественников", "category": "housing", "contact": "+84 905 555 123", "price_range": "200-500k VND/ночь", "working_hours": "24/7", "address": "15B Hung Vuong St, Ня Чанг", "latitude": 12.2365, "longitude": 109.1934},

    # Красота и спа
    {"title": "Thap Ba Hot Spring", "description": "Горячие источники и грязевые ванны", "category": "beauty", "contact": "+84 258 383 4939", "price_range": "250-800k VND", "working_hours": "07:00-19:00", "address": "15 Ngoc Son, Ня Чанг", "latitude": 12.2789, "longitude": 109.1654},
    {"title": "Galina Mud Bath & Spa", "description": "Спа-процедуры и массаж", "category": "beauty", "contact": "+84 258 383 8838", "price_range": "300-1000k VND", "working_hours": "08:00-21:00", "address": "Bai Bac, Cam Hai Dong, Ня Чанг", "latitude": 12.3012, "longitude": 109.1456},

    # Обмен валют
    {"title": "Gold Exchange Center", "description": "Обмен валют по выгодному курсу, работаем с USD, EUR, RUB", "category": "exchange", "contact": "+84 258 352 7777", "price_range": "1-2% комиссия", "working_hours": "08:00-20:00", "address": "84 Le Loi St, Ня Чанг", "latitude": 12.2407, "longitude": 109.1954},
    {"title": "Vietcombank ATM", "description": "Банкомат для снятия местной валюты", "category": "exchange", "contact": "1900 545 413", "price_range": "50-100k VND комиссия", "working_hours": "24/7", "address": "2 Le Loi St, Ня Чанг", "latitude": 12.2398, "longitude": 109.1965},

    # Здоровье
    {"title": "Nha Trang International Hospital", "description": "Международная больница с англоговорящими врачами", "category": "health", "contact": "+84 258 352 8888", "price_range": "500-2000k VND", "working_hours": "24/7", "address": "72 Yersin St, Ня Чанг", "latitude": 12.2456, "longitude": 109.1889},
    {"title": "Pharmacy Ha Long", "description": "Аптека с широким ассортиментом лекарств", "category": "health", "contact": "+84 258 352 1234", "price_range": "20-500k VND", "working_hours": "07:00-22:00", "address": "25 Pasteur St, Ня Чанг", "latitude": 12.2443, "longitude": 109.1923},

    # Транспорт
    {"title": "Motorbike Rental Center", "description": "Аренда мотобайков и скутеров", "category": "transport", "contact": "+84 905 123 789", "price_range": "150-300k VND/день", "working_hours": "08:00-19:00", "address": "44 Nguyen Thien Thuat St, Ня Чанг", "latitude": 12.2419, "longitude": 109.1945},
    {"title": "Taxi Mai Linh", "description": "Надежное такси по городу и за его пределы", "category": "transport", "contact": "+84 258 383 8383", "price_range": "15-25k VND/км", "working_hours": "24/7", "address": "По всему городу", "latitude": 12.2388, "longitude": 109.1967},

    # Развлечения
    {"title": "Yang Bay Waterfall", "description": "Водопады и развлекательный парк", "category": "fun", "contact": "+84 258 389 1937", "price_range": "120-200k VND", "working_hours": "08:00-17:00", "address": "Khanh Vinh District, 40 км от Ня Чанг", "latitude": 12.1234, "longitude": 109.0876},
    {"title": "VinWonders Nha Trang", "description": "Парк развлечений на острове", "category": "fun", "contact": "+84 258 359 8998", "price_range": "800-1200k VND", "working_hours": "08:30-21:00", "address": "Hon Tre Island, Ня Чанг", "latitude": 12.1967, "longitude": 109.2145},

    # Услуги
    {"title": "Travel Agency Paradise", "description": "Туристическое агентство, экскурсии и туры", "category": "services", "contact": "+84 258 352 6666", "price_range": "300-2000k VND", "working_hours": "08:00-20:00", "address": "90A Nguyen Thien Thuat St, Ня Чанг", "latitude": 12.2434, "longitude": 109.1956},
    {"title": "Laundry Express", "description": "Быстрая стирка и химчистка", "category": "services", "contact": "+84 932 456 789", "price_range": "15-30k VND/кг", "working_hours": "07:00-21:00", "address": "17 Pasteur St, Ня Чанг", "latitude": 12.2445, "longitude": 109.1928}]


async def populate_database():
    """Заполнить базу данных тестовыми данными"""
    print("🚀 Начинаем заполнение базы данных...")

    for i, business in enumerate(SAMPLE_BUSINESSES, 1):
        print(f"📝 Добавляем {i}/{len(SAMPLE_BUSINESSES)}: {business['title']}")
        await add_business(business)
        await asyncio.sleep(0.5)  # Небольшая пауза между запросами

    print("✅ База данных успешно заполнена!")
    print(f"📊 Добавлено {len(SAMPLE_BUSINESSES)} заведений")


if __name__ == "__main__":
    asyncio.run(populate_database())