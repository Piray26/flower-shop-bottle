from bottle import route, request, template, redirect
import json
import os
import re
from datetime import datetime

ARTICLES_FILE = 'data/articles.json'


def load_articles():
    if not os.path.exists(ARTICLES_FILE):
        return []

    with open(ARTICLES_FILE, 'r', encoding='utf-8-sig') as file:
        return json.load(file)


def save_articles(articles):
    os.makedirs(os.path.dirname(ARTICLES_FILE), exist_ok=True)

    with open(ARTICLES_FILE, 'w', encoding='utf-8') as file:
        json.dump(articles, file, ensure_ascii=False, indent=4)


def validate_author(author):
    return bool(re.fullmatch(r'[A-Za-zА-Яа-яЁё0-9_\- ]{2,40}', author))


def validate_phone(phone):
    pattern = (
        r'^('
        r'(8|7)\d{10}'
        r'|'
        r'\+7\(\d{3}\)-\d{3}-\d{2}-\d{2}'
        r')$'
    )
    return bool(re.fullmatch(pattern, phone))


def clean_text(text):
    text = text or ''
    if 'Ð' in text or 'Ñ' in text:
        try:
            text = text.encode('latin1').decode('utf-8')
        except UnicodeError:
            pass
    return ' '.join((text or '').split())


@route('/articles', method=['GET', 'POST'])
def articles_page():
    errors = {}

    form_data = {
        'author': '',
        'title': '',
        'description': '',
        'phone': ''
    }

    articles = load_articles()
    articles.sort(
        key=lambda item: item.get('created_at') or item.get('date', ''),
        reverse=True
    )

    if request.method == 'POST':
        form_data['author'] = clean_text(request.forms.getunicode('author', ''))
        form_data['title'] = clean_text(request.forms.getunicode('title', ''))
        form_data['description'] = clean_text(request.forms.getunicode('description', ''))
        form_data['phone'] = clean_text(request.forms.getunicode('phone', ''))

        if not form_data['author']:
            errors['author'] = 'Введите автора статьи'
        elif not validate_author(form_data['author']):
            errors['author'] = 'Автор: 2-40 символов (буквы, цифры, пробел, -, _)'

        if not form_data['title']:
            errors['title'] = 'Введите название статьи'
        elif len(form_data['title']) < 3:
            errors['title'] = 'Название слишком короткое'
        elif len(form_data['title']) > 100:
            errors['title'] = 'Название не должно превышать 100 символов'

        if not form_data['description']:
            errors['description'] = 'Введите текст статьи'
        elif len(form_data['description']) < 10:
            errors['description'] = 'Текст статьи должен содержать минимум 10 символов'
        elif len(form_data['description']) > 1000:
            errors['description'] = 'Текст статьи не должен превышать 1000 символов'

        if form_data['phone'] and not validate_phone(form_data['phone']):
            errors['phone'] = (
                'Введите телефон в формате 89123456789, 79123456789 '
                'или +7(999)-222-56-89'
            )

        if not errors:
            new_article = {
                'author': form_data['author'],
                'title': form_data['title'],
                'description': form_data['description'],
                'phone': form_data['phone'],
                'created_at': datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            }

            articles.insert(0, new_article)
            articles.sort(
                key=lambda item: item.get('created_at') or item.get('date', ''),
                reverse=True
            )
            save_articles(articles)
            redirect('/articles')

    return template(
        'articles',
        articles=articles,
        errors=errors,
        form_data=form_data,
        year=datetime.now().year
    )
