# D:\aRabota\TelegaBoom\08_gid\ai_agent.py

from openai import AsyncOpenAI
from supabase import create_client
from config import OPENAI_API_KEY, SUPABASE_URL, SUPABASE_KEY
import logging

logger = logging.getLogger(__name__)

client = AsyncOpenAI(api_key=OPENAI_API_KEY)
supabase = create_client(SUPABASE_URL, SUPABASE_KEY)

CHEAP_MODEL = "gpt-5-nano"


async def get_search_keywords(user_text: str):
    """Приводим слово к начальной форме (лемматизация через ИИ)."""
    try:
        response = await client.chat.completions.create(
            model=CHEAP_MODEL,
            messages=[
                {
                    "role": "user",
                    "content": f"User text: '{user_text}'. Extract the main object as a single noun in its initial form (nominative case, singular). Example: 'астролога' -> 'астролог', 'отели' -> 'отель'. Reply with ONLY the word."
                }
            ]
        )
        word = response.choices[0].message.content.strip().lower().replace(".", "").replace("?", "").replace("!", "")
        return word.split()[-1]
    except Exception as e:
        print(f"❌ Ошибка извлечения: {e}")
        return user_text


def get_data_from_db(search_word: str):
    """Поиск в базе"""
    try:
        pattern = f"%{search_word}%"
        print(f"🔍 Поиск в базе по: {search_word}")
        
        response = supabase.table('businesses').select("*").or_(
            f"title.ilike.{pattern},description.ilike.{pattern},category.ilike.{pattern},subcategory.ilike.{pattern}"
        ).execute()

        return response.data if response.data else None
    except Exception as e:
        print(f"❌ Ошибка базы: {e}")
        return None


async def get_ai_response(user_text: str):
    # Убираем лишние пробелы
    user_text = user_text.strip()

    # Если на входе одно слово (нажатие кнопки), пропускаем лемматизацию для скорости
    if len(user_text.split()) == 1:
        keyword = user_text.lower().replace("?", "")
    else:
        keyword = await get_search_keywords(user_text)
    
    # Ищем в базе
    db_results = get_data_from_db(keyword)
    
    # Если ничего не нашли, возвращаем маркер для вывода кнопок в main.py
    if not db_results:
        return f"NOT_FOUND: По запросу '{keyword}' я ничего не нашел в базе. Попробуйте выбрать категорию ниже или уточните запрос."

    # Собираем данные из базы для контекста ИИ
    business_list = ""
    for r in db_results:
        business_list += (
            f"ЗАВЕДЕНИЕ: {r.get('title')}. "
            f"ОПИСАНИЕ: {r.get('description')}. "
            f"ЦЕНА: {r.get('price_range')}. "
            f"КОНТАКТ: {r.get('contact')}. "
            f"АДРЕС: {r.get('address')}\n\n"
        )

    final_prompt = (
        f"Используй эти данные из базы:\n{business_list}\n"
        f"Вопрос пользователя: {user_text}\n"
        f"Напиши короткий, вежливый ответ на русском языке на основе данных выше. "
        f"Если заведений несколько, перечисли их кратко. Не придумывай ничего, чего нет в данных."
    )

    try:
        final_response = await client.chat.completions.create(
            model=CHEAP_MODEL,
            messages=[
                {"role": "user", "content": final_prompt}
            ]
        )
        return final_response.choices[0].message.content.strip()
    except Exception as e:
        print(f"❌ Ошибка финального ответа: {e}")
        return "⚠️ Ошибка связи с ИИ при формировании ответа."
    