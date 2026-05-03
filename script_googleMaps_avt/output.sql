INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('HDBank - CN Nha Trang', 'Ввели на снятие наличных в банкомате комиссию почти 5% для карт visa и Mastercard! В феврале 2024 можно было снимать без комиссии, а теперь над банкоматом наклеили наклейку о комиссии и лимите на снятие в 3 000 000 донг. При этом на чеке написано, что снятие без комиссии и только в смс о списании денег видно, что списывается комиссия | Это не заслуживает даже одной звезды. Я снял 200 000 донгов, и на бумажном чеке было указано 200 000 донгов без комиссии. … | 40 минут – это сердце. Я рада, что вам это помогло. ❤️❤️❤️❤️❤️❤️ …', 'finance', 'bank', NULL,
   '+84 1900 6060', 'Понедельник: 08:00–17:00; Вторник: 08:00–17:00; Среда: 08:00–17:00; Четверг: 08:00–17:00; Пятница: 08:00–17:00; Суббота: Закрыто; Воскресенье: Закрыто', 'Ariyana Smart Condotel, 18 Đ. Trần Hưng Đạo, Nha Trang, Khánh Hòa 57000, Вьетнам', 'Для людей с огр. возможностями: Вход для людей на инвалидных колясках, Парковка с доступом для инвалидов-колясочников', 12.2440775, 109.1944984,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/HDBank+-+CN+Nha+Trang/@12.2420623,109.1217116,12.49z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x3170672f1fd362d5:0x15ebbecf88127385!8m2!3d12.2440775!4d109.1944984!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11f723y28f?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.3)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('TPBank Nha Trang', 'Снял 3000000 с каспи Голд. Комиссия 55000 донгов | Нет комиссии, даёт снимать 5 лямов за раз. Карта мастеркард @mahashiva8 👈 мой блог в телеграме, где куча лайфхаков и советов для доступных путешествий … | Снятие без комиссии BTBank. Сбербанк берет комиссию, ВТБ нет. Сентябрь 2019', 'finance', 'bank', NULL,
   '+84 1900 585885', 'Понедельник: 07:30–17:00; Вторник: 07:30–17:00; Среда: 07:30–17:00; Четверг: 07:30–17:00; Пятница: 07:30–17:00; Суббота: 07:30–12:00; Воскресенье: Закрыто', '79 Yersin, phường Tây, Tây Nha Trang, Khánh Hòa 650000, Вьетнам', 'Для людей с огр. возможностями: Нет вход для людей на инвалидных колясках', 12.2492587, 109.1862859,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/TPBank+Nha+Trang/@12.2420623,109.1217116,12.49z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067ce7f1fd9e9:0xa2a277f998cc6ba4!8m2!3d12.2492587!4d109.1862859!15sCgRiYW5rWgYiBGJhbmuSAQRiYW5rmgFEQ2k5RFFVbFJRVU52WkVOb2RIbGpSamx2VDJ0d1ZsTlVWbHBXUjBwSFYxYzFXRTVZVWpaVk1VRXpZbFprU0ZJell4QULgAQD6AQQIABAa!16s%2Fg%2F11c5b11gq0?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.9)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('VPBANK NHA TRANG', 'Я посетила это место 1 февраля в 19:00. В очереди было около трех человек, и мне удалось снять свою карту Toss без комиссии! Из двух автоматов внутренний, похоже, не работал, поэтому я воспользовалась внешним. Насколько я помню, … | Филиал VPBank Yersin в Нячанге впечатляет своим роскошным и современным транзакционным залом. Зона ожидания просторная, комфортная, оборудована кондиционером, что создает приятную атмосферу для клиентов во время ожидания. Многочисленный … | Снял здесь 4 миллиона VND своей международной картой Mastercard, без комиссий. С тех пор, как TP Bank начал взимать комиссию, этот банкомат стал моим основным местом для снятия наличных. Рекомендую.', 'finance', 'bank', NULL,
   '+84 258 3561 887', 'Понедельник: 07:30–11:30; Вторник: 07:30–11:30; Среда: 07:30–11:30; Четверг: 07:30–11:30; Пятница: 07:30–11:30; Суббота: 07:30–11:30; Воскресенье: Закрыто', '26 Yersin, Vạn Thắng, Nha Trang, Khánh Hòa 650000, Вьетнам', 'Для людей с огр. возможностями: Вход для людей на инвалидных колясках, Места для инвалидов-колясочников, Парковка с доступом для инвалидов-колясочников, Туалет для инвалидов-колясочников; Ассортимент: Кредит наличными; Планирование: Требуется предварительная запись', 12.2495701, 109.189632,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/VPBANK+NHA+TRANG/@12.2420623,109.1217116,12.49z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067c73caadfa5:0x16d553f849adf7df!8m2!3d12.2495701!4d109.189632!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F1tf264fl?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.1)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Vietcombank', 'Счет открывать сюда не идите работать не хотят сделал себе визу две недели прожил говорят надо что бы 3 месяца виза действовала с момента подачи документов, но доказать что у них есть такие правила не смогли идите в bidv банк | 25.11.2025. Я приехал в банк в 13:30, но сотрудники ещё не приступили к работе. Я очень недоволен таким графиком работы. | Я обновила данные своего паспорта, всё заняло 5 минут, всё прошло отлично!', 'finance', 'bank', NULL,
   NULL, NULL, 'Nam NHA Trang, Кханьхоа, Вьетнам', NULL, 12.234962, 109.1791783,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Vietcombank/@12.2420623,109.1217116,12.49z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705d8f0a8ad4b7:0x6ff1fd019a895e0!8m2!3d12.234962!4d109.1791783!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11mhh0wtdt?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 2.4)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Vpbank - ATM', 'Отличный атм, все работает. Снимаем сколько хотим без комиссии. Днём очередь, хорошо утром приходить когда никого нет. Мне нужно написать отзыв на 260 символов для ачивки, так что русские ребята поддержите лайком этот отзыв, я стараюсь для … | Всё работает- пин код вводите как обычно, 4 цифры, и нажимайте зелёную кнопку. Т-банк взял за 2 млн донгов 6188 руб 27.02.2026 … | Снимала наличные с карты Revolut 2.000.000 донг без комиссии. Сначала почему-то не приняло карту, но со второй попытки получилось', 'finance', 'bank', NULL,
   '+84 258 3561 887', 'Понедельник: 24 часа в сутки; Вторник: 24 часа в сутки; Среда: 24 часа в сутки; Четверг: 24 часа в сутки; Пятница: 24 часа в сутки; Суббота: 24 часа в сутки; Воскресенье: 24 часа в сутки', '26 Yersin, Vạn Thắng, Nha Trang, Khánh Hòa 650000, Вьетнам', 'Для людей с огр. возможностями: Нет вход для людей на инвалидных колясках, Нет парковка с доступом для инвалидов-колясочников', 12.2495515, 109.1896802,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банкомат', 'https://www.google.com/maps/place/Vpbank+-+ATM/@12.2420623,109.1217116,12.49z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067805f8b14d7:0x1775161457dabd3e!8m2!3d12.2495515!4d109.1896802!15sCgRiYW5rWgYiBGJhbmuSAQNhdG2aAURDaTlEUVVsUlFVTnZaRU5vZEhsalJqbHZUMnhKTlZsNlpHMVBWM0JJVDFSVk5GWXhTWGhYU0ZaU1l6Rk5ORmxYWXhBQuABAPoBBAguEC0!16s%2Fg%2F1hc749gq0?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 4.2)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('MB Smartbank Diên Khánh', 'Персонал был очень приветливым и дружелюбным 🥰 … | Отличное обслуживание, приветливый персонал. | Персонал был полон энтузиазма.', 'finance', 'bank', NULL,
   '+84 1900 545426', 'Понедельник: 24 часа в сутки; Вторник: 24 часа в сутки; Среда: 24 часа в сутки; Четверг: 24 часа в сутки; Пятница: 24 часа в сутки; Суббота: 24 часа в сутки; Воскресенье: 24 часа в сутки', NULL, NULL, 12.2562383, 109.0974861,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/MB+Smartbank+Di%C3%AAn+Kh%C3%A1nh/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705d45286ca1dd:0x53d776d5ec33ac96!8m2!3d12.2562383!4d109.0974861!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11x04hn097?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 4.9)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Nam A Bank', 'Обсчитывают и грубят. Курс плохой. Меняйте где угодно но не тут | Обмен корейских вон (KRW) и китайских юаней (CNY) не производится. Доступны только доллары США и евро, но это не значит, что курс обмена выгодный. Предполагаю, это небольшой банк. | Обслуживание в банке ужасное, начиная от охранников и заканчивая кассирами. Клиентам приходится долго ждать. Прошел месяц с тех пор, как я пытался продлить свою карту, и я до сих пор ее не получил.', 'finance', 'bank', NULL,
   '+84 258 6254 135', 'Понедельник: 07:30–11:30; Вторник: 07:30–11:30; Среда: 07:30–11:30; Четверг: 07:30–11:30; Пятница: 07:30–11:30; Суббота: 07:30–11:30; Воскресенье: Закрыто', '20 Trần Phú, Lộc Thọ, Nha Trang, Khánh Hòa 650000, Вьетнам', 'Для людей с огр. возможностями: Парковка с доступом для инвалидов-колясочников', 12.2479457, 109.1961455,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Nam+A+Bank/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067824fae459d:0xfc1bbab7034bd4ab!8m2!3d12.2479457!4d109.1961455!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11b6dl8bfz?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.0)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Nam A Bank', NULL, 'finance', 'bank', NULL,
   NULL, NULL, 'Nam NHA Trang, Кханьхоа 650000, Вьетнам', NULL, 12.2382006, 109.1784808,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Nam+A+Bank/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705d850dc55e51:0xdd01cef88d3c6bcc!8m2!3d12.2382006!4d109.1784808!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11jzw64vn6?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 5.0)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('SHB Bank', 'Обслуживание было неудовлетворительным, слишком медленным. | Впечатления остались неудовлетворительными. | Персонал был очень отзывчивым и доброжелательным. Обслуживание было превосходным.', 'finance', 'bank', NULL,
   NULL, NULL, '175 Thống Nhất, Phương Sài, Tây Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2511577, 109.1873981,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/SHB+Bank/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705d7e1a0fda9b:0x4ea4ce92a48c733e!8m2!3d12.2511577!4d109.1873981!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11b7gsh351?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.6)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Vietcombank Nha Trang', 'Самый ровный банк, который удалось найти. Персонал говорит хорошо на Английском, легко открыть счет и интернет банкинг к нему при наличии evisa на 3 месяца. Карту не выпускают. Платежи по qr ходят. Требуется телефонный номер, оформленный на тот же паспорт, evisa и загран. Бумажек по минимому. | Спасибо Pham Dang Nguyen за открытие счета! Хорошо говорит на английском, хотя общение почти не пригодилось. … | Если бы можно было поставить 10 баллов, я бы поставил 10 из 10. Нгуен объяснил все понятно и доходчиво. Приятный собеседник и профессионал своего дела 🤝 …', 'finance', 'bank', NULL,
   '+84 258 3829 689', 'Понедельник: 07:15–11:30; Вторник: 07:15–11:30; Среда: 07:15–11:30; Четверг: 07:15–11:30; Пятница: 07:15–11:30; Суббота: Закрыто; Воскресенье: Закрыто', '14 Đ. Lê Thánh Tôn, Phước Tiến, Nha Trang, Khánh Hòa 57000, Вьетнам', NULL, 12.244917, 109.1910846,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Vietcombank+Nha+Trang/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067872e31e495:0x4c187d722f9e0b32!8m2!3d12.244917!4d109.1910846!15sCgRiYW5rWgYiBGJhbmuSAQRiYW5rmgFEQ2k5RFFVbFJRVU52WkVOb2RIbGpSamx2VDJwV05FMHdVbTlVVlVwTVVucGtlRnB1UWsxVlZUbDZXa1UxVjFwdVl4QULgAQD6AQQIbxA8!16s%2Fg%2F1tdxbs6_?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.6)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('TPBank Nam Khánh Hòa', 'Кто эти люди которые пишут что банка по указанному адресу нет и умеют ли они пользоваться картой и навигатором? Специально зашёл на официальный сайт банка чтобы посмотреть отделения в Ньячанге (адрес фигурировал), после чего, в качестве … | Нет банка по этому адресу | На этом месте нет банка и банкомата', 'finance', 'bank', NULL,
   NULL, 'Понедельник: 08:00–17:00; Вторник: 08:00–17:00; Среда: 08:00–17:00; Четверг: 08:00–17:00; Пятница: 08:00–17:00; Суббота: 08:00–12:00; Воскресенье: Закрыто', 'Lô 48 đường số A4, khu đô thị VCN, Nam Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2378314, 109.1788124,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/TPBank+Nam+Kh%C3%A1nh+H%C3%B2a/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705d474c9bad05:0x55f9ffc9bb800e65!8m2!3d12.2378314!4d109.1788124!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11rwq0sbzz?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.8)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('TPBank LiveBank Nha Trang', 'Банкомат снял деньги с карты, но не выдал наличные. Сотрудники банка никак не решили проблему, сказали обращаться в банк которому принадлежит карта. | Комиссия за снятие средств с карты Visa составляет 50 000 + 10% НДС = 55 000, если сумма меньше 5 миллионов, что не так уж и плохо, но в противном случае — 2,8% (154 000 за 5 миллионов). … | «Ужасный опыт. Банкомат выдал мои деньги, а банк отказался помочь». Я попытался снять 5 154 000 VND в этом банкомате, но он вышел из строя: …', 'finance', 'bank', NULL,
   '+84 1900 585885', 'Понедельник: 24 часа в сутки; Вторник: 24 часа в сутки; Среда: 24 часа в сутки; Четверг: 24 часа в сутки; Пятница: 24 часа в сутки; Суббота: 24 часа в сутки; Воскресенье: 24 часа в сутки', '79 Yersin, phường Tây, Tây Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2493104, 109.1863373,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банкомат', 'https://www.google.com/maps/place/TPBank+LiveBank+Nha+Trang/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705d1c1f3770d5:0xbb1050220d0e7354!8m2!3d12.2493104!4d109.1863373!15sCgRiYW5rkgEDYXRt4AEA!16s%2Fg%2F11rwx01bpw?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 2.6)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('VRB ATM', 'Снимал деньги не в этом банкомате, а в центре (не отмечен на карте, расположен на улице Đ. Lê Thánh Tôn недалеко от AB Mall). … | 19.08.2025. Банкомат работает, принимает карты мир сбер. Без проблем сняли 2 000 000 донг, списало 6758р , комиссия 200р. По предыдущим отзывам, от чека отказались. … | Палочка-выручалочка когда заканчивается валюта — банкомат VRB! Снял рубли с карты МИР. Интерфейс понятный, купюры новые. Работает чётко — без зависаний и лишних запросов. Рекомендую!', 'finance', 'bank', NULL,
   NULL, 'Понедельник: 24 часа в сутки; Вторник: 24 часа в сутки; Среда: 24 часа в сутки; Четверг: 24 часа в сутки; Пятница: 24 часа в сутки; Суббота: 24 часа в сутки; Воскресенье: 24 часа в сутки', '65HX+4WH, Trần Phú, Nha Trang, Khánh Hòa 650000, Вьетнам', 'Для людей с огр. возможностями: Нет вход для людей на инвалидных колясках, Нет парковка с доступом для инвалидов-колясочников', 12.2278322, 109.1999297,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банкомат', 'https://www.google.com/maps/place/VRB+ATM/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x3170678619ff1c1b:0x3e68fe5d8eb7f326!8m2!3d12.2278322!4d109.1999297!15sCgRiYW5rWgYiBGJhbmuSAQNhdG2aAURDaTlEUVVsUlFVTnZaRU5vZEhsalJqbHZUMjVhTUZaVVduVlJibHBTVWpOd2RtVnVSbFJXZWtwdFRWUnJOVkp0WXhBQuABAPoBBAgiEEE!16s%2Fg%2F11tcjdsm7m?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.6)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('HDBank - PGD Trung Tâm', 'Плохо, очень плохо, я не смог перевести деньги. Подошёл к стойке на улице 23/10, но там сказали, что не могут. Вынужден был ехать в это отделение больше часа, чтобы не перевести деньги, а потом и вовсе заблокировать приложение. Обратился в … | Снятие наличных с карты UnionPay в Hana Card Travelog невозможно. Похоже, банкомат не поддерживает сеть UnionPay. Только некоторые банкоматы HD Bank поддерживают сеть UnionPay. | Сначала я пошёл в Tui Blue, но оба банкомата сломались, поэтому я расстроился и отправился в I Resort ни с чем. Затем, поскольку он находился рядом с рынком Дам, я взял Grab. Так как это был Sol Travel, там был только один банкомат, но он …', 'finance', 'bank', NULL,
   '+84 1900 6060', 'Понедельник: 08:00–17:00; Вторник: 08:00–17:00; Среда: 08:00–17:00; Четверг: 08:00–17:00; Пятница: 08:00–17:00; Суббота: Закрыто; Воскресенье: Закрыто', '100 Hoàng Văn Thụ, Nha Trang, Khánh Hòa 57000, Вьетнам', NULL, 12.2508946, 109.1881199,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/HDBank+-+PGD+Trung+T%C3%A2m/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31706780a03d7e2d:0x812fa15f6a8dbf48!8m2!3d12.2508946!4d109.1881199!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11c52bby2z?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.4)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Vietin Bank', 'Ворота закрываются в 16:00, поэтому, пожалуйста, планируйте свое время соответствующим образом. Спасибо очень дружелюбным охранникам, полицейскому и сотруднице за стойкой номер 12 за помощь сегодня 🥰 … | 5-7 минут пешком от Lotte Mart. Бесплатная комиссия за вывод средств для блога о путешествиях. По пути на рынок Дам. … | У меня был негативный опыт общения с различными банками, и они очень грубо обращались с клиентами. Но после двух посещений банка Vietin я обнаружил, что персонал и охранники очень дружелюбны, вежливы и всегда улыбаются клиентам.', 'finance', 'bank', NULL,
   NULL, 'Понедельник: 07:30–11:30; Вторник: 07:30–11:30; Среда: 07:30–11:30; Четверг: 07:30–11:30; Пятница: 07:30–11:30; Суббота: Закрыто; Воскресенье: Закрыто', '4d Đ. Hoàng Hoa Thám, Xuong Huan, Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2506242, 109.1937437,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Vietin+Bank/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067815fdc9965:0xcd6810d4a060ec50!8m2!3d12.2506242!4d109.1937437!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11k4k3khdq?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 4.3)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('TPBank LiveBank Đại học Nha Trang', 'Людей никого нет аппарат не работает офис полная шляпа | Помещения чистые и приятные, с кондиционером. Я снял 500 000 VND в качестве эксперимента, и с меня списали 555 000 VND. Они сказали, что комиссий нет, но вычли больше из списанной суммы. Это мошенничество. Для туристических карт-кошельков обращайтесь в VP. | Он расположен в тихом месте, поэтому не кажется, что там многолюдно. Так что можно спокойно пользоваться им. Когда я искал 1 миллион донгов, мне попалось 9 карт по 100 000 донгов и 2 карты …', 'finance', 'bank', NULL,
   '+84 1900 585885', 'Понедельник: 24 часа в сутки; Вторник: 24 часа в сутки; Среда: 24 часа в сутки; Четверг: 24 часа в сутки; Пятница: 24 часа в сутки; Суббота: 24 часа в сутки; Воскресенье: 24 часа в сутки', 'Ký túc xá Đại học Nha Trang, 7692+ MGQ, Đ. Nguyễn Đình Chiểu, phường Bắc, Bắc Nha Trang, Khánh Hòa, Вьетнам', NULL, 12.2691102, 109.2012152,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/TPBank+LiveBank+%C4%90%E1%BA%A1i+h%E1%BB%8Dc+Nha+Trang/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067519ddbf4f9:0x6918cb1fef5d5297!8m2!3d12.2691102!4d109.2012152!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11sf0jylvr?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.4)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('ACB - PGD Chợ Đầm', 'Персонал был вежливым, приветливым, профессиональным и полным энтузиазма. | Комиссии просто смехотворно высоки. Я снял миллион вон с Toss, и это обошлось мне в 10 000 вон. Если есть возможность, поищите другой вариант. | Быстрое обслуживание, дружелюбный и энтузиастичный персонал', 'finance', 'bank', NULL,
   '+84 258 3819 570', 'Понедельник: 07:30–16:30; Вторник: 07:30–16:30; Среда: 07:30–16:30; Четверг: 07:30–16:30; Пятница: 07:30–16:30; Суббота: 07:30–11:30; Воскресенье: Закрыто', '33 Lê Lợi, Xương Huân, Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2535649, 109.1929979,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/ACB+-+PGD+Ch%E1%BB%A3+%C4%90%E1%BA%A7m/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x3170670a7f67ff0f:0x6938bbc6fbb1741a!8m2!3d12.2535649!4d109.1929979!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F1hc165hcg?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.8)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Vietcombank', 'Открывал счёт, заняло около тридцати минут с учётом двоих человек в очереди. Нужен только паспорт и местная симка оформленная на себя открывает не только россиянам, но и всем из СНГ. Счёт остаётся навсегда,продлевать не надо,(в ближайшем … | Открыли счёт по паспорту и местной сим карте (с привязкой к паспорту). Больше ничего не надо Менеджер помогла заполнить анкету и дала все необходимые пояснения | Около часа открывается счет по электронной визе. Во всем помогли,приложение активировали, большое спасибо', 'finance', 'bank', NULL,
   '+84 258 3568 899', 'Понедельник: 07:00–11:30; Вторник: 07:00–11:30; Среда: 07:00–11:30; Четверг: 07:00–11:30; Пятница: 07:00–11:30; Суббота: Закрыто; Воскресенье: Закрыто', '17 Đ. Quang Trung, Vạn Thạnh, Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2507243, 109.1905497,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Vietcombank/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31706780ddfce065:0x826abd11da867167!8m2!3d12.2507243!4d109.1905497!15sCgRiYW5rWgYiBGJhbmuSAQRiYW5rmgFEQ2k5RFFVbFJRVU52WkVOb2RIbGpSamx2VDIwMVIxRXhSbGxTYTFKM1pHdFdkMVJIY0RCalV6RXhVVlJLYUdGdVl4QULgAQD6AQUIkgMQQA!16s%2Fg%2F1tfwgw7w?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.1)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('International Bank - VIB Nha Trang', 'Я хотел бы серьёзно поразмыслить о работе VIB Bank. Я погасил кредит в течение месяца, обязательство полностью выполнено, но до сих пор VIB не вернул мне заложенное имущество. … | Срок действия карты истёк, и я пошёл в банк, где мне сказали, что я не могу её продлить и должен оформить новую. Сотрудники не дали мне никаких советов. Мне дали листок бумаги и сказали заполнить его и не выбирать тип карты. Они записали на … | Стоек было много, но работали только 5. Номерков в очереди не было, и приходилось ждать, пока тебя вызовет сотрудник. Невозможно было узнать, кто пришел первым; сотрудник просто вызывал тех, кого видел, без определенного порядка. Такой способ работы банка меня очень разочаровал.', 'finance', 'bank', NULL,
   '+84 258 7300 368', 'Понедельник: 08:00–12:00; Вторник: 08:00–12:00; Среда: 08:00–12:00; Четверг: 08:00–12:00; Пятница: 08:00–12:00; Суббота: 08:00–12:00; Воскресенье: Закрыто', '50 Đ. Lê Thành Phương, Vạn Thắng, Tây Nha Trang, Khánh Hòa 650000, Вьетнам', 'Для людей с огр. возможностями: Нет вход для людей на инвалидных колясках', 12.2494927, 109.188383,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/International+Bank+-+VIB+Nha+Trang/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x3170678087556119:0x4388823b5839f2e5!8m2!3d12.2494927!4d109.188383!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F1tgntqgb?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.1)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Nam A Bank', 'Спасибо большое водителю за поездку. Очень профессиональный водитель. Очень общительный и любезный. | Я совершенно разочарована этим банком. Они отказались принять 3 из 6 моих банкнот по 100 долларов под предлогом незначительных дефектов, таких как дырка от швейной иглы или пятна чернил, хотя я их не вижу или они невидимы для моих глаз. … | Системные ошибки, медлительность персонала за стойкой, 0 звезд — это все еще приемлемо.', 'finance', 'bank', NULL,
   '+84 258 3824 009', 'Понедельник: 07:30–11:30; Вторник: 07:30–11:30; Среда: 07:30–11:30; Четверг: 07:30–11:30; Пятница: 07:30–11:30; Суббота: 07:30–11:30; Воскресенье: Закрыто', '26 Thái Nguyên, Phước Tân, Tây Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2487667, 109.1846242,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Nam+A+Bank/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705d7f097dcbdb:0xdfaa4de70fcd1658!8m2!3d12.2487667!4d109.1846242!15sCgRiYW5rWgYiBGJhbmuSAQRiYW5rmgFEQ2k5RFFVbFJRVU52WkVOb2RIbGpSamx2VDJwcmVrOVhVbGhpTW14TFlrUlJlVlZ1Y0dsYVZUVktZV3RrZDFNeFJSQULgAQD6AQQIRhAd!16s%2Fg%2F11cn3d2tg6?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 1.4)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Techcombank Nha Trang', 'Поверила указанным изначально часам работы, думая что работают без обеда. Пришла, оказалось что перерыв с 11:30-14:00😭 Внесла правильные часы работы банка. Не знаю эти изменения только у меня будут … | Я пришла в банк, чтобы оформить карту, и обслуживание было ужасным. Вместо того, чтобы что-либо мне объяснить, сотрудница вела себя агрессивно и грубо. Я хотела оценить её работу, нажала кнопку оценки, и она тут же заблокировала мне доступ. … | Ужасное обслуживание. Сотрудники службы поддержки постоянно менялись, и когда это было необходимо, никто со мной не связывался. …', 'finance', 'bank', NULL,
   '+84 258 3818 177', 'Понедельник: 07:45–17:00; Вторник: 07:45–17:00; Среда: 07:45–17:00; Четверг: 07:45–17:00; Пятница: 07:45–17:00; Суббота: 07:30–11:30; Воскресенье: Закрыто', 'TTTM Vincom Plaza, 44-46 Đ. Lê Thánh Tôn, Phường Lập Thọ, Nha Trang, Khánh Hòa 650000, Вьетнам', 'Услуги: Обслуживание на месте; Посетители: Лояльность к трансгендерам, Подходит для ЛГБТК+', 12.2426665, 109.1937976,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Techcombank+Nha+Trang/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067b79c86a117:0x834e72cbc42df99!8m2!3d12.2426665!4d109.1937976!15sCgRiYW5rWgYiBGJhbmuSAQRiYW5rmgEjQ2haRFNVaE5NRzluUzBWSlEwRm5UVU5KZG1ORUxVdEJFQUXgAQD6AQUI6QEQNQ!16s%2Fg%2F11lmncvyn7?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.7)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Ngân hàng An Bình', 'ABBANK — худший банк во Вьетнаме по качеству обслуживания клиентов! Персонал и обслуживание — самые неквалифицированные. В приложении банка даже нет английского языка, а чтобы изменить пароль от приложения, нужно идти в офис, заполнять кучу … | Хорошее обслуживание, дружелюбный персонал, отзывчивые сотрудники, законные методы ведения бизнеса, надлежащая и правильная документация. | Ужасное обслуживание.', 'finance', 'bank', NULL,
   '+84 258 3563 560', NULL, '78 Thái Nguyên, Phước Tân, Tây Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2491669, 109.1835078,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Ng%C3%A2n+h%C3%A0ng+An+B%C3%ACnh/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705d7f17f4ae15:0xdb8dd4d6655480e4!8m2!3d12.2491669!4d109.1835078!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F1tksf8py?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.2)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('CN Vietinbank', 'Western Union переводы | Отличный банк,отличное обслуживание. | Это уже третий год подряд, когда я прихожу в это отделение и прошу купюры меньшего размера, чем те 500 000, которые я принесла. Каждый раз ко мне относились вежливо, эффективно и оперативно, начиная от охранника и заканчивая кассиром, …', 'finance', 'bank', NULL,
   NULL, 'Понедельник: 07:30–17:00; Вторник: 07:30–17:00; Среда: 07:30–17:00; Четверг: 07:30–17:00; Пятница: 07:30–17:00; Суббота: 07:30–11:00; Воскресенье: Закрыто', '434 Hai Tháng Tư, Bắc Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2806718, 109.1943644,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/CN+Vietinbank/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067fa216dd8f5:0x80b75f0b13d9cea3!8m2!3d12.2806718!4d109.1943644!15sCgRiYW5rWgYiBGJhbmuSAQRiYW5rmgFEQ2k5RFFVbFJRVU52WkVOb2RIbGpSamx2VDJwSmRGVXljSGhaYkZaclVtMW9lazV0VlhoYWExWkxVVmRrYWxSRlJSQULgAQD6AQQIABAk!16s%2Fg%2F1tdq3hfj?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.2)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Vietcombank - PGD Vĩnh Hải', 'Просторный светлый банк с кондиционером и водичкой, очень приятный и англоговорящий сотрудник на входе, работают профессионалы, несколько окошек обслуживает клиентов, я открывала счет- помогли с заполнением бумаг, все было оперативно и … | Открытие счета заняло минут 15, вообще без проблем. На входе меня встретил охранник, объяснил какой бланк заполнить и как, дал … | Пришел, охранник англоговорящий ну или что переводчик в помощь,все подсказали ,дали анкету заполнить на открытие счета вопросы в анкете базовые,откуда где живешь инн и прочее,после позвал парень справа за столом сидящий все сам почти сделал было легко ,30 минут и счет открыт - поэтому в целом 👍🏻 …', 'finance', 'bank', NULL,
   '+84 258 3830 949', 'Понедельник: 07:30–11:30; Вторник: 07:30–11:30; Среда: 07:30–11:30; Четверг: 07:30–11:30; Пятница: 07:30–11:30; Суббота: Закрыто; Воскресенье: Закрыто', '626 Đ. 2/4, Vĩnh Phước, Bắc Nha Trang, Khánh Hòa 650000, Вьетнам', 'Для людей с огр. возможностями: Нет вход для людей на инвалидных колясках, Нет парковка с доступом для инвалидов-колясочников', 12.2743494, 109.1979013,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Vietcombank+-+PGD+V%C4%A9nh+H%E1%BA%A3i/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31706756ed6e06d3:0x32c8b986f8657a31!8m2!3d12.2743494!4d109.1979013!15sCgRiYW5rWgYiBGJhbmuSAQRiYW5rmgFEQ2k5RFFVbFJRVU52WkVOb2RIbGpSamx2VDJ4Rk5Wa3dSa1pXYmtad1RYcGFhVmR1WkhOa1ZYUkhUbnBDTlZORlJSQULgAQD6AQQIABAz!16s%2Fg%2F11f6g1fklb?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 2.7)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('SeaBank - Nha Trang', 'Счёт открыли быстро, но пользоваться очень неудобно, карту не выдают, валюту поменять нельзя, со своего счёта перечислить деньги в Европу нельзя. Очень непонятный сервис. | По этому адресу офисов нет, адрес нового офиса находится рядом в 3 мин пешком 82 LY THANH TON STREET, PHUONG SAI WARD | Уже карты не выдают, открытие счета 1,1 млн, снять деньги в банкомате нельзя без карты или другом офисе , только в этом обналичивают. Договор на руки не отдают, не ясно как найти БИК/СВИФТ код банка, какие комиссии, приложение на слабую 4, …', 'finance', 'bank', NULL,
   '+84 258 3819 003', 'Понедельник: 08:00–17:00; Вторник: 08:00–17:00; Среда: 08:00–17:00; Четверг: 08:00–17:00; Пятница: 08:00–17:00; Суббота: Закрыто; Воскресенье: Закрыто', '82 Lý Thánh Tôn, Phường Tây, Tây Nha Trang, Khánh Hòa 650000, Вьетнам', 'Для людей с огр. возможностями: Нет вход для людей на инвалидных колясках, Нет парковка с доступом для инвалидов-колясочников', 12.2481578, 109.1894832,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/SeaBank+-+Nha+Trang/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x3170678088c77157:0xdc191127be901be7!8m2!3d12.2481578!4d109.1894832!15sCgRiYW5rWgYiBGJhbmuSAQRiYW5rmgEkQ2hkRFNVaE5NRzluUzBWSlEwRm5TVU40ZDJKaWVIRkJSUkFC4AEA-gEECAAQPQ!16s%2Fg%2F1v6wltlg?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.1)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Ngân hàng Agribank', 'Это был мой первый визит в отделение Agribank. Я пришла около 11:00 утра, и в отделении было тихо, поэтому меня обслужили сразу же. Кассир была дружелюбной и услужливой. | Я являюсь соседом вашего сотрудника, и ваш сотрудник оскорбил мою семью и меня. Ваш сотрудник крайне невоспитан. | Я спросил, есть ли какие-либо комиссии за внесение денег в другой банк. Мне ответили, что нет. Но после внесения денег, по их словам, была взиматься комиссия в размере 22 000 VND.', 'finance', 'bank', NULL,
   '+84 1900 558818', 'Понедельник: 08:00–16:30; Вторник: 08:00–16:30; Среда: 08:00–16:30; Четверг: 08:00–16:30; Пятница: 08:00–16:30; Суббота: Закрыто; Воскресенье: Закрыто', '80 Trần Phú, Nha Trang, Khánh Hòa 650000, Вьетнам', 'Для людей с огр. возможностями: Нет вход для людей на инвалидных колясках', 12.251282, 109.187678,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Ng%C3%A2n+h%C3%A0ng+Agribank/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705d7e1c6edd85:0x1e4d4193a7335406!8m2!3d12.251282!4d109.187678!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11btrrx_m9?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 2.3)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('BẮC Á BANK - CN KHÁNH HOÀ', 'Нормальный банк, приложение работает хорошо, но персонал очень плавный, как в мультике про Блиц Блиц - скорость без границ! | Чёрт, там написано, что для аутентификации нужно отсканировать QR-код на CCCD, но сканирование занимает целую вечность. Дело не в хорошей системе безопасности банка, а в неразвитости банковского ПО. Попробуйте отсканировать сайты других банков, и всё получится. | Если банку безразлично, обновлять ли правильное местоположение, зачем вообще доверять ему свои деньги?', 'finance', 'bank', NULL,
   '+84 258 6267 666', 'Понедельник: 07:30–16:30; Вторник: 07:30–16:30; Среда: 07:30–16:30; Четверг: 07:30–16:30; Пятница: 07:30–16:30; Суббота: 07:30–11:30; Воскресенье: Закрыто', '22 - 24 - 26 Đường Đ. Lê Thành Phương, Tây Nha Trang, Khánh Hòa 650000, Вьетнам', 'Для людей с огр. возможностями: Вход для людей на инвалидных колясках, Парковка с доступом для инвалидов-колясочников', 12.2508588, 109.1878036,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/B%E1%BA%AEC+%C3%81+BANK+-+CN+KH%C3%81NH+HO%C3%80/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x3170675b2e81d4bd:0x3485723a94719760!8m2!3d12.2508588!4d109.1878036!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11f6ndrkhs?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.1)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('HDBank Phòng Giao Dịch Chợ Mới', 'Плохо, очень плохо, я не смог перевести деньги. Подошёл к стойке на улице 23/10, но там сказали, что не могут. Вынужден был ехать в это отделение больше часа, чтобы не перевести деньги, а потом и вовсе заблокировать приложение. Обратился в … | После оформления кредита я жду его выплаты, но её постоянно откладывают. Сотрудники говорят, что выдают кредиты только на сумму 500 миллионов донгов и более, а если не могут выдать кредит на 250 миллионов донгов, то вообще не должны выдавать деньги. Как они могут выдавать деньги, а потом говорить, что не могут их выдать? | Мобильное приложение ужасно. В нём до сих пор куча багов, и спустя 4 дня никакой поддержки. Невероятно!', 'finance', 'bank', NULL,
   NULL, 'Понедельник: 07:30–11:30; Вторник: 07:30–11:30; Среда: 07:30–11:30; Четверг: 07:30–11:30; Пятница: 07:30–11:30; Суббота: Закрыто; Воскресенье: Закрыто', '22 Đ. 23 Tháng 10, Phương sơn, Tây Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2503079, 109.1798844,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/HDBank+Ph%C3%B2ng+Giao+D%E1%BB%8Bch+Ch%E1%BB%A3+M%E1%BB%9Bi/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705d7f03d91721:0x35139f46ca5d7275!8m2!3d12.2503079!4d109.1798844!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F1hc6wy6tc?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 2.3)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('ACB - PGD Phương Sơn', 'Сотрудники службы поддержки клиентов были невероятно грубыми и некомпетентными. Они посоветовали мне открыть кредитную карту без годовой платы и без платы за отмену в течение года. Договор был четко оговорен. Но когда я отменила карту, с … | Представитель службы поддержки клиентов сказал, что при открытии кредитной карты не взимается годовая плата и плата за отмену после года использования. Теперь, спустя год, при отмене карты, с меня взяли плату за отмену в размере 110 000 … | Я пришел сюда, чтобы пополнить свой счет. Процесс прошел очень быстро; деньги поступили на мой счет в течение 5 минут.', 'finance', 'bank', NULL,
   '+84 258 3562 999', 'Понедельник: 07:30–16:30; Вторник: 07:30–16:30; Среда: 07:30–16:30; Четверг: 07:30–16:30; Пятница: 07:30–16:30; Суббота: 07:30–11:30; Воскресенье: Закрыто', '53 Đ. 23 Tháng 10, Phương sơn, Tây Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2500639, 109.1795649,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/ACB+-+PGD+Ph%C6%B0%C6%A1ng+S%C6%A1n/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705df110be8c49:0x7a1d6b8b5443840a!8m2!3d12.2500639!4d109.1795649!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11sgyvmhtz?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 2.7)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('International Bank - VIB Phan Chu Trinh', 'Я хотел бы серьёзно проанализировать работу VIB Bank. Я выплачиваю кредит уже более 1 месяца, обязательство полностью выполнено, но до сих пор VIB не вернул мне заложенное имущество. … | 6 октября: Процесс изготовления карты прошёл гладко, впечатления остались довольно приятными, персонал был дружелюбным, в отличие от Vietcombank в Камрани, где сотрудники не были инициативными и дружелюбными, помогая клиентам сделать карту … | Персонал был полон энтузиазма. Охранник был великолепен. Спасибо.', 'finance', 'bank', NULL,
   '+84 258 7300 380', 'Понедельник: 08:00–12:00; Вторник: 08:00–12:00; Среда: 08:00–12:00; Четверг: 08:00–12:00; Пятница: 08:00–12:00; Суббота: 08:00–12:00; Воскресенье: Закрыто', '49 – 51 Thích Quảng Đức, Phước Hải, Nam Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2384998, 109.1784138,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/International+Bank+-+VIB+Phan+Chu+Trinh/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31706786a5512f55:0xddd0769f9141cb34!8m2!3d12.2384998!4d109.1784138!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11c5_s24qn?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 4.0)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('ACB - CN Khánh Hòa', 'Это страшное место ! Что бы получить перевод Вестерн Юнион , я сидела , внимание, 1,5 часа !!! Не в очереди, а с консультантом, который должен был дать мне наличку!!! В других банках такого не было . Худший банк на весь город ! | Банк отвратительный. Сотрудники медленные, перепроверяют абсолютно не важную информацию. На выдачу перевода она умудрилась потрать более 30 минут | Очень все доооооооооолллллггггггоооооооооот', 'finance', 'bank', NULL,
   '+84 258 3525 999', 'Понедельник: 07:30–16:30; Вторник: 07:30–16:30; Среда: 07:30–16:30; Четверг: 07:30–16:30; Пятница: 07:30–16:30; Суббота: 07:30–11:30; Воскресенье: Закрыто', '80 Đ. Quang Trung, P, Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.247266, 109.1911554,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/ACB+-+CN+Kh%C3%A1nh+H%C3%B2a/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31706781cc88b309:0x981b70a81a36f679!8m2!3d12.247266!4d109.1911554!15sCgRiYW5rWgYiBGJhbmuSAQRiYW5rmgEjQ2haRFNVaE5NRzluUzBWSlEwRm5TVVI0TWtsZlVrOW5FQUXgAQD6AQQIABAL!16s%2Fg%2F1vtqskvk?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 2.8)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('MB Hoàng Diệu', 'Ужасное обслуживание. Каждый сотрудник пытался отправить меня непонятно куда. В итоге я потерял кучу времени, но никакой информации так и не получил. Охрана откровенно хамит! | Замечательное обслуживание, быстро и оперативно открыли счёт, вежливые и улыбчивые сотрудницы😉 … | Профессиональное и дружелюбное обслуживание. Быстрое обслуживание, начиная с присвоения номера в очереди.', 'finance', 'bank', NULL,
   '+84 258 6263 366', 'Понедельник: 07:30–11:30; Вторник: 07:30–11:30; Среда: 07:30–11:30; Четверг: 07:30–11:30; Пятница: 07:30–11:30; Суббота: Закрыто; Воскресенье: Закрыто', '27/21 Đ. 7B, Phước Trung, Nam Nha Trang, Khánh Hòa, Вьетнам', NULL, 12.2184822, 109.1959502,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/MB+Ho%C3%A0ng+Di%E1%BB%87u/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067dc72189aa3:0x685da4f080133324!8m2!3d12.2184822!4d109.1959502!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11wnmm2c72?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 4.6)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Вьетнамско-Российский Совместный Банк - Филиал Кхань Хоа', 'Банкомат при филиале не работал. На объявлении написали идти в их другой банкомат. Другой банкомат списал деньги с карты, наличные не выдал и съел карту. Горячий номер не отвечает. Ни один номер с их сайта не отвечает. При этом курс на сегодняшний день 18217 рублей за 5000000 донгов | Бестолковый банк, всё очень медленно, карты не выдают, вроде как есть какая-то интеграция с ВТБ, но в приложении банка никакой информации об этом нет, поддержка втб вообще не в курсе о существовании этого банка | Все работает. Максимально снимает до 5 млн донг за одну операцию. Можно подряд несколько операций. Сняли два раза по 5 млн донг. Карту не съел 😄 ВТБ МИР работает отлично. Курс 314,26 донг за рубль (с учетом комиссий при снятии 5 млн). ВРБ это объединение ВТБ и Вьетнамского банка. Поэтому все должно было сработать исправно. …', 'finance', 'bank', NULL,
   '+84 258 3810 115', 'Понедельник: 08:00–11:30; Вторник: 08:00–11:30; Среда: 08:00–11:30; Четверг: 08:00–11:30; Пятница: 08:00–11:30; Суббота: Закрыто; Воскресенье: Закрыто', '159 Thống Nhất, Vạn Thắng, Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2512931, 109.1879815,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/%D0%92%D1%8C%D0%B5%D1%82%D0%BD%D0%B0%D0%BC%D1%81%D0%BA%D0%BE-%D0%A0%D0%BE%D1%81%D1%81%D0%B8%D0%B9%D1%81%D0%BA%D0%B8%D0%B9+%D0%A1%D0%BE%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%BD%D1%8B%D0%B9+%D0%91%D0%B0%D0%BD%D0%BA+-+%D0%A4%D0%B8%D0%BB%D0%B8%D0%B0%D0%BB+%D0%9A%D1%85%D0%B0%D0%BD%D1%8C+%D0%A5%D0%BE%D0%B0/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705d7e1d9b1fbb:0x5ad77c243e8405b!8m2!3d12.2512931!4d109.1879815!15sCgRiYW5rWgYiBGJhbmuSAQRiYW5rmgEjQ2haRFNVaE5NRzluUzBWSlEwRm5TVVJmZHpSeGExaDNFQUXgAQD6AQUI2wEQMw!16s%2Fg%2F11cmdncvkr?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.1)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Ngân hàng Thương mại TNHH MTV Ngoại thương Công nghệ số - VCBNeo - Chi nhánh Nha Trang', 'Процесс был быстрым и простым. Охранник всегда был готов открыть дверь для посетителей. | Местный банк. Хорошее и быстрое обслуживание. | Хорошее обслуживание. Высокая процентная ставка.', 'finance', 'bank', NULL,
   '+84 258 3820 013', 'Понедельник: 07:30–11:30; Вторник: 07:30–11:30; Среда: 07:30–11:30; Четверг: 07:30–11:30; Пятница: 07:30–11:30; Суббота: Закрыто; Воскресенье: Закрыто', '30 Đ. Quang Trung, Vạn Thạnh, Nha Trang, Khánh Hòa 57000, Вьетнам', NULL, 12.2504399, 109.1904098,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Ng%C3%A2n+h%C3%A0ng+Th%C6%B0%C6%A1ng+m%E1%BA%A1i+TNHH+MTV+Ngo%E1%BA%A1i+th%C6%B0%C6%A1ng+C%C3%B4ng+ngh%E1%BB%87+s%E1%BB%91+-+VCBNeo+-+Chi+nh%C3%A1nh+Nha+Trang/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31706780e153900d:0x8d29bbc98636713!8m2!3d12.2504399!4d109.1904098!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11b7svvrtt?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 4.5)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('VietinBank ATM', '6 августа 2024 г. Не работает из-за нехватки наличных. Интересно, сработает ли, если я буду держать при себе щедрую сумму наличных. Эх. …', 'finance', 'bank', NULL,
   NULL, 'Понедельник: 24 часа в сутки; Вторник: 24 часа в сутки; Среда: 24 часа в сутки; Четверг: 24 часа в сутки; Пятница: 24 часа в сутки; Суббота: 24 часа в сутки; Воскресенье: 24 часа в сутки', '65JX+H85, Trần Phú, Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.231345, 109.198406,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/VietinBank+ATM/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067003efcd0bb:0xc9c7462d9c2ee400!8m2!3d12.231345!4d109.198406!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11y3jh85l9?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 2.3)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Eximbank - CN Nha Trang', 'Здесь нет комиссий за снятие наличных в банкоматах. Карта Hana Bank Travelogue Надеюсь, это поможет~~~ … | По состоянию на 5 февраля 2026 года Обмен долларов на вьетнамские донги занял 40-50 минут, и персонал был груб. Это было просто ужасно… … | Корейские воны не подлежат обмену, обмену подлежат только доллары США. 100 долларов США — это примерно 2,6 миллиона донгов.', 'finance', 'bank', NULL,
   '+84 258 3811 888', NULL, '63 Yersin, P.Tây, Tây Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2493573, 109.188835,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Eximbank+-+CN+Nha+Trang/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067806261e613:0xeec8779dc21f8fea!8m2!3d12.2493573!4d109.188835!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F1pzq8cq_0?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 4.3)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('PGD Vĩnh Hải - CN Khánh Hoà - Ngân hàng TMCP Đầu tư & Phát triển Việt Nam (BIDV)', 'Обслуживание в банке крайне медленное. На простую операцию уходит слишком много времени. … | Обслуживание медленное. Кто последний, тот и обслуживается первым. Очередь бессмысленна. Все пытаются пролезть без очереди. Особенно женщина посередине, которая постоянно говорит кассиру обслуживать своих клиентов 26 апреля 2024 года. 1 балл. | Клиентов много, но персонала мало, и сотрудники работают медленно.', 'finance', 'bank', NULL,
   '+84 258 3836 118', 'Понедельник: 07:30–11:30; Вторник: 07:30–11:30; Среда: 07:30–11:30; Четверг: 07:30–11:30; Пятница: 07:30–11:30; Суббота: Закрыто; Воскресенье: Закрыто', '24B1 đường 2/4, Vĩnh Hải, Nha Trang, Bắc Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.27952, 109.1955,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/PGD+V%C4%A9nh+H%E1%BA%A3i+-+CN+Kh%C3%A1nh+Ho%C3%A0+-+Ng%C3%A2n+h%C3%A0ng+TMCP+%C4%90%E1%BA%A7u+t%C6%B0+%26+Ph%C3%A1t+tri%E1%BB%83n+Vi%E1%BB%87t+Nam+(BIDV)/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067fa7324c60b:0xe062ac547c34d1a4!8m2!3d12.27952!4d109.1955!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11f_j9j66q?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 2.3)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Ngân hàng Bản Việt - BVBank Nha Trang', 'Ужасное качество обслуживания, они судят о людях по внешнему виду. Персонал по своей природе высокомерен и обслуживает только исходя из своих финансовых возможностей. … | Отличное обслуживание на стойке. Настоятельно рекомендую открыть у них счет.', 'finance', 'bank', NULL,
   '+84 1900 555596', 'Понедельник: 07:30–12:00; Вторник: 07:30–12:00; Среда: 07:30–12:00; Четверг: 07:30–12:00; Пятница: 07:30–12:00; Суббота: Закрыто; Воскресенье: Закрыто', '14 Ngô Gia Tự, Tân Tiến, Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2444843, 109.191123,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Ng%C3%A2n+h%C3%A0ng+B%E1%BA%A3n+Vi%E1%BB%87t+-+BVBank+Nha+Trang/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x3170677dff0218b3:0x8d8271f7d17b6cc8!8m2!3d12.2444843!4d109.191123!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11b906sj6d?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.7)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('PGD Vĩnh Phước - CN Nha Trang - Ngân hàng TMCP Đầu tư & Phát triển Việt Nam (BIDV)', 'Снимать деньги то еще удовольствие, нужно пройти 3 круга ада, думал будет проще, но видимо простота не их конек. | Вьетнамцев принимают вперед иностранцев. График работы не совпадает с указанным. Охранник предлагает свои услуги по снятию наличных за определенную оплату. | Сотрудники не владеют английским языком. Не понимают даже с вьетнамским переводчиком. Граждан Вьетнама пропускают без очереди. Медленно работают это очень мягко сказано.', 'finance', 'bank', NULL,
   '+84 258 3542 836', 'Понедельник: 07:30–11:30; Вторник: 07:30–11:30; Среда: 07:30–11:30; Четверг: 07:30–11:30; Пятница: 07:30–11:30; Суббота: Закрыто; Воскресенье: Закрыто', '523 Hai Tháng Tư, Vĩnh Phước, Bắc Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2729818, 109.1983062,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/PGD+V%C4%A9nh+Ph%C6%B0%E1%BB%9Bc+-+CN+Nha+Trang+-+Ng%C3%A2n+h%C3%A0ng+TMCP+%C4%90%E1%BA%A7u+t%C6%B0+%26+Ph%C3%A1t+tri%E1%BB%83n+Vi%E1%BB%87t+Nam+(BIDV)/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067f223d153f3:0xa247d1d50a34695!8m2!3d12.2729818!4d109.1983062!15sCgRiYW5rWgYiBGJhbmuSAQRiYW5rmgEjQ2haRFNVaE5NRzluUzBWSlEwRm5UVVIzY25WMk1WSkJFQUXgAQD6AQQIABAQ!16s%2Fg%2F11f_j94kd8?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 2.0)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Orient Commercial Joint Stock Bank - Khanh Hoa Branch', NULL, 'finance', 'bank', NULL,
   '+84 258 3820 883', NULL, 'NHA Trang, Кханьхоа 650000, Вьетнам', NULL, 12.2513829, 109.1893455,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Orient+Commercial+Joint+Stock+Bank+-+Khanh+Hoa+Branch/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31706780b849b6af:0xd3b16a87ca0f5528!8m2!3d12.2513829!4d109.1893455!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F1wk49k9l?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', NULL)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Industrial and Commercial Bank of Vietnam - VietinBank - Khanh Hoa Branch - Enclosed Fund 05', NULL, 'finance', 'bank', NULL,
   NULL, 'Понедельник: 24 часа в сутки; Вторник: 24 часа в сутки; Среда: 24 часа в сутки; Четверг: 24 часа в сутки; Пятница: 24 часа в сутки; Суббота: 24 часа в сутки; Воскресенье: 24 часа в сутки', '275 Thống Nhất, Street, Tây Nha Trang, Khánh Hòa 700000, Вьетнам', NULL, 12.2504301, 109.1851702,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Industrial+and+Commercial+Bank+of+Vietnam+-+VietinBank+-+Khanh+Hoa+Branch+-+Enclosed+Fund+05/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705d7e5eb009df:0x1380b1d284839974!8m2!3d12.2504301!4d109.1851702!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11b6d41mrf?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 4.0)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Ngân Hàng Tmcp Nam Á - Namabank', NULL, 'finance', 'bank', NULL,
   '+84 258 6254 132', NULL, '7543+R5C, Đ. 23 Tháng 10, Vĩnh Thạnh, Tây Nha Trang, Khánh Hòa, Вьетнам', NULL, 12.2570729, 109.152906,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Ng%C3%A2n+H%C3%A0ng+Tmcp+Nam+%C3%81+-+Namabank/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705d0f7afe4061:0x68496f262c0e6332!8m2!3d12.2570729!4d109.152906!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F1jkvzf4bz?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 1.0)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('ACB - PGD Vĩnh Phước', 'Открыли счет РУ паспорт+ виза 90 дней | Отличный банк. Приятный персонал. Все сотрудники вежливы, дружелюбны и пытаются помочь. Молодцы! Чувствуешь себя важным клиентом в этом банке. | Сервис крайне скучный, ребята, 4.0, но при обращении к точке транзакции ответ запутанный. Просто подойдите к коммутатору, там указан только пункт транзакции. С примерно четырьмя такими точками транзакции ACB, вероятно, закроется.', 'finance', 'bank', NULL,
   '+84 258 3543 999', 'Понедельник: 07:30–16:30; Вторник: 07:30–16:30; Среда: 07:30–16:30; Четверг: 07:30–16:30; Пятница: 07:30–16:30; Суббота: 07:30–11:30; Воскресенье: Закрыто', '389 - 391 - 393 Đường Hai Tháng Tư Phường Vĩnh Hải, TP. Nha Trang, Tỉnh Khánh Hòa NT, 391-393 Đ. 2/4, Vĩnh Hải, Bắc Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2781754, 109.1963182,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/ACB+-+PGD+V%C4%A9nh+Ph%C6%B0%E1%BB%9Bc/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067ec63d96b01:0xa573dd572044f1c9!8m2!3d12.2781754!4d109.1963182!15sCgRiYW5rWgYiBGJhbmuSAQRiYW5rmgFEQ2k5RFFVbFJRVU52WkVOb2RIbGpSamx2VDJ4d1NHTnBNVXhoUkZaMldsWlNObEl6Y0doa1ZtOHdVa2RHZUdGV1JSQULgAQD6AQQIYRAt!16s%2Fg%2F11smls_rpb?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 4.0)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Branch Bank of East Asia', 'Проглатывание банковской карты не поддерживается иногородними клиентами. | Обслуживание было превосходным.', 'finance', 'bank', NULL,
   NULL, NULL, '49 Lý Thánh Tôn, Lộc Thọ, Nha Trang, Khánh Hòa 650000, Вьетнам', 'Для людей с огр. возможностями: Нет вход для людей на инвалидных колясках', 12.2483875, 109.1899663,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Branch+Bank+of+East+Asia/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067804422e341:0x7ff765a92af094fe!8m2!3d12.2483875!4d109.1899663!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F1tf33fxf?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.5)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('BAOVIET Bank - CN Khánh Hòa', 'Приобрела страховку. Менеджер сказал: “При любом случае сразу пишите мне, прежде чем ехать по экстренной ситуации”. В первый раз мы писали ему трое суток — ноль реакции. Ответил только после того, как мы уже приехали в страховую и … | Меняют доллары ТОЛЬКО нового образца( | Молодой и привлекательный персонал обеспечил внимательное, оперативное и доброжелательное обслуживание. Я остался очень доволен процессом совершения операций в банке Baoviet.', 'finance', 'bank', NULL,
   '+84 258 3529 698', 'Понедельник: 08:00–16:00; Вторник: 08:00–16:00; Среда: 08:00–16:00; Четверг: 08:00–16:00; Пятница: 08:00–16:00; Суббота: 08:00–11:00; Воскресенье: Закрыто', '8a Đinh Tiên Hoàng, Lộc Thọ, Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2466495, 109.1922372,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/BAOVIET+Bank+-+CN+Kh%C3%A1nh+H%C3%B2a/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31706778a7dcc459:0x43da7eef388bf22!8m2!3d12.2466495!4d109.1922372!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11byxfssdp?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.3)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('PGD Thống Nhất - CN Khánh Hoà - Ngân hàng TMCP Đầu tư & Phát triển Việt Nam (BIDV)', 'Торговый цент электроники | Уважаемый Совет директоров BIDV Khanh Hoa – Транзакционный офис Thong Nhat! Я хотел бы направить жалобу на мой неудовлетворительный опыт совершения … | Должна сказать, что отношение всего персонала здесь просто ужасное. (29 октября 2025 г.) Кассирша, которая оформляла банковскую карту для моей матери, не упомянула о …', 'finance', 'bank', NULL,
   '+84 258 3823 699', 'Понедельник: 08:00–11:30; Вторник: 08:00–11:30; Среда: 08:00–11:30; Четверг: 08:00–11:30; Пятница: 08:00–11:30; Суббота: Закрыто; Воскресенье: Закрыто', '47 Thống Nhất, Vạn Thạnh, Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2523857, 109.1909981,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/PGD+Th%E1%BB%91ng+Nh%E1%BA%A5t+-+CN+Kh%C3%A1nh+Ho%C3%A0+-+Ng%C3%A2n+h%C3%A0ng+TMCP+%C4%90%E1%BA%A7u+t%C6%B0+%26+Ph%C3%A1t+tri%E1%BB%83n+Vi%E1%BB%87t+Nam+(BIDV)/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31706786d5d89f9d:0xa444b162ec096577!8m2!3d12.2523857!4d109.1909981!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11f_j931cl?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 2.8)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Ngân Hàng Bưu Điện Liên Việt - Chi Nhánh Khánh Hòa', 'Банк закрылся в 16:00 26-го числа Тет (Лунного Нового года). Я пропустила столько всего. Я больше никогда не воспользуюсь их услугами, хотя он находится прямо рядом с моим рабочим местом. | Обслуживание на кассе очень медленное. Выписка заняла час. Вам следует выбрать другой банк. Низкое качество обслуживания. | Я пользуюсь картой, и деньги списываются без причины. Когда я звоню на горячую линию, линия всегда занята. В общем, это ужасно. Вся система использует один и тот же номер службы поддержки. Уточните в банке.', 'finance', 'bank', NULL,
   '+84 935 098 554', 'Понедельник: 07:30–11:30; Вторник: 07:30–11:30; Среда: 07:30–11:30; Четверг: 07:30–11:30; Пятница: 07:30–11:30; Суббота: 07:30–11:30; Воскресенье: Закрыто', '69-71 Thống Nhất, P, Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2522124, 109.1904917,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Ng%C3%A2n+H%C3%A0ng+B%C6%B0u+%C4%90i%E1%BB%87n+Li%C3%AAn+Vi%E1%BB%87t+-+Chi+Nh%C3%A1nh+Kh%C3%A1nh+H%C3%B2a/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067872cd046f3:0x3a92a63d9095f4f2!8m2!3d12.2522124!4d109.1904917!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F1hc1nvvtt?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.2)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('CN Khánh Hoà - Ngân hàng TMCP Đầu tư & Phát triển Việt Nam (BIDV)', 'Все хорошо, счёт открыть быстро и без проблем. Минус только за то что - кто встал тот место потерял. По сути оставалось помочь в настройке приложения ну нужно было подождать смс, вышел перекурить и уже место у менеджера занято. Пришлось … | Отказали в обмене долларов США, причина типа старые и грязные). Долары были 1999 +-года выпуска, и просто лежали в кармане. Вообще с такой фигнёй сталкивался только в Иране, они там тоже любят только новые $ США)) | Лучше воспользоваться услугами любого другого банка', 'finance', 'bank', NULL,
   '+84 258 3823 495', 'Понедельник: 07:30–11:30; Вторник: 07:30–11:30; Среда: 07:30–11:30; Четверг: 07:30–11:30; Пятница: 07:30–11:30; Суббота: Закрыто; Воскресенье: Закрыто', 'Số 35 Đ. 2/4, Vạn Thạnh, Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2536675, 109.1894235,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/CN+Kh%C3%A1nh+Ho%C3%A0+-+Ng%C3%A2n+h%C3%A0ng+TMCP+%C4%90%E1%BA%A7u+t%C6%B0+%26+Ph%C3%A1t+tri%E1%BB%83n+Vi%E1%BB%87t+Nam+(BIDV)/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x3170678714d50555:0xefd83fbcc33bda2f!8m2!3d12.2536675!4d109.1894235!15sCgRiYW5rWgYiBGJhbmuSAQRiYW5rmgFEQ2k5RFFVbFJRVU52WkVOb2RIbGpSamx2VDIxR01XSnRiRVZSYlRGMVZWTXhjRlZHY0cxT1JrNVlXbGh3ZEZKWVl4QULgAQD6AQQIABAk!16s%2Fg%2F11f1rdbfwm?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.2)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('PVcomBank Khánh Hòa', 'Отличный банк, большое им спасибо за кредит на новенький айфон 17 про макс | Ужасно 🙂‍↔️. Клиент сидит, а начальник отдела или кто-то ещё стоит, чтобы поговорить с … | Мама, в офисе социального обеспечения мне сказали открыть карту. Теперь я не могу быстро перевести деньги ни в один банк. Это ужасно.', 'finance', 'bank', NULL,
   '+84 24 6287 1709', 'Понедельник: 08:00–17:00; Вторник: 08:00–17:00; Среда: 08:00–17:00; Четверг: 08:00–17:00; Пятница: 08:00–17:00; Суббота: 08:00–12:00; Воскресенье: Закрыто', '2 Đ. Lê Thành Phương, Vạn Thạnh, Tây Nha Trang, Khánh Hòa 12015, Вьетнам', NULL, 12.2518965, 109.1875174,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/PVcomBank+Kh%C3%A1nh+H%C3%B2a/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x313455336f1cb0f3:0xa2cbee19b049cd99!8m2!3d12.2518965!4d109.1875174!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11mv53hzf1?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 2.0)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('ACB - PGD Phước Long Khánh Hòa', 'Я оплатил сбор, но ждал 20 минут оформления документов, а до сих пор их не получил. Процесс невероятно медленный. | Персонал был полон энтузиазма и дружелюбен. Управляющий филиалом также был готов помочь с процедурами, если это было необходимо. С этого момента я буду чаще пользоваться услугами банка ACB. | В банке не было охранника, который бы направлял пассажиров; если вы случайно спускались в подвал, вас тут же загоняли обратно. Там царила очень высокомерная и раздражающая атмосфера. Я больше никогда сюда не вернусь.', 'finance', 'bank', NULL,
   '+84 258 3883 999', 'Понедельник: 07:30–16:30; Вторник: 07:30–16:30; Среда: 07:30–16:30; Четверг: 07:30–16:30; Пятница: 07:30–16:30; Суббота: 07:30–11:30; Воскресенье: Закрыто', '386 - 388 ( số cũ) đường, Lê Hồng Phong, Phước Trung, Nam Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2197133, 109.1873429,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/ACB+-+PGD+Ph%C6%B0%E1%BB%9Bc+Long+Kh%C3%A1nh+H%C3%B2a/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705d719e1e188b:0x4cbbbd9c331edbe8!8m2!3d12.2197133!4d109.1873429!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11rkfv9xpw?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 2.1)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Ngân Hàng Tmcp Nam Á (Namabank) - Pgd', 'Ужасный опыт. Я открыл счет и запросил карту 13 октября, и сегодня, спустя 22 дня, я до сих пор не получил физическую карту. Я не могу снять деньги через QR-код. На кассе сотрудники сказали, что спрос на карты высок, и что клиенты, желающие … | Банковское обслуживание было относительно хорошим, охрана работала исправно, а офисное помещение выглядело очень роскошно.', 'finance', 'bank', NULL,
   NULL, 'Понедельник: 07:30–11:30; Вторник: 07:30–11:30; Среда: 07:30–11:30; Четверг: 07:30–11:30; Пятница: 07:30–11:30; Суббота: 07:30–11:30; Воскресенье: Закрыто', '312 Dã Tượng, Vĩnh Nguyên, Nha Trang, Khánh Hòa, Вьетнам', NULL, 12.2169445, 109.1984746,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Ng%C3%A2n+H%C3%A0ng+Tmcp+Nam+%C3%81+(Namabank)+-+Pgd/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x3170675b3df5495f:0x151b8f4e6ab54a95!8m2!3d12.2169445!4d109.1984746!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F12mjyh7gn?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.3)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Vietnam Technological and Commercial Joint Stock Bank - Nha Trang Branch', 'Банк безнадёжный. У них нет электронной почты, и я не могу с ними связаться.', 'finance', 'bank', NULL,
   NULL, NULL, 'Ward/40 Thống Nhất, Street, Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2524345, 109.1905296,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Vietnam+Technological+and+Commercial+Joint+Stock+Bank+-+Nha+Trang+Branch/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067872ea3dc1f:0xe430f055213f6337!8m2!3d12.2524345!4d109.1905296!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11btmb3b1m?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 2.7)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('State Bank Of Vietnam In Khanh Hoa', NULL, 'finance', 'bank', NULL,
   '+84 258 3822 311', NULL, '159 Thong Nhat Street, Nha Trang City,, Vạn Thạnh, Nha Trang, Khánh Hòa, Вьетнам', NULL, 12.2524827, 109.190551,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/State+Bank+Of+Vietnam+In+Khanh+Hoa/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705d7e4299bc89:0x94432c17b156ea9a!8m2!3d12.2524827!4d109.190551!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F1tf55ccr?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', NULL)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('State Bank Of Vietnam In Khanh Hoa', NULL, 'finance', 'bank', NULL,
   '+84 258 3822 311', NULL, '159 Thong Nhat Street, Nha Trang City,, Vạn Thạnh, Nha Trang, Khánh Hòa, Вьетнам', NULL, 12.2524827, 109.190551,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/State+Bank+Of+Vietnam+In+Khanh+Hoa/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705d7e4299bc89:0x94432c17b156ea9a!8m2!3d12.2524827!4d109.190551!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F1tf55ccr?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', NULL)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('PGD Bình Tân - CN Khánh Hoà - Ngân hàng TMCP Đầu tư & Phát triển Việt Nam (BIDV)', 'Вместо обслуживания клиентов работники занимаются своими делами. Сидишь перед ними и смотришь, как они считают деньги. Особые личности лезут без очереди, охранник ничего не пытается с этим сделать, … | Отвратительная работа. Чтобы снять деньги потратила около часа!!! Очень все медленно работают! | Очень долго работают, постоянно зависают программы.', 'finance', 'bank', NULL,
   '+84 258 3885 809', 'Понедельник: 07:30–11:30; Вторник: 07:30–11:30; Среда: 07:30–11:30; Четверг: 07:30–11:30; Пятница: 07:30–11:30; Суббота: Закрыто; Воскресенье: Закрыто', '312 Dã Tượng, Vĩnh Hoà, Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.21691, 109.1983,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/PGD+B%C3%ACnh+T%C3%A2n+-+CN+Kh%C3%A1nh+Ho%C3%A0+-+Ng%C3%A2n+h%C3%A0ng+TMCP+%C4%90%E1%BA%A7u+t%C6%B0+%26+Ph%C3%A1t+tri%E1%BB%83n+Vi%E1%BB%87t+Nam+(BIDV)/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x3170675b1648a015:0x456ac62451d21403!8m2!3d12.21691!4d109.1983!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F1hc1_cgb2?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 2.4)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Techcombank Mã Vòng', 'Банк побуждает пользователей переводить сбережения на счёт третьего лица и снимает с себя ответственность за хамство. | Обслуживание в банке было ужасным; клиентов было немного, но они работали как черепахи, просто кошмар. Сидеть во время ожидания было негде, приходилось протискиваться. | TCB связана с обманутыми клиентами Manulife, будьте осторожны.', 'finance', 'bank', NULL,
   '+84 258 3561 414', 'Понедельник: 07:30–11:30; Вторник: 07:30–11:30; Среда: 07:30–11:30; Четверг: 07:30–11:30; Пятница: 07:30–11:30; Суббота: 07:30–11:30; Воскресенье: Закрыто', 'Chung cư Vĩnh Phước, Đ. 2/4, Bắc Nha Trang, Khánh Hòa 650000, Вьетнам', 'Для людей с огр. возможностями: Нет вход для людей на инвалидных колясках, Нет парковка с доступом для инвалидов-колясочников; Услуги: Обслуживание на месте; Посетители: Лояльность к трансгендерам, Подходит для ЛГБТК+', 12.2740632, 109.1977038,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Techcombank+M%C3%A3+V%C3%B2ng/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705d7f97d4d14d:0x3c306249a7543df2!8m2!3d12.2740632!4d109.1977038!15sCgRiYW5rWgYiBGJhbmuSAQRiYW5r4AEA!16s%2Fg%2F1hc21tx4t?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.4)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Bidv - Khanh Hoa Branch', 'Нормальный банк, выдают переводы Золотой Короной в долларах. Не особо расторопные конечно, минут 45 там приходится провести, но вежливые, никаких проблем не возникало | Курс у них не самый хороший, и персонал особо не чешется, но это единственный банк, в котором выдают квитанцию при обмене денег, проще контролировать расходы. | Отличный банк, отличное обслуживание', 'finance', 'bank', NULL,
   '+84 258 3814 165', 'Понедельник: 08:00–11:30; Вторник: 08:00–11:30; Среда: 08:00–11:30; Четверг: 08:00–11:30; Пятница: 08:00–11:30; Суббота: Закрыто; Воскресенье: Закрыто', '35 Hai Tháng Tư, Bắc Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2793483, 109.1955418,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Bidv+-+Khanh+Hoa+Branch/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x3170678770e73ea5:0x1a5bab5341bce063!8m2!3d12.2793483!4d109.1955418!15sCgRiYW5rWgYiBGJhbmuSAQRiYW5rmgFEQ2k5RFFVbFJRVU52WkVOb2RIbGpSamx2VDI1c2JWSkdiR3BOU0VKaFlsZDBURnBZY0VkWU0yUkxVMnBqTWxvell4QULgAQD6AQQIABAk!16s%2Fg%2F1tcyhjkm?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.7)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Ngân Hàng Việt Nam Thương Tín - Chi Nhánh Khánh Hòa', NULL, 'finance', 'bank', NULL,
   '+84 258 2227 373', NULL, '55a Lý Thánh Tôn, Lộc Thọ, Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2480349, 109.1897816,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Ng%C3%A2n+H%C3%A0ng+Vi%E1%BB%87t+Nam+Th%C6%B0%C6%A1ng+T%C3%ADn+-+Chi+Nh%C3%A1nh+Kh%C3%A1nh+H%C3%B2a/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067808a7c6747:0x8c118cf5c5c366ce!8m2!3d12.2480349!4d109.1897816!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F1tfh240k?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 4.7)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Agribank CN Nam Nha Trang', 'В банке чисто, персонал дружелюбный, всегда улыбается и готов помочь. Операции проходят быстро, но в часы пик может быть небольшая задержка. Впрочем, этого, вероятно, не избежать.', 'finance', 'bank', NULL,
   '+84 258 3886 090', NULL, '657R+474, Nguyễn Tất Thành, Nam Nha Trang, Khánh Hòa, Вьетнам', NULL, 12.212752, 109.190699,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Agribank+CN+Nam+Nha+Trang/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067579d93689d:0x142fd446bb8afc92!8m2!3d12.212752!4d109.190699!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11cncb2525?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 4.8)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('SeABank PGD Vĩnh Hải', 'Открыл счет в этом банке по паспорту РФ за 1.100.000 донгов. Есть мобильное приложение, но настолько устаревшее и тормозное, чтобы оплачивать по QR (причем каждый раз предлагают какую то страховку за 1.000vnd. В отделении чтобы снять со счета пару миллионов приходится подписать кучу бумажек и потратить минут 15-20 | Поскольку это небольшой частный банк, его обслуживание, естественно, лучше, чем у государственных конкурентов. | Когда я пришел открыть здесь банковский счет, мне сказали: «Мы не работаем с иностранцами». Хотя я встречал русских из Океануса, у которых есть счет в Seabank. Зачем вы лжете?', 'finance', 'bank', NULL,
   '+84 258 3835 588', 'Понедельник: 07:30–11:30; Вторник: 07:30–11:30; Среда: 07:30–11:30; Четверг: 07:30–11:30; Пятница: 07:30–11:30; Суббота: Закрыто; Воскресенье: Закрыто', '411 Đ. 2/4, Phường Bắc, Bắc Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.27739, 109.1968544,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/SeABank+PGD+V%C4%A9nh+H%E1%BA%A3i/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067f0f62ca6e7:0xbbfd99cd560eaa0c!8m2!3d12.27739!4d109.1968544!15sCgRiYW5rWgYiBGJhbmuSAQRiYW5rmgFEQ2k5RFFVbFJRVU52WkVOb2RIbGpSamx2VDJreFZrNVlZM3BPTTBKU1ZFWTRkRTFYZEhsTldHaDRUa1V4YVUxc1JSQULgAQD6AQQIABA8!16s%2Fg%2F11jn687fgw?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.6)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('BIDV NHA TRANG', 'Хотела сделать перевод Western Union в другую страну, но оказалось, что деньги могут переводить только те, кто официально трудоустроен во Вьетнаме, чтобы было подтверждение появление средств. Обидно, что узнала это только после 1,5 часов в … | Вообще не SMART банкинг. Несмотря на то, что BIDV открывает счета туристам, у этого банка множество недостатков перед конкурентом VCB. … | У них оказываются не рабочие дни с 1.09-04.09 откроются 5го, почему нельзя отметить эти дни в картах не рабочие? С 19 августа этот банк перестал выдавать переводы золотая корона', 'finance', 'bank', NULL,
   '+84 258 3816 945', 'Понедельник: 07:00–11:30; Вторник: 07:00–11:30; Среда: 07:00–11:30; Четверг: 07:00–11:30; Пятница: 07:00–11:30; Суббота: Закрыто; Воскресенье: Закрыто', '11 Đ. Quang Trung, Vạn Thạnh, Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2509682, 109.1904805,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/BIDV+NHA+TRANG/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31706780dc777d87:0x73f13fa102fbd80a!8m2!3d12.2509682!4d109.1904805!15sCgRiYW5rWgYiBGJhbmuSAQRiYW5rmgEkQ2hkRFNVaE5NRzluUzBWSlEwRm5TVU16TlhScE5IbFJSUkFC4AEA-gEECG0QMQ!16s%2Fg%2F11f0wycwqt?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.5)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('ATM An Binh Commercial Joint Stock Bank- Ly Thanh Ton', NULL, 'finance', 'bank', NULL,
   '+84 1900 571581', 'Понедельник: 24 часа в сутки; Вторник: 24 часа в сутки; Среда: 24 часа в сутки; Четверг: 24 часа в сутки; Пятница: 24 часа в сутки; Суббота: 24 часа в сутки; Воскресенье: 24 часа в сутки', '11 Lý Thánh Tôn, Vạn Thạnh, Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2501541, 109.1909909,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банкомат', 'https://www.google.com/maps/place/ATM+An+Binh+Commercial+Joint+Stock+Bank-+Ly+Thanh+Ton/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31706780fd81e8d1:0xfbb9aa32f0a0fdc8!8m2!3d12.2501541!4d109.1909909!15sCgRiYW5rkgEDYXRt4AEA!16s%2Fg%2F1pzsg9v0z?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 1.0)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Ngân Hàng Oceanbank Nha Trang', 'Правильное местоположение на карте. 3/2024 | Пятница, 9 февраля 2023 г. — плохая оценка сотрудника Днём, примерно с 16:40 до 17:00, я зашёл в банк Ocean Bank в начале улицы Фан Чу …', 'finance', 'bank', NULL,
   '+84 258 3822 281', 'Понедельник: 08:00–17:00; Вторник: 08:00–17:00; Среда: 08:00–17:00; Четверг: 08:00–17:00; Пятница: 08:00–17:00; Суббота: Закрыто; Воскресенье: Закрыто', '11 Lý Thánh Tôn, Vạn Thạnh, Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2501541, 109.1909909,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Финансы', 'https://www.google.com/maps/place/Ng%C3%A2n+H%C3%A0ng+Oceanbank+Nha+Trang/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31706780587e8053:0x7b5f9a49f85fe1cb!8m2!3d12.2501541!4d109.1909909!15sCgRiYW5rkgEVZmluYW5jaWFsX2luc3RpdHV0aW9u4AEA!16s%2Fg%2F11df7zgcvc?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.3)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('SCB Khánh Hòa - Ngân hàng TMCP Sài Gòn', 'Охранник не пускал внутрь( | Дружелюбный персонал, быстрые и простые процедуры. Через несколько дней позвонили из коммутатора банка, чтобы попросить клиентов оставить отзыв для улучшения качества обслуживания. … | Банковские процедуры громоздки, неэффективны и нелогичны.', 'finance', 'bank', NULL,
   '+84 258 3563 405', 'Понедельник: 08:00–12:00; Вторник: 08:00–12:00; Среда: 08:00–12:00; Четверг: 08:00–12:00; Пятница: 08:00–12:00; Суббота: Закрыто; Воскресенье: Закрыто', '57C Lý Thánh Tôn, Lộc Thọ, Nha Trang, Khánh Hòa 57000, Вьетнам', 'Для людей с огр. возможностями: Нет вход для людей на инвалидных колясках', 12.2478045, 109.1896434,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/SCB+Kh%C3%A1nh+H%C3%B2a+-+Ng%C3%A2n+h%C3%A0ng+TMCP+S%C3%A0i+G%C3%B2n/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067a132f0954f:0x18a8d3a1f0be39f!8m2!3d12.2478045!4d109.1896434!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11frtck_y9?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 2.5)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('KienlongBank Diên Khánh', 'Рядом с банком Kien Long продают вкуснейшие банькхео. 😂 …', 'finance', 'bank', NULL,
   '+84 258 3753 111', 'Понедельник: 07:30–17:00; Вторник: 07:30–17:00; Среда: 07:30–17:00; Четверг: 07:30–17:00; Пятница: 07:30–17:00; Суббота: 07:30–11:30; Воскресенье: Закрыто', NULL, NULL, 12.2567199, 109.1005584,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/KienlongBank+Di%C3%AAn+Kh%C3%A1nh/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705d81b1dee61d:0xcf4450e7df09ea6f!8m2!3d12.2567199!4d109.1005584!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F1hc5c7xsg?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.5)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('MSB Nha Trang', 'Выдали перевод WU, хотя это сейчас бывает проблематично в банках, в связи с неосведомлённостью сотрудников относительно визового автопродления. | Я впервые вижу банк, где операции настолько сложны. Перевод 100 000 VND разрешен, но любая сумма свыше 100 000 VND помечается как превышение лимита, хотя мне нужно перевести миллионы VND, и теперь я должен переводить по 100 000 VND за раз. Было бы несправедливо, если бы они позволили мне влезть в долги. | Процесс был быстрым, простым и понятным. Персонал также был приветливым и полным энтузиазма, а охранник был дружелюбным и общительным.', 'finance', 'bank', NULL,
   '+84 258 3560 586', 'Понедельник: 07:30–12:00; Вторник: 07:30–12:00; Среда: 07:30–12:00; Четверг: 07:30–12:00; Пятница: 07:30–12:00; Суббота: 07:30–12:00; Воскресенье: Закрыто', '51 Đ. Lê Thành Phương, phường Tây, Tây Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2487984, 109.1888177,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Финансы', 'https://www.google.com/maps/place/MSB+Nha+Trang/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067807009a287:0xadb54adf22b849c7!8m2!3d12.2487984!4d109.1888177!15sCgRiYW5rkgEVZmluYW5jaWFsX2luc3RpdHV0aW9u4AEA!16s%2Fg%2F11g8f_gf51?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.0)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('NCB Khánh Hòa - Ngân hàng Quốc Dân', NULL, 'finance', 'bank', NULL,
   '+84 1800 6166', 'Понедельник: 08:00–17:00; Вторник: 08:00–17:00; Среда: 08:00–17:00; Четверг: 08:00–17:00; Пятница: 08:00–17:00; Суббота: 08:00–12:00; Воскресенье: Закрыто', '84A/4, Đ. Quang Trung, Lộc Thọ, Nha Trang, Khánh Hòa 10000, Вьетнам', NULL, 12.2470597, 109.1911913,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/NCB+Kh%C3%A1nh+H%C3%B2a+-+Ng%C3%A2n+h%C3%A0ng+Qu%E1%BB%91c+D%C3%A2n/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067973a93a007:0xf903e57059bf460d!8m2!3d12.2470597!4d109.1911913!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11myqmkbct?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 5.0)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('SACOMBANK-PGD Nha Trang', 'Были трудности с получением перевода money gram , присутствует языковый барьер , но все преодолимо , персонал доброжелательный, пытаются решить проблему любым способ .деньги в итоги получили , респект сотрудникам за работу | Персонала было слишком много, но они заставляли клиентов долго ждать. Они постоянно пересаживали людей с одного столика на другой, не решая их проблем. | Персонал приятный и энтузиастичный. Я очень быстро внесла и сняла деньги ❤️❤️', 'finance', 'bank', NULL,
   '+84 1800 585888', 'Понедельник: 07:30–11:30; Вторник: 07:30–11:30; Среда: 07:30–11:30; Четверг: 07:30–11:30; Пятница: 07:30–11:30; Суббота: Закрыто; Воскресенье: Закрыто', '65 Nguyễn Trãi, Tân Tiến, Nha Trang, Khánh Hòa 650000, Вьетнам', 'Для людей с огр. возможностями: Нет вход для людей на инвалидных колясках', 12.2444814, 109.1877168,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/SACOMBANK-PGD+Nha+Trang/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705d807a299e71:0xd6c4eef6f42e2d9c!8m2!3d12.2444814!4d109.1877168!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F1hc41rssc?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 4.1)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('PGD Vĩnh Phước - Maritime Bank', NULL, 'finance', 'bank', NULL,
   '+84 258 3545 556', 'Понедельник: 07:30–12:00; Вторник: 07:30–12:00; Среда: 07:30–12:00; Четверг: 07:30–12:00; Пятница: 07:30–12:00; Суббота: 07:30–12:00; Воскресенье: 07:30–11:30', '36KA Hai Tháng Tư, Vĩnh Thọ, Bắc Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2689362, 109.1975531,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/PGD+V%C4%A9nh+Ph%C6%B0%E1%BB%9Bc+-+Maritime+Bank/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067f2dc31495f:0x96278d40e191499d!8m2!3d12.2689362!4d109.1975531!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F1hc2s7zkw?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 4.5)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Ngân hàng Bản Việt - BVBank Bình Tân', 'Рядом с отелем Hana Travelogue находится банкомат Exim Bank, предлагающий бесплатную услугу UnionPay. Я успешно сняла деньги. По состоянию на март 2026 года.', 'finance', 'bank', NULL,
   '+84 258 3883 388', 'Понедельник: 07:30–11:45; Вторник: 07:30–11:45; Среда: 07:30–11:45; Четверг: 07:30–11:45; Пятница: 07:30–11:45; Суббота: Закрыто; Воскресенье: Закрыто', '27/24 Đ. 7B, Vĩnh Hoà, Nam Nha Trang, Khánh Hòa, Вьетнам', NULL, 12.2185348, 109.1961498,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Ng%C3%A2n+h%C3%A0ng+B%E1%BA%A3n+Vi%E1%BB%87t+-+BVBank+B%C3%ACnh+T%C3%A2n/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067e9041a9963:0x69d6bbb520665a2d!8m2!3d12.2185348!4d109.1961498!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11swly7_n3?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 5.0)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Ngân Hàng Vietcombank', 'Ждать час, чтобы они обслуживание 2ух людей и ты не мог снять деньги, потому что перед тобой ещё 2 человека | В 2020 году я оформил карту в Нячанге, но поскольку пользовался только интернет-банкингом, а не банкоматными картами, карта была заблокирована. Сейчас я подаю заявку на замену карты в отделении в Сайгоне, но когда пришел за ней, сотрудники … | Быстрое оформление, дружелюбный персонал, оперативная служба безопасности и ресепшен. Превосходное качество обслуживания. ❤️❤️', 'finance', 'bank', NULL,
   '+84 1900 545413', NULL, 'Khu Tập Thể BV Quân Y, 87, 7 Tuệ Tĩnh, Lộc Thọ, Nha Trang, Khánh Hòa, Вьетнам', NULL, 12.2292383, 109.1960328,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Ng%C3%A2n+H%C3%A0ng+Vietcombank/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067669a5ddd31:0x4d4a49a7c7d1b4c7!8m2!3d12.2292383!4d109.1960328!15sCgRiYW5rkgEMc2F2aW5nc19iYW5r4AEA!16s%2Fg%2F11jpn4phn2?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.2)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Eximbank', '6:45, а банкомат не работает. Это часто случается. | Сотрудники были невероятно отзывчивы, особенно г-жа Туи Ван, которая предоставила подробные инструкции по открытию карты и оказывала поддержку с работы на протяжении всего пути домой.', 'finance', 'bank', NULL,
   NULL, NULL, NULL, NULL, 12.251496, 109.097046,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Eximbank/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705c7e19067205:0x94554ae4159e21!8m2!3d12.251496!4d109.097046!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11c563ckgk?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 4.0)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('BaoVietBank Khánh Hòa - PGD Nha Trang', NULL, 'finance', 'bank', NULL,
   NULL, NULL, 'Chung cư CT1, VCN, Nam Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2415609, 109.1778354,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/BaoVietBank+Kh%C3%A1nh+H%C3%B2a+-+PGD+Nha+Trang/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705d6a1d36bc27:0xca061bdf9b73655b!8m2!3d12.2415609!4d109.1778354!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11jyffbcn7?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', NULL)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Ngân Hàng TMCP Phương Đông (OCB) - CN Khánh Hòa', '16.09.23 получил перевод золотая корона. Пришел, сфотографировали паспорт. На следующий день пришел после обеда и получил деньги без очереди. Если хотите положить деньги на карту вьетнама то требуйте чек с красным штампом, потом идёте в … | К получению переведов с "Золотой Короны" данный банк не рекомендую. Ищите другие варианты, товарищи. Пришёл в прошлую пятницу, сотрудники сфотографирировали номер перевода и паспорт … | Дружелюбное и быстрое оформление сделок.', 'finance', 'bank', NULL,
   '+84 258 3820 883', 'Понедельник: 07:30–11:30; Вторник: 07:30–11:30; Среда: 07:30–11:30; Четверг: 07:30–11:30; Пятница: 07:30–11:30; Суббота: 07:30–11:30; Воскресенье: Закрыто', '88 – 89 A Yersin, Phương Sài, Tây Nha Trang, Khánh Hòa 650000, Вьетнам', 'Для людей с огр. возможностями: Нет вход для людей на инвалидных колясках', 12.2494246, 109.1853564,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Ng%C3%A2n+H%C3%A0ng+TMCP+Ph%C6%B0%C6%A1ng+%C4%90%C3%B4ng+(OCB)+-+CN+Kh%C3%A1nh+H%C3%B2a/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705d429a6a6a95:0xec5fc43d53ad4868!8m2!3d12.2494246!4d109.1853564!15sCgRiYW5rWgYiBGJhbmuSAQRiYW5rmgEjQ2haRFNVaE5NRzluUzBWSlEwRm5TVU5zZEZsdVdFcFJFQUXgAQD6AQQISxBC!16s%2Fg%2F11btrqwml9?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 4.2)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('MB Vĩnh Hải', 'Сотрудники были дружелюбны и давали полезные советы; я буду и дальше поддерживать этот банк. | Персонал был очень приветливым и дружелюбным. | Хоай Бао, специалист по персональному обслуживанию клиентов, невероятно энергична и оказывает поддержку от А до Я 🫶 …', 'finance', 'bank', NULL,
   '+84 258 6269 888', 'Понедельник: 07:30–11:30; Вторник: 07:30–11:30; Среда: 07:30–11:30; Четверг: 07:30–11:30; Пятница: 07:30–11:30; Суббота: Закрыто; Воскресенье: Закрыто', 'Số 554 Hai Tháng Tư, Vĩnh Phước, Bắc Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2762101, 109.1972277,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/MB+V%C4%A9nh+H%E1%BA%A3i/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x3170695e37da9ea1:0xf98eb2bfa35a7eed!8m2!3d12.2762101!4d109.1972277!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11wr39zkvr?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 4.6)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Ngân hàng Bản Việt - BVBank Vĩnh Hải', 'Тут можно открыть счёт по штампу в паспорте, чтобы оплачивать все подряд QR кодом. Очередей не видел ни разу. Минимальный остаток на счёте 100к. Минимальный перевод 50к. Подключается к МоМо без проблем. Приложение банка работает только на … | Пришел открыть счет для оплаты покупок ! Девушка попросила паспорт , посовещавшись со своими коллегами сказала что иностранцам счета не открывают ! Сидят в телефоне работать не хотят ! Ужас | Самое лучшее отделение этого банка очень приветливый персонал, уходишь от них всегда с улыбкой', 'finance', 'bank', NULL,
   '+84 1900 555596', 'Понедельник: 07:30–11:45; Вторник: 07:30–11:45; Среда: 07:30–11:45; Четверг: 07:30–11:45; Пятница: 07:30–11:45; Суббота: Закрыто; Воскресенье: Закрыто', '610-612, 610 Hai Tháng Tư, Vĩnh Phước, Bắc Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.274941, 109.197795,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Ng%C3%A2n+h%C3%A0ng+B%E1%BA%A3n+Vi%E1%BB%87t+-+BVBank+V%C4%A9nh+H%E1%BA%A3i/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067809c057851:0x1ce934ac24ff4b5b!8m2!3d12.274941!4d109.197795!15sCgRiYW5rWgYiBGJhbmuSAQRiYW5rmgEkQ2hkRFNVaE5NRzluUzBWSlEwRm5TVVE1Ym5CUVRYWm5SUkFC4AEA-gEFCLoCEDY!16s%2Fg%2F1pzx97kl6?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.8)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('SeABank', 'Спасибо отзывчивым сотрудникам🌸 … | Мне очень нравится, что банк предлагает сберегательные программы. | Отличное обслуживание, быстрые и простые процедуры.', 'finance', 'bank', NULL,
   '+84 258 3880 488', 'Понедельник: 07:30–11:30; Вторник: 07:30–11:30; Среда: 07:30–11:30; Четверг: 07:30–11:30; Пятница: 07:30–11:30; Суббота: Закрыто; Воскресенье: Закрыто', '900 Lê Hồng Phong, Phường Nam, Nam Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2207372, 109.1865471,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/SeABank/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705df5ea8f3dc5:0xb20e6a03d4fe4e39!8m2!3d12.2207372!4d109.1865471!15sCgRiYW5rWgYiBGJhbmuSAQRiYW5rmgEjQ2haRFNVaE5NRzluUzBWSlEwRm5TVU5hYmpsaVYwbG5FQUXgAQD6AQQIABAf!16s%2Fg%2F11c72b8q4z?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.9)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('MSB Khánh Hòa', 'Дружелюбный и профессиональный персонал | Я приехала сюда, потому что слышала, что услуги Shinhan Sol Travel бесплатны. Но плата всё же есть. … | Быстрое обслуживание. Девушка из первого окошка — спасибо за вашу любезность, желаю вам каждый день оставаться такой же улыбчивой, чтобы каждый день был лёгким!', 'finance', 'bank', NULL,
   '+84 258 3526 161', 'Понедельник: 07:30–12:00; Вторник: 07:30–12:00; Среда: 07:30–12:00; Четверг: 07:30–12:00; Пятница: 07:30–12:00; Суббота: 07:30–12:00; Воскресенье: Закрыто', '76A Đ. Quang Trung, phường, Nha Trang, Khánh Hòa 650000, Вьетнам', 'Для людей с огр. возможностями: Вход для людей на инвалидных колясках, Парковка с доступом для инвалидов-колясочников', 12.248439, 109.190682,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Финансы', 'https://www.google.com/maps/place/MSB+Kh%C3%A1nh+H%C3%B2a/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067804b823ab7:0xc86c68130e0e53bd!8m2!3d12.248439!4d109.190682!15sCgRiYW5rkgEVZmluYW5jaWFsX2luc3RpdHV0aW9u4AEA!16s%2Fg%2F1hc0_5t38?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.4)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('VPBank Phước Hải', 'Банк специализируется на телефонных звонках и их записи с требованием погашения кредита, хотя мой номер телефона зарегистрирован на мое имя, и я не брал у них никаких кредитов. … | Банковская карта не доставлена, грузоотправитель говорил коротко, бросил трубку, банк не принял решения, каждая кредитная карта была доставлена ​​в течение полугода и не доставлена | Банк работает ужасно. Автоматически генерирует непомерные проценты без уведомления клиентов. Процентная ставка банка в 25% годовых — это слишком много для правительства. Я подам петицию в правительство и уточню, разрешено ли это. Персонал разговаривает высокомерно и смотрит на клиентов свысока. ОЧЕНЬ ПЛОХО.', 'finance', 'bank', NULL,
   NULL, 'Понедельник: 07:30–17:00; Вторник: 07:30–17:00; Среда: 07:30–17:00; Четверг: 07:30–17:00; Пятница: 07:30–17:00; Суббота: 07:30–11:00; Воскресенье: Закрыто', '65QH+R6X, Thích Quảng Đức, Nam Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2396143, 109.1781209,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/VPBank+Ph%C6%B0%E1%BB%9Bc+H%E1%BA%A3i/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705d04906e72c7:0x92489cebdeeba2c5!8m2!3d12.2396143!4d109.1781209!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11kpn4f24h?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 2.1)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Ngân Hàng TMCP Phương Đông (OCB) - PGD Hoàng Diệu', 'Отношение персонала отвратительное. Высокомерие. Отсутствие элементарной вежливости. | Я не могу использовать свою карту Shinhan Travel Card. Постоянно пишет, что мой пароль неверный. Хотя он верный.', 'finance', 'bank', NULL,
   '+84 258 3887 055', 'Понедельник: 07:30–11:30; Вторник: 07:30–11:30; Среда: 07:30–11:30; Четверг: 07:30–11:30; Пятница: 07:30–11:30; Суббота: 07:30–11:30; Воскресенье: Закрыто', '38 Đường 6C, Nam Nha Trang, Khánh Hòa 57000, Вьетнам', NULL, 12.2185899, 109.1954063,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Ng%C3%A2n+H%C3%A0ng+TMCP+Ph%C6%B0%C6%A1ng+%C4%90%C3%B4ng+(OCB)+-+PGD+Ho%C3%A0ng+Di%E1%BB%87u/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067a6a87626cf:0x9e0fe182cf60dfce!8m2!3d12.2185899!4d109.1954063!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11tfwp1dtc?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.0)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Ngân Hàng Tmcp Hàng Hải Việt Nam (Maritime Bank)', NULL, 'finance', 'bank', NULL,
   '+84 258 3545 555', NULL, '36 Hai Tháng Tư, Vĩnh Thọ, Bắc Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2689945, 109.197436,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Ng%C3%A2n+H%C3%A0ng+Tmcp+H%C3%A0ng+H%E1%BA%A3i+Vi%E1%BB%87t+Nam+(Maritime+Bank)/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067f2dc0dcf1b:0x332a3fef5adc37f3!8m2!3d12.2689945!4d109.197436!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11btrs9vn7?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 5.0)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Ngân Hàng Tmcp Đông Nam Á - Seabank', NULL, 'finance', 'bank', NULL,
   NULL, 'Понедельник: 07:30–16:30; Вторник: 07:30–16:30; Среда: 07:30–16:30; Четверг: 07:30–16:30; Пятница: 07:30–16:30; Суббота: Закрыто; Воскресенье: Закрыто', NULL, NULL, 12.2515397, 109.0970987,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Ng%C3%A2n+H%C3%A0ng+Tmcp+%C4%90%C3%B4ng+Nam+%C3%81+-+Seabank/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705c80ae459e5f:0x89067a112c222d75!8m2!3d12.2515397!4d109.0970987!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F1jkvzy83q?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', NULL)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Bv Bank - New Location', 'Вежливый персонал. Подготовлен. | Это правильный адрес; они недавно переехали. Я без проблем открыла счет и внесла деньги в Хошимине, но здесь, после долгих уговоров, мне удалось внести деньги только один раз. Дальнейшие пополнения менее удобны, и я до сих пор жду ее письма.', 'finance', 'bank', NULL,
   NULL, NULL, '236 Thống Nhất, Phương Sài, Tây Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2504762, 109.184383,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Bv+Bank+-+New+Location/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705d003753fc3f:0x3833e457b39ff867!8m2!3d12.2504762!4d109.184383!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11yr05vm1y?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 4.5)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('ATM Đông Á Bank', 'Автомат выдает лекарства довольно быстро и удобно.', 'finance', 'bank', NULL,
   NULL, 'Понедельник: 24 часа в сутки; Вторник: 24 часа в сутки; Среда: 24 часа в сутки; Четверг: 24 часа в сутки; Пятница: 24 часа в сутки; Суббота: 24 часа в сутки; Воскресенье: 24 часа в сутки', '65XQ+7X6, Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2481657, 109.1898781,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банкомат', 'https://www.google.com/maps/place/ATM+%C4%90%C3%B4ng+%C3%81+Bank/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31706780472c7721:0x1efac4a397cb77df!8m2!3d12.2481657!4d109.1898781!15sCgRiYW5rkgEDYXRt4AEA!16s%2Fg%2F11bzwldzk8?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 4.7)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Ngân Hàng TMCP Phương Đông (OCB) - PGD 23 tháng 10', 'Банк открыт для этих женщин, и они могут совершать операции, но вместо того, чтобы обменивать деньги с людьми, они просто сидят и присматривают за магазином? | Отличное обслуживание, дружелюбный и отзывчивый персонал. | Очень хорошая поддержка клиентов', 'finance', 'bank', NULL,
   '+84 258 3835 002', 'Понедельник: 07:30–11:30; Вторник: 07:30–11:30; Среда: 07:30–11:30; Четверг: 07:30–11:30; Пятница: 07:30–11:30; Суббота: 07:30–11:30; Воскресенье: Закрыто', '406 Đ. 23 Tháng 10, Vĩnh Hiệp, Tây Nha Trang, Khánh Hòa 650000, Вьетнам', 'Для людей с огр. возможностями: Нет вход для людей на инвалидных колясках, Нет парковка с доступом для инвалидов-колясочников', 12.2550856, 109.1681035,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Ng%C3%A2n+H%C3%A0ng+TMCP+Ph%C6%B0%C6%A1ng+%C4%90%C3%B4ng+(OCB)+-+PGD+23+th%C3%A1ng+10/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067959660a475:0xec9c887de6d6d33a!8m2!3d12.2550856!4d109.1681035!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11fgh5b_h9?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 4.6)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Vietnam Bank For Agriculture And Rural', NULL, 'finance', 'bank', NULL,
   '+84 258 3822 012', NULL, '161 Thong Nhat Street, Nha Trang City, Vạn Thạnh, Nha Trang, Khánh Hòa, Вьетнам', NULL, 12.2522154, 109.1893883,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Vietnam+Bank+For+Agriculture+And+Rural/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31706780ca0f9331:0x61c5d940f3ef0f4f!8m2!3d12.2522154!4d109.1893883!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F1tfttg3p?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', NULL)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Ngân Hàng Tmcp Sài Gòn - Hà Nội (Shb) - Pgd Vĩnh Phước', 'При переводе денег клиентам крайне необходим четкий и полный скриншот страницы «Транзакция успешно завершена», чтобы отправить его получателю. Однако SHB уже давно игнорирует отзывы клиентов, используя устаревший и неполный интерфейс … | Персонал крайне медлительный и нерасторопный. Решение проблемы заняло почти два часа. Плохо.', 'finance', 'bank', NULL,
   '+84 258 3541 179', NULL, '78 Hai Tháng Tư, Vĩnh Phước, Bắc Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2720867, 109.1979035,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Ng%C3%A2n+H%C3%A0ng+Tmcp+S%C3%A0i+G%C3%B2n+-+H%C3%A0+N%E1%BB%99i+(Shb)+-+Pgd+V%C4%A9nh+Ph%C6%B0%E1%BB%9Bc/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067f23f475c65:0x3c3d75a26974804f!8m2!3d12.2720867!4d109.1979035!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F1hc4ksh2t?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 2.2)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('PGBank Khánh Hòa Branch', 'У меня есть много причин посоветовать вам больше не ходить в этот банк, ужасное обслуживание... настолько плохое и грубое.', 'finance', 'bank', NULL,
   '+84 1900 555574', 'Понедельник: 08:00–17:00; Вторник: 08:00–17:00; Среда: 08:00–17:00; Четверг: 08:00–17:00; Пятница: 08:00–17:00; Суббота: 08:00–12:00; Воскресенье: Закрыто', '47 Đ. Lê Thành Phương, Vạn Thạnh, Tây Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2489423, 109.1887775,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/PGBank+Kh%C3%A1nh+H%C3%B2a+Branch/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067806529a2ed:0x4e2defecf9cf7503!8m2!3d12.2489423!4d109.1887775!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11trk1cfhk?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.0)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('ATM Commonwealth Bank - Dong A Bank - Nha Trang Transaction Office', 'Банкомат, соответствующий описанию, не найден. | один фантомный CBA-банк на данный момент | Искал и ничего не нашел.', 'finance', 'bank', NULL,
   '+84 28 3824 2044', 'Понедельник: 24 часа в сутки; Вторник: 24 часа в сутки; Среда: 24 часа в сутки; Четверг: 24 часа в сутки; Пятница: 24 часа в сутки; Суббота: 24 часа в сутки; Воскресенье: 24 часа в сутки', '55 Hai Tháng Tư, Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2541209, 109.1889439,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банкомат', 'https://www.google.com/maps/place/ATM+Commonwealth+Bank+-+Dong+A+Bank+-+Nha+Trang+Transaction+Office/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067876e4cecd1:0x91d38c3d8ab843e!8m2!3d12.2541209!4d109.1889439!15sCgRiYW5rkgEDYXRt4AEA!16s%2Fg%2F11b6d5w0cq?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 1.8)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Saigon Bank - Atm', NULL, 'finance', 'bank', NULL,
   NULL, NULL, '49 Lý Thánh Tôn, Lộc Thọ, Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2478982, 109.189679,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банкомат', 'https://www.google.com/maps/place/Saigon+Bank+-+Atm/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067804397c523:0x4eb5e070a08d252f!8m2!3d12.2478982!4d109.189679!15sCgRiYW5rkgEDYXRt4AEA!16s%2Fg%2F1hc337v6m?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', NULL)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Ngân Hàng SHB', 'Сотрудники оценочной комиссии были некомпетентны и безответственны. | Преданные своему делу и профессиональные!!!', 'finance', 'bank', NULL,
   '+84 1800 545422', NULL, '756 Đ. 2/4, Vĩnh Thọ, Bắc Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2690141, 109.1971096,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Ng%C3%A2n+H%C3%A0ng+SHB/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067f2dc26f121:0x4bd9b278ed4c857e!8m2!3d12.2690141!4d109.1971096!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11jkcs3_30?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.0)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('TPBank LiveBank Vĩnh Hải', 'Я снял 5 000 000 VND, используя свою туристическую карту Visa, и с меня взяли комиссию в размере 154 000 VND, что чуть больше 3%. В прошлом году я много раз пользовался этим же банкоматом без каких-либо комиссий. Обычно другие банкоматы … | Комиссия за снятие денег с карты Visa, выпущенной иностранным банком, составляет 154 000 донгов. Она слишком высокая. Раньше она составляла 55 000 донгов. ??? | Дважды снимал 5 миллионов и заплатил 55 тысяч за снятие наличных в банкомате, сегодня комиссия внезапно выросла до 154 тысяч.', 'finance', 'bank', NULL,
   '+84 1900 585885', 'Понедельник: 24 часа в сутки; Вторник: 24 часа в сутки; Среда: 24 часа в сутки; Четверг: 24 часа в сутки; Пятница: 24 часа в сутки; Суббота: 24 часа в сутки; Воскресенье: 24 часа в сутки', '686 Đ. 2/4, phường Bắc, Bắc Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2720361, 109.1978807,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банкомат', 'https://www.google.com/maps/place/TPBank+LiveBank+V%C4%A9nh+H%E1%BA%A3i/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067925bb7b855:0x23746d20ee061403!8m2!3d12.2720361!4d109.1978807!15sCgRiYW5rkgEDYXRt4AEA!16s%2Fg%2F11wpnbklvf?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 2.3)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Vietnam Social Policy Bank - Khanh Hoa Branch', 'Банк предоставляет кредиты малоимущим семьям и лицам, имеющим право на участие в программах социальной помощи. Он работает на некоммерческой основе. | Персонал был дружелюбным и полным энтузиазма.', 'finance', 'bank', NULL,
   '+84 258 3817 089', NULL, '195 Hoàng Văn Thụ, Phương Sài, Tây Nha Trang, Khánh Hòa 650000, Вьетнам', NULL, 12.2499803, 109.1862349,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Vietnam+Social+Policy+Bank+-+Khanh+Hoa+Branch/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x31705d7e4be0661d:0xc029151d182075b3!8m2!3d12.2499803!4d109.1862349!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11b6d40nnh?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', 3.7)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

