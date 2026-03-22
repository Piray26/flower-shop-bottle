"""
Routes and views for the bottle application.
"""

from bottle import route, view
from datetime import datetime

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

@route('/')
@route('/home')
@view('index')
def home():
    """Renders the home page."""
    return dict(
        year=datetime.now().year,
        bouquets=BOUQUETS_DB
    )

@route('/contact')
@view('contact')
def contact():
    """Renders the contact page."""
    return dict(
        title='Contact',
        message='Your contact page.',
        year=datetime.now().year
    )

@route('/about')
@view('about')
def about():
    """Renders the about page."""
    return dict(
        title='About',
        message='Your application description page.',
        year=datetime.now().year
    )
