<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">

<!-- ДОБАВЬ ЭТО -->
<link rel="stylesheet" href="/static/content/about.css">

</head>

<body>

<div class="container">

<!-- HERO -->
<div class="hero">
    <div class="hero-text">
        <div class="eyebrow">FlowerMaster</div>
        <h1>Цветы, которые создают эмоции</h1>
        <p>
            Мы создаём букеты, которые помогают сказать больше, чем слова.
        </p>
    </div>

    <div class="hero-img">
        <img src="/static/images/bouquet.png" alt="букет">
    </div>
</div>

<!-- ЦЕННОСТИ -->
<div class="section">
    <h2>Наш подход</h2>

    <div class="grid">

        <div class="card">
            <img src="/static/images/heart.png" class="card-icon">
            <h3>С душой</h3>
            <p>Каждый букет создаётся с вниманием к деталям.</p>
        </div>

        <div class="card">
            <img src="/static/images/drop.png" class="card-icon">
            <h3>Свежесть</h3>
            <p>Мы используем только свежие цветы каждый день.</p>
        </div>

        <div class="card">
            <img src="/static/images/flower.png" class="card-icon">
            <h3>Стиль</h3>
            <p>Современный дизайн, который выглядит эстетично.</p>
        </div>

    </div>
</div>

<!-- ПОЧЕМУ МЫ -->
<div class="strip">
    <h2>Почему выбирают нас</h2>

    <div class="stats">
        <div class="stat"><strong>1000+</strong><br>клиентов</div>
        <div class="stat"><strong>24/7</strong><br>поддержка</div>
        <div class="stat"><strong>1 день</strong><br>доставка</div>
    </div>
</div>

<!-- CTA -->
<div class="cta">
    <h2>Создай свой букет</h2>
    <button class="btn" onclick="location.href='/constructor'">
        Перейти в конструктор →
    </button>
</div>

</div>

</body>
</html>