INSERT INTO "public"."businesses"
  ("title", "description", "category", "subcategory", "price_range", "contact", "working_hours",
   "address", "additional_info", "latitude", "longitude", "is_recommended", "created_at",
   "tags", "avg_check", "is_test", "cuisine", "location_link", "rating")
VALUES
  ('Se A Bank', NULL, 'finance', 'bank', NULL,
   NULL, NULL, 'Ba Làng, Bac NHA Trang, Кханьхоа 650000, Вьетнам', NULL, 12.2838257, 109.2035274,
   false, NOW() AT TIME ZONE 'Asia/Ho_Chi_Minh', ARRAY['finance', 'open']::text[], NULL,
   false, 'Банк', 'https://www.google.com/maps/place/Se+A+Bank/@12.2562383,108.9890041,12z/data=!4m11!1m3!2m2!1sbank!6e2!3m6!1s0x317067e47838c973:0x4ab33a8ac7d1b3d1!8m2!3d12.2838257!4d109.2035274!15sCgRiYW5rkgEEYmFua-ABAA!16s%2Fg%2F11q_4b42dn?authuser=3&entry=ttu&g_ep=EgoyMDI2MDQxMy4wIKXMDSoASAFQAw%3D%3D', NULL)
ON CONFLICT (title)
DO UPDATE SET
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
  rating = EXCLUDED.rating;

