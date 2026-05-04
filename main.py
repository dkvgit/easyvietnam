import sys
import asyncio

import telegram
print(f"PTB VERSION: {telegram.__version__}")


if sys.platform == "win32":
    asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())

import os
import logging
from telegram.request import HTTPXRequest

print("✅ os, logging загружены")

from telegram import Update, BotCommand, InlineKeyboardButton, InlineKeyboardMarkup
from telegram.ext import Application, CommandHandler, CallbackQueryHandler, MessageHandler, filters, ContextTypes
print("✅ telegram загружен")

from config import BOT_TOKEN, LOG_LEVEL, USE_WEBHOOK, WEBHOOK_URL, WEBHOOK_PORT, WEBHOOK_PATH, IS_RAILWAY, WEBHOOK_SECRET
print("✅ config загружен")

from handlers import start_handler, category_handler, admin_handler
print("✅ handlers загружены")

from handlers.slider_handler import handle_slider_callback
print("✅ slider_handler загружен")

from ai_agent import get_ai_response
print("✅ ai_agent загружен")

from handlers.start_handler import location_handler, request_location_update
print("✅ start_handler загружен")

FINAL_TOKEN = os.getenv("BOT_TOKEN", BOT_TOKEN)

logging.basicConfig(
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    level=getattr(logging, LOG_LEVEL)
)
logger = logging.getLogger(__name__)


async def set_bot_commands(application: Application):
    commands = [
        BotCommand("start", "▶️ Главное меню"),
        BotCommand("guide", "📚 Быстрые категории"),
        BotCommand("search", "🔍 Поиск заведений"),
        BotCommand("nearby", "📍 Найти рядом"),
        BotCommand("pdf", "📄 Скачать гайд"),
        BotCommand("feedback", "💬 Поддержка"),
        BotCommand("promo", "📢 Реклама"),
        BotCommand("help", "ℹ️ Помощь"),
        BotCommand("broadcast", "📨 Рассылка (админ)"),
        BotCommand("stats", "📊 Статистика (админ)"),
        BotCommand("promote", "⭐ Добавить рекламу (админ)"),
        BotCommand("promoted", "📋 Список рекламы (админ)"),
        BotCommand("add_business", "➕ Добавить бизнес (админ)"),
        BotCommand("list", "📋 Список бизнесов (админ)")
    ]
    await application.bot.set_my_commands(commands)
    logger.info("✅ Команды бота установлены")


def register_handlers(application: Application):
    application.add_handler(CommandHandler("start", start_handler.start))
    application.add_handler(CommandHandler("guide", start_handler.guide))
    application.add_handler(CommandHandler("update_location", request_location_update))
    application.add_handler(CommandHandler("search", start_handler.search))
    application.add_handler(CommandHandler("nearby", start_handler.nearby_command))
    application.add_handler(CommandHandler("advanced_search", start_handler.advanced_search))
    application.add_handler(CommandHandler("pdf", start_handler.pdf))
    application.add_handler(CommandHandler("feedback", start_handler.feedback))
    application.add_handler(CommandHandler("promo", start_handler.promo))
    application.add_handler(CommandHandler("help", start_handler.help_command))
    application.add_handler(CommandHandler("hide", start_handler.hide_keyboard))

    application.add_handler(CommandHandler("list", admin_handler.list_businesses))
    application.add_handler(CommandHandler("stats", admin_handler.stats))
    application.add_handler(CommandHandler("broadcast", admin_handler.broadcast))
    application.add_handler(CommandHandler("add_business", admin_handler.add_business))
    application.add_handler(CommandHandler("promote", admin_handler.promote_business))
    application.add_handler(CommandHandler("promoted", admin_handler.list_promoted))

    application.add_handler(CallbackQueryHandler(admin_handler.confirm_business_callback, pattern="^confirm_business$"))
    application.add_handler(CallbackQueryHandler(admin_handler.cancel_business_callback, pattern="^cancel_business$"))
    application.add_handler(CallbackQueryHandler(ai_callback_handler, pattern="^ai_search_"))
    application.add_handler(CallbackQueryHandler(handle_slider_callback, pattern="^slider_"))
    application.add_handler(CallbackQueryHandler(
        category_handler.button_handler,
        pattern="^(category_|subcategory_|business_|filter_|cat_|subcat_|p:|b_|show_biz_|main_menu|back|dummy|my_id|advertise|price_list|pdf|about|buy)"
    ))

    application.add_handler(MessageHandler(filters.TEXT & filters.Regex("❌ Скрыть меню"), start_handler.hide_keyboard))
    application.add_handler(MessageHandler(filters.LOCATION, start_handler.location_handler))
    application.add_handler(MessageHandler(filters.TEXT & ~filters.COMMAND, ai_message_handler))

    logger.info("✅ Все обработчики зарегистрированы")


