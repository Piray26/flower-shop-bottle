"""
Routes and views for the bottle application.
"""

from bottle import route, view, template, request, response, redirect, post
from urllib.parse import quote
import json
from datetime import datetime
import orders

from contact_handler import ( 
    validate_name, 
    validate_email, 
    validate_message, 
    save_contact_message 
)

BOUQUETS_DB = [
    {
        "id": 1, 
        "name": "Нежная весна", 
        "price": 2500, 
        "image": "bouquet_1.jpg", 
        "desc": "Светлые пионы и нежная зелень"
    },
    {
        "id": 2, 
        "name": "Яркий акцент", 
        "price": 3200, 
        "image": "bouquet_2.jpg", 
        "desc": "Красные розы в стильном крафте"
    },
    {
        "id": 3, 
        "name": "Солнечный день", 
        "price": 1800, 
        "image": "bouquet_3.jpg", 
        "desc": "Желтые тюльпаны для настроения"
    }
]

@route('/add-to-cart/<bouquet_id:int>')
def add_to_cart(bouquet_id):

    bouquet = next(
        (b for b in BOUQUETS_DB if b['id'] == bouquet_id),
        None
    )

    if not bouquet:
        redirect('/')

    cart = get_cart()

    existing_item = next(
        (item for item in cart if item['id'] == bouquet_id),
        None
    )

    if existing_item:
        existing_item['qty'] += 1
    else:
        cart.append({
            'id': bouquet['id'],
            'name': bouquet['name'],
            'price': bouquet['price'],
            'image': bouquet['image'],
            'qty': 1
        })

    save_cart(cart)

    redirect('/cart')

@post('/add-custom-bouquet')
def add_custom_bouquet():

    flowers = request.forms.getunicode('flowers', '').strip()

    price = request.forms.getunicode('price', '0').strip()

    if not flowers:
        redirect('/constructor')

    cart = get_cart()

    custom_bouquet = {

        'id': int(datetime.now().timestamp()),

        'name': 'Авторский букет',

        'description': flowers,

        'price': int(price),

        'image': '',

        'qty': 1
    }

    cart.append(custom_bouquet)

    save_cart(cart)

    redirect('/cart')

@route('/increase/<bouquet_id:int>')
def increase_quantity(bouquet_id):

    cart = get_cart()

    for item in cart:
        if item['id'] == bouquet_id:
            item['qty'] += 1
            break

    save_cart(cart)

    redirect('/cart')

@route('/decrease/<bouquet_id:int>')
def decrease_quantity(bouquet_id):

    cart = get_cart()

    for item in cart:

        if item['id'] == bouquet_id:

            item['qty'] -= 1

            if item['qty'] <= 0:
                cart.remove(item)

            break

    save_cart(cart)

    redirect('/cart')


@route('/')
@route('/home')
@view('index')
def home():
    """Renders the home page."""
    return dict(
        year=datetime.now().year,
        bouquets=BOUQUETS_DB
    )
@route('/constructor')
@view('constructor')
def constructor():
    return dict(
        year=datetime.now().year
    )

@route('/contact')
def contact():

    return template(
        'contact',
        form_data={},
        errors={},
        success='',
        year=datetime.now().year
    )

@post('/contact')
def handle_contact():

    form_data = {
        'name': request.forms.getunicode('name', '').strip(),
        'email': request.forms.getunicode('email', '').strip(),
        'message': request.forms.getunicode('message', '').strip()
    }

    errors = {}

    # Проверка имени
    valid, error = validate_name(form_data['name'])

    if not valid:
        errors['name'] = error

    # Проверка email
    valid, error = validate_email(form_data['email'])

    if not valid:
        errors['email'] = error

    # Проверка сообщения
    valid, error = validate_message(form_data['message'])

    if not valid:
        errors['message'] = error

    # Если есть ошибки
    if errors:

        return template(
            'contact',
            errors=errors,
            form_data=form_data,
            success='',
            year=datetime.now().year
        )

    # Сохранение
    save_contact_message(
        form_data['name'],
        form_data['email'],
        form_data['message']
    )

    # Успешная отправка
    return template(
        'contact',
        errors={},
        form_data={},
        success='Сообщение успешно отправлено!',
        year=datetime.now().year
    )

@route('/about')
@view('about')
def about():
    return dict(
        year=datetime.now().year
    )

@route('/cart')
def cart():

    cart_items = get_cart()

    total = sum(
        item['price'] * item['qty']
        for item in cart_items
    )

    return template(
        'cart',
        items=cart_items,
        total=total,
        year=datetime.now().year
    )

@route('/checkout')
def checkout():

    cart = get_cart()

    if not cart:
        redirect('/cart')

    description = []

    for item in cart:

        description.append(
            f"{item['name']} x{item['qty']}"
        )

    order_description = ', '.join(description)

    redirect(
        f"/orders?description={quote(order_description)}"
    )

def get_cart():
    cart_cookie = request.get_cookie('cart')

    if not cart_cookie:
        return []

    try:
        return json.loads(cart_cookie)
    except:
        return []


def save_cart(cart):
    response.set_cookie(
        'cart',
        json.dumps(cart),
        path='/'
    )




