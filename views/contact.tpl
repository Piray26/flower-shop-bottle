<div class="container mt-5 contact-page">

<style>
/* ===== ОСНОВА ===== */
.contact-page {
    font-family: 'Montserrat', sans-serif;
}

/* HERO */
.contact-hero {
    text-align: center;
    margin-bottom: 60px;
    padding: 40px;
    background: linear-gradient(135deg, #f3eaea, #fdfdfd);
    border-radius: 20px;
}

.contact-hero h1 {
    font-size: 48px;
    font-weight: 700;
    margin-bottom: 10px;
}

.contact-hero p {
    color: #666;
    font-size: 18px;
}

.eyebrow {
    text-transform: uppercase;
    font-size: 12px;
    letter-spacing: 2px;
    opacity: 0.7;
    margin-bottom: 10px;
}

/* GRID */
.contact-grid {
    display: flex;
    gap: 40px;
    flex-wrap: wrap;
}

/* CARD */
.contact-card {
    flex: 1;
    min-width: 300px;
    background: white;
    padding: 30px;
    border-radius: 16px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.05);
    transition: 0.3s;
}

.contact-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 40px rgba(0,0,0,0.1);
}

/* CONTACT ITEMS */
.contact-item {
    display: flex;
    gap: 15px;
    margin-bottom: 20px;
    align-items: flex-start;
}

.contact-item img {
    width: 26px;
    opacity: 0.7;
}

.contact-item p {
    margin: 0;
    color: #666;
}

/* FORM */
.contact-form input,
.contact-form textarea {
    width: 100%;
    margin-bottom: 15px;
    padding: 14px;
    border-radius: 12px;
    border: 1px solid #eee;
    font-size: 14px;
    transition: 0.2s;
}

.contact-form input:focus,
.contact-form textarea:focus {
    outline: none;
    border-color: #8fbc8f;
    box-shadow: 0 0 0 3px rgba(143,188,143,0.1);
}

/* BUTTON */
.btn-main {
    width: 100%;
    padding: 16px;
    border-radius: 24px;
    background: #8fbc8f;
    color: white;
    border: none;
    font-size: 16px;
    transition: 0.3s;
}

.btn-main:hover {
    transform: scale(1.04);
    box-shadow: 0 10px 30px rgba(143,188,143,0.3);
}

/* SUCCESS */
.alert-success-custom {
    background: #e6f4ea;
    color: #2e7d32;
    padding: 15px;
    border-radius: 12px;
    text-align: center;
    margin-bottom: 30px;
}

/* MOBILE */
@media (max-width: 768px) {
    .contact-hero h1 {
        font-size: 32px;
    }
}
</style>

<!-- HERO -->
<div class="contact-hero">
    <div class="eyebrow">FlowerMaster</div>
    <h1>Свяжитесь с нами</h1>
    <p>Мы всегда готовы помочь и ответить на любые вопросы</p>
</div>

% if success:
<div class="alert-success-custom">
    Сообщение успешно отправлено!
</div>
% end

<!-- GRID -->
<div class="contact-grid">

    <!-- КОНТАКТЫ -->
    <div class="contact-card">

        <h3>Контактная информация</h3>

        <div class="contact-item">
            <img src="/static/images/map.png">
            <div>
                <strong>Адрес</strong>
                <p>г. Москва, ул. Цветочная, 10</p>
            </div>
        </div>

        <div class="contact-item">
            <img src="/static/images/phone.png">
            <div>
                <strong>Телефон</strong>
                <p>+7 (999) 123-45-67</p>
            </div>
        </div>

        <div class="contact-item">
            <img src="/static/images/message.png">
            <div>
                <strong>Email</strong>
                <p>info@flowermaster.ru</p>
            </div>
        </div>

        <div class="contact-item">
            <img src="/static/images/time.png">
            <div>
                <strong>Часы работы</strong>
                <p>Ежедневно с 9:00 до 21:00</p>
            </div>
        </div>

    </div>

    <!-- ФОРМА -->
    <div class="contact-card">

        <h3>Напишите нам</h3>

        <form method="post" action="/contact" class="contact-form">

            <input type="text" name="name" placeholder="Ваше имя" required>
            <input type="email" name="email" placeholder="Email" required>
            <textarea name="message" rows="4" placeholder="Сообщение" required></textarea>

            <button type="submit" class="btn-main">
                Отправить →
            </button>

        </form>

    </div>

</div>

</div>