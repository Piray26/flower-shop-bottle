from bottle import route, request, template, redirect
import json
import os
import re
from datetime import datetime

ARTICLES_FILE = 'data/articles.json'


def load_articles():
    if not os.path.exists(ARTICLES_FILE):
        return []

    with open(ARTICLES_FILE, 'r', encoding='utf-8') as file:
        return json.load(file)


def save_articles(articles):
    os.makedirs(os.path.dirname(ARTICLES_FILE), exist_ok=True)

    with open(ARTICLES_FILE, 'w', encoding='utf-8') as file:
        json.dump(articles, file, ensure_ascii=False, indent=4)


def validate_date(date_text):
    try:
        datetime.strptime(date_text, '%Y-%m-%d')
        return True
    except ValueError:
        return False


def validate_author(author):
    return bool(re.fullmatch(r'[A-Za-zА-Яа-яЁё0-9_\- ]{2,40}', author))


def clean_text(text):
    return ' '.join((text or '').split())


@route('/articles', method=['GET', 'POST'])
def articles_page():
    errors = {}

    form_data = {
        'author': '',
        'title': '',
        'description': '',
        'date': ''
    }

    articles = load_articles()

    if request.method == 'POST':
        form_data['author'] = clean_text(request.forms.get('author', ''))
        form_data['title'] = clean_text(request.forms.get('title', ''))
        form_data['description'] = clean_text(request.forms.get('description', ''))
        form_data['date'] = clean_text(request.forms.get('date', ''))

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

        if not form_data['date']:
            errors['date'] = 'Введите дату публикации'
        elif not validate_date(form_data['date']):
            errors['date'] = 'Дата должна быть в формате ГГГГ-ММ-ДД'
        else:
            article_date = datetime.strptime(form_data['date'], '%Y-%m-%d').date()

            if article_date.year < 2024:
                errors['date'] = 'Дата публикации слишком старая'
            elif article_date > datetime.now().date():
                errors['date'] = 'Дата публикации не может быть в будущем'

        if not errors:
            new_article = {
                'author': form_data['author'],
                'title': form_data['title'],
                'description': form_data['description'],
                'date': form_data['date']
            }

            articles.insert(0, new_article)
            articles.sort(key=lambda item: item.get('date', ''), reverse=True)
            save_articles(articles)
            redirect('/articles')

    return template(
        'articles',
        articles=articles,
        errors=errors,
        form_data=form_data,
        year=datetime.now().year
    )
