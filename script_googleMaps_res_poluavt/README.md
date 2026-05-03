# Google Maps Parser — EasyVietnamBot

## Установка

```bash
pip install -r requirements.txt
```

Скачай **chromedriver** под версию твоего Brave:
- Узнай версию Brave: `brave://version` → строка Chromium
- Скачай chromedriver: https://chromedriver.chromium.org/downloads
- Положи `chromedriver.exe` рядом с `parser.py`

## Запуск

```bash
cd D:\aRabota\TelegaBoom\08_gid\script_googleMaps2
python parser.py
```

## Использование

1. Скрипт сам откроет Brave с твоим профилем
2. Открой любое заведение в Google Maps
3. Нажми **Enter** в консоли — данные спарсятся
4. Переходи к следующему заведению, снова Enter
5. `q` + Enter — выход

## Результат

SQL INSERT-ы складываются в `output.sql` в той же папке.

## Файлы

- `parser.py` — главный скрипт, управляет браузером
- `extractor.py` — парсинг HTML страницы Google Maps
- `sql_generator.py` — генерация INSERT SQL
- `category_map.py` — маппинг типов заведений
- `id_counter.txt` — счётчик id (создаётся автоматически)
- `output.sql` — результат (дописывается при каждом парсинге)

## Настройки в parser.py

```python
BRAVE_PATH = r"C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"
BRAVE_PROFILE_DIR = r"C:\Users\dkv\AppData\Local\BraveSoftware\Brave-Browser\User Data"
```

Если Brave установлен в другом месте — поправь `BRAVE_PATH`.
