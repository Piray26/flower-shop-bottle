from bottle import post, request
import re
from datetime import datetime

@post('/contact', method='post')
def handle_contact():
    name = request.forms.get('name')
    email = request.forms.get('email')
    message = request.forms.get('message')
    
    # Проверка заполненности
    if not name or not email or not message:
        return "Error: all fields must be filled"

    # Проверка email регулярным выражением
    email_pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    if not re.match(email_pattern, email):
        return "Error: invalid email format"
    
    # Дата обращения
    date_str = datetime.now().strftime("%Y-%m-%d")
    
    # Ответ с именем и датой
    return f"Thanks, {name}! Your message has been received. We will reply to {email}. Access Date: {date_str}"