async def ai_message_handler(update: Update, context: ContextTypes.DEFAULT_TYPE):
    if not update.message or not update.message.text:
        return

    user_text = update.message.text
    user_id = update.effective_user.id

    print(f"🤖 [AI LOG]: Получен запрос от {user_id}: '{user_text}'")
    status_msg = await update.message.reply_text("✨ Запрос отправлен ИИ-гиду...")

    try:
        ai_reply = await get_ai_response(user_text)
        print(f"✅ [AI LOG]: Ответ получен: {ai_reply[:50]}...")

        if "ничего не нашел" in ai_reply.lower() or "не найдено" in ai_reply.lower() or "NOT_FOUND" in ai_reply:
            keyboard = [
                [
                    InlineKeyboardButton("🍜 Еда", callback_data="ai_search_еда"),
                    InlineKeyboardButton("🔮 Астрологи", callback_data="ai_search_астролог")
                ],
                [
                    InlineKeyboardButton("🏨 Отели", callback_data="ai_search_отель"),
                    InlineKeyboardButton("🚕 Такси", callback_data="ai_search_транспорт")
                ],
                [
                    InlineKeyboardButton("💆‍♂️ Спа / Массаж", callback_data="ai_search_спа"),
                    InlineKeyboardButton("💊 Аптеки", callback_data="ai_search_аптека")
                ],
                [InlineKeyboardButton("🏠 Главное меню", callback_data="main_menu")]
            ]
            clean_reply = ai_reply.replace("NOT_FOUND:", "").strip()
            await status_msg.edit_text(
                f"{clean_reply}\n\nВозможно, вас заинтересует:",
                reply_markup=InlineKeyboardMarkup(keyboard)
            )
        else:
            await status_msg.edit_text(ai_reply)

    except Exception as e:
        print(f"❌ [AI LOG] ОШИБКА: {e}")
        await status_msg.edit_text("⚠️ Произошла ошибка при связи с ИИ.")


async def ai_callback_handler(update: Update, context: ContextTypes.DEFAULT_TYPE):
    query = update.callback_query
    await query.answer()

    keyword = query.data.replace("ai_search_", "")
    await query.edit_message_text(f"🔄 Загружаю категорию: {keyword}...")

    ai_reply = await get_ai_response(keyword)
    clean_reply = ai_reply.replace("NOT_FOUND:", "").strip()
    await query.edit_message_text(clean_reply)
    
  




async def main():
    logger.info("🚀 main() started")

    import threading
    from http.server import HTTPServer, BaseHTTPRequestHandler

    class HealthHandler(BaseHTTPRequestHandler):
        def do_GET(self):
            self.send_response(200)
            self.end_headers()
            self.wfile.write(b"OK")

        def log_message(self, format, *args):
            pass

    def run_health_server():
        server = HTTPServer(("0.0.0.0", 7860), HealthHandler)
        server.serve_forever()

    health_thread = threading.Thread(target=run_health_server, daemon=True)
    health_thread.start()
    logger.info("✅ Health-сервер на :7860 поднят")

    await asyncio.sleep(1)

    request_config = HTTPXRequest(
        connect_timeout=60.0,
        read_timeout=60.0,
        write_timeout=60.0,
        pool_timeout=60.0
    )

    application = (
        Application.builder()
        .token(FINAL_TOKEN)
        .request(request_config)
        .build()
    )

    register_handlers(application)

    try:
        if USE_WEBHOOK and WEBHOOK_URL:
            logger.info(f"🌐 Режим WEBHOOK. Порт: 7860")

            await asyncio.wait_for(application.initialize(), timeout=30)
            logger.info("✅ initialize() прошёл")

            await application.start()
            logger.info("✅ application.start() прошёл")

            async def register_webhook_safely():
                try:
                    await asyncio.sleep(3)
                    logger.info("📡 Регистрируем webhook в Telegram...")
                    await application.bot.set_webhook(
                        url=f"{WEBHOOK_URL}{WEBHOOK_PATH}",
                        secret_token=WEBHOOK_SECRET,
                        allowed_updates=Update.ALL_TYPES,
                        drop_pending_updates=True,
                        api_kwargs={"timeout": 50}
                    )
                    logger.info("✅ Webhook зарегистрирован!")
                except Exception as e:
                    logger.error(f"⚠️ Ошибка регистрации webhook: {e}")

            asyncio.create_task(register_webhook_safely())
            asyncio.create_task(set_bot_commands(application))

            logger.info("✅ Сервер живёт, ждём обновлений")

        else:
            logger.info("💻 Режим POLLING")
            await application.initialize()
            await set_bot_commands(application)
            await application.start()
            await application.updater.start_polling(allowed_updates=Update.ALL_TYPES)

        await asyncio.Event().wait()

    except Exception as e:
        logger.error(f"❌ Ошибка в main(): {e}")
        raise e
    finally:
        try:
            if application.running:
                await application.updater.stop()
                await application.stop()
        except Exception as e:
            logger.error(f"❌ Критическая ошибка: {e}")
        await application.shutdown()
        

if __name__ == "__main__":
    asyncio.run(main())