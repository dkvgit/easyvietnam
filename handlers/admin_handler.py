from telegram import Update, InlineKeyboardMarkup, InlineKeyboardButton
from telegram.ext import ContextTypes
from config import ADMIN_IDS
from supabase_api import supabase, get_statistics
from datetime import datetime, timedelta
import asyncio
from supabase_api import supabase, get_statistics

def is_admin(user_id: int) -> bool:
    """Проверяет, является ли пользователь администратором"""
    return user_id in ADMIN_IDS


async def stats(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Статистика бота"""
    user_id = update.effective_user.id
    if not is_admin(user_id):
        await update.message.reply_text("⛔ У тебя нет доступа.")
        return

    # Количество пользователей
    users_count = supabase.table("bot_users").select("id", count="exact").execute()
    
    # Количество бизнесов
    businesses_count = supabase.table("businesses").select("id", count="exact").execute()
    
    # Новые пользователи за 7 дней
    from datetime import datetime, timedelta
    week_ago = (datetime.utcnow() - timedelta(days=7)).isoformat()
    
    recent_users = supabase.table("bot_users") \
        .select("id", count="exact") \
        .gte("joined_at", week_ago) \
        .execute()
    
    # Новые бизнесы за 7 дней
    recent_businesses = supabase.table("businesses") \
        .select("id", count="exact") \
        .gte("created_at", week_ago) \
        .execute()
    
    # Последние 5 добавленных заведений
    last_businesses = supabase.table("businesses") \
        .select("title, created_at") \
        .order("created_at", desc=True) \
        .limit(5) \
        .execute()
    
    text = f"📊 <b>Статистика:</b>\n\n"
    text += f"👥 Пользователей: {users_count.count}\n"
    text += f"🏢 Бизнесов: {businesses_count.count}\n"
    text += f"🆕 Новых пользователей за 7 дней: {recent_users.count}\n"
    text += f"➕ Новых заведений за 7 дней: {recent_businesses.count}\n\n"
    
    if last_businesses.data:
        text += "<b>📅 Последние добавленные:</b>\n"
        for biz in last_businesses.data:
            created = biz.get('created_at', '')
            if created:
                try:
                    dt = datetime.fromisoformat(created.replace('Z', '+00:00'))
                    created = dt.strftime('%d.%m.%Y')
                except:
                    created = created[:10]
            else:
                created = 'неизвестно'
            text += f"• {biz['title']} ({created})\n"
    
    await update.message.reply_text(text, parse_mode="HTML")

async def promote_business(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Команда для добавления бизнеса в рекомендованные"""
    user_id = update.effective_user.id
    if not is_admin(user_id):
        await update.message.reply_text("⛔ Доступ только для админов.")
        return

    if len(context.args) < 2:
        await update.message.reply_text(
            "📢 Использование:\n"
            "`/promote [ID бизнеса] [дней]`\n\n"
            "Пример: `/promote 123 30` - реклама на 30 дней",
            parse_mode="Markdown"
        )
        return

    try:
        business_id = int(context.args[0])
        days = int(context.args[1])

        recommended_until = (datetime.utcnow() + timedelta(days=days)).isoformat()

        # Проверяем, существует ли бизнес
        check_response = supabase.table("businesses") \
            .select("*") \
            .eq("id", business_id) \
            .execute()

        if not check_response.data:
            await update.message.reply_text(f"❌ Бизнес с ID {business_id} не найден в базе данных.")
            return

        # Обновляем в базе
        response = supabase.table("businesses") \
            .update({
                "is_recommended": True,
                "recommended_until": recommended_until
            }) \
            .eq("id", business_id) \
            .execute()

        if response.data:
            await update.message.reply_text(
                f"✅ Бизнес ID {business_id} добавлен в рекомендованные на {days} дней.\n"
                f"Реклама активна до: {recommended_until[:10]}"
            )
        else:
            await update.message.reply_text(
                f"❌ Не удалось обновить бизнес.\n"
                f"ID: {business_id}\n"
                f"Проверьте, есть ли поля is_recommended и recommended_until в таблице!"
            )

    except ValueError:
        await update.message.reply_text("❌ Неверный формат. Используйте числа для ID и количества дней.")
    except Exception as e:
        await update.message.reply_text(f"❌ Ошибка: {str(e)}")


async def list_promoted(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Показать список рекламируемых бизнесов"""
    user_id = update.effective_user.id
    if not is_admin(user_id):
        await update.message.reply_text("⛔ Доступ только для админов.")
        return

    response = supabase.table("businesses") \
        .select("id, title, category, recommended_until") \
        .eq("is_recommended", True) \
        .execute()

    if not response.data:
        await update.message.reply_text("📋 Нет активных рекламных размещений.")
        return

    text = "📢 <b>Активные рекламные размещения:</b>\n\n"
    for biz in response.data:
        until = biz.get('recommended_until', '')
        if until:
            until_date = datetime.fromisoformat(until.replace('Z', '+00:00'))
            days_left = (until_date - datetime.utcnow()).days
            text += f"ID: {biz['id']} - {biz['title']}\n"
            text += f"Категория: {biz['category']}\n"
            text += f"Активно до: {until[:10]} (осталось {days_left} дней)\n\n"

    await update.message.reply_text(text, parse_mode="HTML")


async def broadcast(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Рассылка сообщения всем пользователям"""
    user_id = update.effective_user.id
    if not is_admin(user_id):
        await update.message.reply_text("⛔ Доступ только для админов.")
        return

    if not context.args:
        await update.message.reply_text(
            "💬 Напиши текст для рассылки:\n`/broadcast Ваш текст`",
            parse_mode="Markdown"
        )
        return

    message = " ".join(context.args)

    # Получаем всех пользователей
    response = supabase.table("users").select("user_id").execute()
    
    if not response.data:
        await update.message.reply_text("❌ Нет пользователей для рассылки.")
        return

    sent = 0
    failed = 0
    
    await update.message.reply_text(f"📨 Начинаю рассылку {len(response.data)} пользователям...")
    
    for user in response.data:
        try:
            await context.bot.send_message(chat_id=user['user_id'], text=message)
            sent += 1
        except Exception:
            failed += 1
        
        # Небольшая задержка чтобы не заблокировали
        if sent % 30 == 0:
            await asyncio.sleep(1)
    
    await update.message.reply_text(
        f"✅ Рассылка завершена!\n"
        f"📨 Отправлено: {sent}\n"
        f"❌ Не доставлено: {failed}"
    )


async def list_businesses(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Показать список всех бизнесов с их ID"""
    user_id = update.effective_user.id
    if not is_admin(user_id):
        await update.message.reply_text("⛔ Доступ только для админов.")
        return

    category = context.args[0] if context.args else None

    query = supabase.table("businesses").select("id, title, category, created_at, is_recommended")
    if category:
        query = query.eq("category", category)

    response = query.execute()

    if not response.data:
        await update.message.reply_text("📋 Нет бизнесов в базе.")
        return

    text = "📋 <b>Список бизнесов:</b>\n\n"
    for biz in response.data[:20]:
        created = biz.get('created_at', 'неизвестно')
        if created and created != 'неизвестно':
            # Конвертируем ISO дату в европейский формат
            try:
                if 'T' in created:
                    dt = datetime.fromisoformat(created.replace('Z', '+00:00'))
                    created = dt.strftime('%d.%m.%Y')
                else:
                    parts = created.split('-')
                    if len(parts) == 3:
                        created = f"{parts[2]}.{parts[1]}.{parts[0]}"
            except:
                pass
        
        star = " ⭐" if biz.get('is_recommended') else ""
        
        text += f"ID: <code>{biz['id']}</code>\n"
        text += f"Название: {biz['title']}{star}\n"
        text += f"Категория: {biz['category']}\n"
        text += f"📅 Добавлено: {created}\n\n"

    if len(response.data) > 20:
        text += f"<i>Показаны первые 20 из {len(response.data)}</i>"

    await update.message.reply_text(text, parse_mode="HTML")
    
    
# Хранилище состояний для добавления бизнеса
user_states = {}

async def add_business(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Добавление нового бизнеса (пошаговый диалог)"""
    user_id = update.effective_user.id
    
    if not is_admin(user_id):
        await update.message.reply_text("⛔ Доступ запрещён.")
        return
    
    # Начинаем диалог
    user_states[user_id] = {"step": "title"}
    await update.message.reply_text(
        "➕ <b>Добавление нового заведения</b>\n\n"
        "Отправьте <b>название</b> заведения:",
        parse_mode="HTML"
    )


async def handle_add_business_input(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Обработка шагов добавления бизнеса"""
    user_id = update.effective_user.id
    
    # ========== ГЛАВНАЯ ПРОВЕРКА ==========
    # Если у пользователя нет активного диалога добавления - выходим
    if user_id not in user_states or "step" not in user_states.get(user_id, {}):
        return  # Не обрабатываем, пропускаем дальше к ИИ агенту
    # ======================================
    
    text = update.message.text
    state = user_states[user_id]
    step = state["step"]
    
    if step == "title":
        state["title"] = text
        state["step"] = "description"
        await update.message.reply_text("📝 Отправьте <b>описание</b> заведения:", parse_mode="HTML")
        
    elif step == "description":
        state["description"] = text
        state["step"] = "category"
        
        # Список категорий
        from data_structure import CATEGORIES
        categories_list = "\n".join([f"• {key} - {data['name']}" for key, data in CATEGORIES.items()])
        
        await update.message.reply_text(
            f"📂 Выберите <b>категорию</b>:\n\n{categories_list}\n\n"
            f"Отправьте ID категории (например: food, housing, spa):",
            parse_mode="HTML"
        )
        
    elif step == "category":
        state["category"] = text.lower()
        state["step"] = "price"
        await update.message.reply_text(
            "💰 Отправьте <b>ценовой диапазон</b> (например: 100-300k или Дорого):",
            parse_mode="HTML"
        )
        
    elif step == "price":
        state["price_range"] = text
        state["step"] = "contact"
        await update.message.reply_text(
            "📞 Отправьте <b>контактный телефон</b> (можно с +84 или без):",
            parse_mode="HTML"
        )
        
    elif step == "contact":
        state["contact"] = text
        state["step"] = "hours"
        await update.message.reply_text(
            "🕒 Отправьте <b>часы работы</b> (например: 09:00-22:00 или Круглосуточно):",
            parse_mode="HTML"
        )
        
    elif step == "hours":
        state["working_hours"] = text
        state["step"] = "address"
        await update.message.reply_text(
            "📍 Отправьте <b>адрес</b> заведения:",
            parse_mode="HTML"
        )
        
    elif step == "address":
        state["address"] = text
        state["step"] = "confirm"
        
        # Показываем предпросмотр
        from handlers.formatters import format_business_card, get_user_location
        from telegram import InlineKeyboardButton, InlineKeyboardMarkup
        
        # Получаем координаты пользователя (для расстояния, но в предпросмотре не нужно)
        # Просто вызываем без координат, так как это ещё не сохранённое заведение
        preview_business = {
            "title": state["title"],
            "description": state["description"],
            "category": state["category"],
            "price_range": state["price_range"],
            "contact": state["contact"],
            "working_hours": state["working_hours"],
            "address": state["address"],
        }
        
        # В предпросмотре расстояние не показываем (нет координат заведения)
        preview_text = format_business_card(preview_business, show_distance=False)
        
        keyboard = InlineKeyboardMarkup([
            [InlineKeyboardButton("✅ Сохранить", callback_data="confirm_business"),
             InlineKeyboardButton("❌ Отмена", callback_data="cancel_business")]
        ])
        
        await update.message.reply_text(
            f"📋 <b>Проверьте данные:</b>\n\n{preview_text}\n\n"
            f"Всё верно?",
            parse_mode="HTML",
            reply_markup=keyboard
        )
        
        
async def confirm_business_callback(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Подтверждение сохранения бизнеса"""
    query = update.callback_query
    await query.answer()
    
    user_id = query.from_user.id
    
    if user_id not in user_states:
        await query.edit_message_text("❌ Сессия истекла. Начните заново с /add_business")
        return
    
    state = user_states[user_id]
    
    from supabase_api import supabase
    
    # Сохраняем в базу
    try:
        response = supabase.table("businesses").insert({
            "title": state["title"],
            "description": state["description"],
            "category": state["category"],
            "price_range": state["price_range"],
            "contact": state["contact"],
            "working_hours": state["working_hours"],
            "address": state["address"],
            "is_recommended": False
        }).execute()
        
        if response.data:
            await query.edit_message_text(
                f"✅ <b>Заведение успешно добавлено!</b>\n\n"
                f"Название: {state['title']}\n"
                f"Категория: {state['category']}",
                parse_mode="HTML"
            )
        else:
            await query.edit_message_text("❌ Ошибка при сохранении. Попробуйте еще раз.")
            
    except Exception as e:
        await query.edit_message_text(f"❌ Ошибка: {str(e)}")
    
    finally:
        # Очищаем состояние
        del user_states[user_id]


async def cancel_business_callback(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Отмена добавления бизнеса"""
    query = update.callback_query
    await query.answer()
    
    user_id = query.from_user.id
    
    if user_id in user_states:
        del user_states[user_id]
    
    await query.edit_message_text("❌ Добавление отменено.")

