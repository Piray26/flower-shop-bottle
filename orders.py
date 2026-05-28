from bottle import route, request, template, redirect
import json
import os
import re
from datetime import datetime

# Убедитесь, что путь правильный
ORDERS_FILE = 'data/orders.json'

def load_orders():
    if not os.path.exists(ORDERS_FILE):
        return []
    # Явно указываем UTF-8
    with open(ORDERS_FILE, 'r', encoding='utf-8') as file:
        return json.load(file)

def save_orders(orders):
    os.makedirs(os.path.dirname(ORDERS_FILE), exist_ok=True)
    # Явно указываем UTF-8 и ensure_ascii=False
    with open(ORDERS_FILE, 'w', encoding='utf-8') as file:
        json.dump(orders, file, ensure_ascii=False, indent=4)

def validate_phone(phone):
    pattern = r'^\+7\(\d{3}\)-\d{3}-\d{2}-\d{2}$'
    return bool(re.match(pattern, phone))

def validate_date(date_text):
    try:
        datetime.strptime(date_text, '%Y-%m-%d')
        return True
    except ValueError:
        return False

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
        # Безопасное получение данных с .strip()
        form_data['number'] = request.forms.get('number', '').strip()
        form_data['description'] = request.forms.get('description', '').strip()
        form_data['phone'] = request.forms.get('phone', '').strip()
        form_data['date'] = request.forms.get('date', '').strip()

        # Проверка на пустые поля
        if not form_data['number']:
            errors['number'] = 'Введите номер заказа'
        if not form_data['description']:
            errors['description'] = 'Введите описание заказа'
        
        # Проверка телефона
        if not validate_phone(form_data['phone']):
            errors['phone'] = 'Телефон должен быть в формате +7(999)-999-99-99'
        
        # Проверка даты (формат + не в будущем)
        if not form_data['date']:
            errors['date'] = 'Введите дату заказа'
        elif not validate_date(form_data['date']):
            errors['date'] = 'Дата должна быть в формате ГГГГ-ММ-ДД'
        else:
            # Проверка на будущую дату
            order_date = datetime.strptime(form_data['date'], '%Y-%m-%d').date()
            if order_date > datetime.now().date():
                errors['date'] = 'Дата заказа не может быть в будущем'
        
        # Проверка на дубликат номера
        if not errors.get('number') and form_data['number']:
            if any(order['number'] == form_data['number'] for order in orders):
                errors['number'] = 'Заказ с таким номером уже существует'

        if not errors:
            new_order = {
                'number': form_data['number'],
                'description': form_data['description'],
                'phone': form_data['phone'],
                'date': form_data['date']
            }
            orders.insert(0, new_order)
            save_orders(orders)
            return redirect('/orders')

    # Передаём year в шаблон
    return template(
        'orders',
        orders=orders,
        errors=errors,
        form_data=form_data,
        year=datetime.now().year
    )