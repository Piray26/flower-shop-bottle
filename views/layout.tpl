<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ title }} - Flower Shop</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/static/content/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/static/content/site.css" />
</head>

<body>
    <header class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <a href="/" class="navbar-brand">🌸 FlowerMaster</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="/">Каталог</a></li>
                    <li><a href="/constructor">Конструктор</a></li>
                    <li><a href="/about">О нас</a></li>
                    <li><a href="/contact">Контакты</a></li>
                    <li><a href="/orders">Оформленные заказы</a></li>

                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/cart">🛒 Корзина</a></li>
                </ul>
            </div>
        </div>
    </header>

    <div class="container body-content">
        {{!base}} 
        <hr />
        <footer>
            <p>&copy; {{ year }} - Цветочная Мастерская. Создано в рамках Лабораторной работы.</p>
        </footer>
    </div>

    <script src="/static/scripts/jquery-1.10.2.js"></script>
    <script src="/static/scripts/bootstrap.js"></script>
</body>
</html>