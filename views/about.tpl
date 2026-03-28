<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">

<style>
body {
    margin: 0;
    font-family: 'Montserrat', sans-serif;
    background: #fdfdfd;
    color: #333;
    overflow-x: hidden;
}

/* фон лепестков */
body::before {
    content: "";
    position: fixed;
    width: 100%;
    height: 100%;
    background: url('/static/images/petals.png') center/cover no-repeat;
    opacity: 0.16;
    z-index: -1;
}

/* контейнер */
.container {
    max-width: 1100px;
    margin: auto;
    padding: 40px 20px;
}

/* HERO */
.hero {
    display: flex;
    align-items: center;
    gap: 60px;
    padding: 80px 0;
}

.hero-text {
    flex: 1;
}

.eyebrow {
    text-transform: uppercase;
    font-size: 12px;
    letter-spacing: 2px;
    opacity: 0.7;
    margin-bottom: 10px;
}

.hero h1 {
    font-size: 52px;
    font-weight: 700;
    margin-bottom: 20px;
}

.hero p {
    font-size: 18px;
    line-height: 1.7;
    color: #666;
    max-width: 500px;
}

.hero-img {
    flex: 1;
}

.hero-img img {
    width: 100%;
    border-radius: 20px;
    box-shadow: 0 12px 40px rgba(0,0,0,0.1);
}

/* секции */
.section {
    margin-top: 80px;
}

.section h2 {
    font-size: 30px;
    margin-bottom: 20px;
}

/* карточки */
.grid {
    display: flex;
    gap: 30px;
    flex-wrap: wrap;
}

.card {
    flex: 1;
    min-width: 250px;
    background: white;
    border-radius: 16px;
    padding: 30px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.05);
    transition: 0.3s;
    position: relative;
    overflow: hidden;
}

.card::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    height: 3px;
    width: 100%;
    background: #8fbc8f;
    opacity: 0;
    transition: 0.3s;
}

.card:hover::before {
    opacity: 1;
}

.card:hover {
    transform: translateY(-6px);
    box-shadow: 0 12px 40px rgba(0,0,0,0.1);
}

.card-icon {
    width: 170px;
    margin-bottom: 15px;
}

/* strip */
.strip {
    margin-top: 80px;
    padding: 60px;
    border-radius: 20px;
    background: linear-gradient(135deg, #f3eaea, #fdfdfd);
    text-align: center;
    box-shadow: 0 4px 20px rgba(0,0,0,0.05);
}

/* stats */
.stats {
    display: flex;
    gap: 20px;
    justify-content: center;
    margin-top: 40px;
    flex-wrap: wrap;
}

.stat {
    background: white;
    padding: 20px;
    border-radius: 20px;
    text-align: center;
    min-width: 120px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.05);
}

/* CTA */
.cta {
    text-align: center;
    margin-top: 80px;
}

.btn {
    background: #8fbc8f;
    padding: 18px 36px;
    border-radius: 24px;
    color: white;
    border: none;
    font-size: 16px;
    cursor: pointer;
    transition: 0.3s;
}

.btn:hover {
    transform: scale(1.05);
    box-shadow: 0 10px 30px rgba(143,188,143,0.3);
}

/* мобильная версия */
@media (max-width: 768px) {
    .hero {
        flex-direction: column;
        text-align: center;
    }

    .hero h1 {
        font-size: 32px;
    }
}
</style>
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