import re
import json
import os
from datetime import datetime

EMAIL_PATTERN = re.compile(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
)

DANGEROUS_CHARS = re.compile(
    r"[\"';\\{}$`|<>]"
)

TEXT_PATTERN = re.compile(
    r'^[а-яА-Яa-zA-Z0-9\s.,!?()\-:]+$'
)


DATA_FILE = 'contacts.json'


def load_messages():

    if os.path.exists(DATA_FILE):

        with open(
            DATA_FILE,
            'r',
            encoding='utf-8'
        ) as f:

            return json.load(f)

    return []


def save_messages(messages):

    with open(
        DATA_FILE,
        'w',
        encoding='utf-8'
    ) as f:

        json.dump(
            messages,
            f,
            indent=4,
            ensure_ascii=False
        )


def validate_name(name: str):

    if not name:
        return False, 'Введите имя'

    name = name.strip()

    if len(name) < 2:
        return False, 'Имя слишком короткое'

    if len(name) > 50:
        return False, 'Имя слишком длинное'

    # Проверка опасных символов
    if DANGEROUS_CHARS.search(name):
        return False, 'Имя содержит запрещённые символы'

    # Только буквы
    if not re.match(r'^[а-яА-ЯёЁa-zA-Z\s-]+$', name):
        return False, 'Имя содержит недопустимые символы'

    # Повторяющиеся символы
    if re.search(r'(.)\1{3,}', name):
        return False, 'Имя содержит повторяющиеся символы'

    # Двойные пробелы
    if re.search(r'\s{2,}', name):
        return False, 'Имя содержит лишние пробелы'

    return True, ''



def validate_email(email: str):

    if not email:
        return False, 'Введите email'

    email = email.strip()

    if len(email) > 254:
        return False, 'Email слишком длинный'

    if '..' in email:
        return False, 'Email содержит две точки подряд'

    if not EMAIL_PATTERN.match(email):
        return False, 'Некорректный email'

    try:
        local_part, domain = email.rsplit('@', 1)

    except ValueError:
        return False, 'Email должен содержать один символ @'

    # Локальная часть
    if len(local_part) > 64:
        return False, 'Слишком длинное имя почты'

    if (
        local_part.startswith('.')
        or
        local_part.endswith('.')
    ):
        return False, 'Точка не может быть в начале или конце email'

    # Домен
    if (
        domain.startswith('.')
        or
        domain.endswith('.')
    ):
        return False, 'Некорректный домен'

    if '.' not in domain:
        return False, 'Домен должен содержать точку'

    return True, ''


def validate_message(message: str):

    if not message:
        return False, 'Введите сообщение'

    message = message.strip()

    # Длина
    if len(message) <= 3:
        return False, 'Сообщение слишком короткое'

    if len(message) > 1000:
        return False, 'Сообщение слишком длинное'

    # Должно начинаться с буквы
    if not message[0].isalpha():
        return False, 'Сообщение должно начинаться с буквы'

    # Должно содержать буквы
    if not any(c.isalpha() for c in message):
        return False, 'Сообщение должно содержать буквы'

    # Минимум два слова
    if len(message.split()) < 2:
        return False, 'Введите более подробное сообщение'

    # Двойные пробелы
    if re.search(r'\s{2,}', message):
        return False, 'Сообщение содержит лишние пробелы'

    # Повторяющиеся символы
    if re.search(r'(.)\1{4,}', message):
        return False, 'Сообщение содержит слишком много повторяющихся символов'

    # Лишняя пунктуация
    if re.search(r'[.?!]{3,}$', message):
        return False, 'Слишком много знаков препинания'

    # Проверка допустимых символов
    if not TEXT_PATTERN.match(message):
        return False, 'Сообщение содержит запрещённые символы'

    # Проверка скобок
    if (
        message.count('(') != message.count(')')
        or
        message.count('[') != message.count(']')
    ):
        return False, 'Ошибка в скобках'

    # Повторяющиеся слова
    if re.search(
        r'\b(\w+)( \1\b){2,}',
        message.lower()
    ):
        return False, 'Сообщение содержит повторяющиеся слова'

    return True, ''


def save_contact_message(name, email, message):

    messages = load_messages()

    new_message = {
        'name': name,
        'email': email,
        'message': message,
        'date': datetime.now().strftime('%Y-%m-%d %H:%M')
    }

    messages.insert(0, new_message)

    save_messages(messages)
