# D:\aRabota\TelegaBoom\08_gid\config.py

import os
from dotenv import load_dotenv

# Загружаем .env файл
load_dotenv()

# ============================================
# 1. ОПРЕДЕЛЕНИЕ ОКРУЖЕНИЯ
# ============================================

def is_railway() -> bool:
    """Проверяет, запущен ли код на Railway"""
    return os.getenv("RAILWAY_ENVIRONMENT") is not None


# 🌍 Текущее окружение
ENVIRONMENT = "railway" if is_railway() else "local"
IS_RAILWAY = is_railway()

# ============================================
# 2. SUPABASE
# ============================================

SUPABASE_URL = os.getenv("SUPABASE_URL")
SUPABASE_KEY = os.getenv("SUPABASE_KEY")

if not SUPABASE_URL or not SUPABASE_KEY:
    raise ValueError("❌ SUPABASE_URL и SUPABASE_KEY должны быть указаны в .env файле!")

# ============================================
# 3. TELEGRAM БОТ
# ============================================

BOT_TOKEN = os.getenv("BOT_TOKEN")

if not BOT_TOKEN:
    raise ValueError("❌ BOT_TOKEN должен быть указан в .env файле!")

# ============================================
# 4. АДМИНИСТРАТОРЫ
# ============================================

ADMIN_IDS_STR = os.getenv("ADMIN_IDS", "5425101564")
ADMIN_IDS = [int(x.strip()) for x in ADMIN_IDS_STR.split(",")]

# Замени блок 5. WEBHOOK на этот:

# ============================================
# 5. WEBHOOK
# ============================================

# Проверка, запущены ли мы на Hugging Face
IS_HF = os.getenv("SPACE_ID") is not None

WEBHOOK_URL = os.getenv("WEBHOOK_URL", "")
WEBHOOK_PATH = "/webhook"
WEBHOOK_SECRET = os.getenv("WEBHOOK_SECRET", "easyvietnam-webhook-secret-2024")

# Hugging Face ВСЕГДА слушает порт 7860
WEBHOOK_PORT = int(os.getenv("PORT", 7860))

# Включаем вебхук, если мы на HF или если явно задано в ENV
USE_WEBHOOK_ENV = os.getenv("USE_WEBHOOK", "False").lower() == "true"
USE_WEBHOOK = (USE_WEBHOOK_ENV or IS_HF) and bool(WEBHOOK_URL)

ENV = "HUGGINGFACE" if IS_HF else os.getenv("ENVIRONMENT", "LOCAL").upper()

print(f"🌍 CONFIG LOG: ENV={ENV}, USE_WEBHOOK={USE_WEBHOOK}, PORT={WEBHOOK_PORT}")

USE_WEBHOOK = False

print(f"🌍 CONFIG LOG: ENV={ENV}, USE_WEBHOOK={USE_WEBHOOK}, PORT={WEBHOOK_PORT}")

# ============================================
# 6. AI AGENT (OPENAI)
# ============================================

# Теперь используем ключ OpenAI вместо Gemini
OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")

if not OPENAI_API_KEY:
    print("⚠️ Внимание: OPENAI_API_KEY не найден в .env. Функции ИИ будут недоступны.")

# ============================================
# 7. ВСПОМОГАТЕЛЬНЫЕ ССЫЛКИ
# ============================================

PDF_LINK = os.getenv("PDF_LINK", "https://drive.google.com/your-pdf-link")
SUPPORT_CHAT = os.getenv("SUPPORT_CHAT", "@easyvietnam_chat")
NEWS_CHANNEL = os.getenv("NEWS_CHANNEL", "@easyvietnam")
ADMIN_USERNAME = os.getenv("ADMIN_USERNAME", "@dekavetel")

# ============================================
# 8. ЦЕНЫ
# ============================================

PRICES = {
    'start': int(os.getenv("PRICE_START", "10")),
    'standard': int(os.getenv("PRICE_STANDARD", "20")),
    'premium': int(os.getenv("PRICE_PREMIUM", "40"))
}

# ============================================
# 9. ЛОГИРОВАНИЕ
# ============================================

LOG_LEVEL = os.getenv("LOG_LEVEL", "INFO")
LOG_FILE = os.getenv("LOG_FILE", "bot.log")



# ============================================
# 10. ДЛЯ ОТЛАДКИ
# ============================================

def print_config():
    """Выводит текущую конфигурацию (без секретов)"""
    print(f"🌍 Environment: {ENVIRONMENT}")
    print(f"🚀 IS_RAILWAY: {IS_RAILWAY}")
    print(f"🔄 USE_WEBHOOK: {USE_WEBHOOK}")
    print(f"🔗 SUPABASE_URL: {SUPABASE_URL}")
    print(f"🤖 BOT_TOKEN: {'✅ установлен' if BOT_TOKEN else '❌ отсутствует'}")
    print(f"🧠 AI_API (OpenAI): {'✅ подключен' if OPENAI_API_KEY else '❌ не настроен'}")
    
    if USE_WEBHOOK:
        print(f"🔗 Webhook URL: {WEBHOOK_URL}")
        print(f"🔌 Webhook Port: {WEBHOOK_PORT}")
        

