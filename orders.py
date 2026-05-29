from bottle import route, request, template, redirect
import json
import os
import re
from datetime import datetime
from bottle import request

ORDERS_FILE = 'data/orders.json'


def load_orders():
    if not os.path.exists(ORDERS_FILE):
        return []

    with open(ORDERS_FILE, 'r', encoding='utf-8') as file:
        return json.load(file)


def save_orders(orders):
    os.makedirs(os.path.dirname(ORDERS_FILE), exist_ok=True)

    with open(ORDERS_FILE, 'w', encoding='utf-8') as file:
        json.dump(orders, file, ensure_ascii=False, indent=4)



def validate_phone(phone):

    pattern = (
        r'^('
        r'(8|7)\d{10}'
        r'|'
        r'\+7\(\d{3}\)-\d{3}-\d{2}-\d{2}'
        r')$'
    )

    return bool(re.fullmatch(pattern, phone))


def validate_date(date_text):
    try:
        datetime.strptime(date_text, '%Y-%m-%d')
        return True
    except ValueError:
        return False

def clean_text(text):
    try:
        text = text.encode('latin1').decode('utf-8')
    except:
        pass
    return ' '.join(text.split())

def generate_order_number(orders):

    if not orders:
        return '100001'

    numbers = [
        int(order['number'])
        for order in orders
        if order['number'].isdigit()
    ]

    return str(max(numbers) + 1)


@route('/orders', method=['GET', 'POST'])
def orders_page():

    errors = {}

    form_data = {
        'number': '',
        'description': '',
        'phone': '',
        'date': ''
    }

    orders = load_orders()

    if request.method == 'POST':

        form_data['description'] = clean_text(request.forms.get('description', ''))
        form_data['phone'] = clean_text(request.forms.get('phone', ''))
        form_data['date'] = clean_text(request.forms.get('date', ''))

        # Валидация описания
        if not form_data['description']:
            errors['description'] = 'Введите описание заказа'
        
        elif len(form_data['description']) > 200:
            errors['description'] = (
                'Описание не должно превышать 200 символов'
            )

        elif len(form_data['description']) < 3:
            errors['description'] = (
                'Описание слишком короткое'
            )

        # Валидация телефона
        if not form_data['phone']:
            errors['phone'] = 'Введите номер телефона'

        elif not validate_phone(form_data['phone']):
            errors['phone'] = (
                'Введите телефон в формате '
                '89123456789, 79123456789 '
                'или +7(999)-222-56-89'
            )

        # Валидация даты
        if not form_data['date']:
            errors['date'] = 'Введите дату заказа'

        elif not validate_date(form_data['date']):
            errors['date'] = 'Дата должна быть в формате ГГГГ-ММ-ДД'

        else:
            order_date = datetime.strptime(
                form_data['date'],
                '%Y-%m-%d'
            ).date()

            if order_date.year < 2024:
                errors['date'] = 'Дата заказа слишком старая'

            elif order_date > datetime.now().date():
                errors['date'] = 'Дата заказа не может быть в будущем'

        # Если ошибок нет
        if not errors:

            order_number = generate_order_number(orders)

            new_order = {
                'number': order_number,
                'description': form_data['description'],
                'phone': form_data['phone'],
                'date': form_data['date']
            }

            # Новый заказ сверху
            orders.insert(0, new_order)

            save_orders(orders)

            redirect('/orders')

    description = request.query.description or ''

    return template(
        'orders',
        orders=orders,
        errors=errors,
        form_data={
            'description': description
        },
        year=datetime.now().year
    )