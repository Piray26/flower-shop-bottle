<div class="container contact-page">

<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap');

:root {
  --primary: #8fbc8f;
  --text-primary: #333;
  --text-secondary: #666;
  --text-muted: #888;
  --bg-gradient-start: #f3eaea;
  --bg-gradient-end: #fdfdfd;
  --shadow: rgba(0,0,0,0.05);
  --shadow-hover: rgba(0,0,0,0.08);

  --space-sm: 16px;
  --space-md: 24px;
  --space-lg: 40px;
  --space-xl: 64px;
}

/* ФОН */
.contact-page::before {
    content: "";
    position: fixed;
    inset: 0;
    background: url('/static/images/petals.png') center/cover no-repeat;
    opacity: 0.12;
    z-index: -1;
}

/* ОБЩЕЕ */
.contact-page {
    font-family: 'Montserrat', sans-serif;
    padding: 40px 20px;
}

/* HEADER */
.contact-header {
    text-align: center;
    margin-bottom: var(--space-xl);
}

.eyebrow {
    text-transform: uppercase;
    font-size: 12px;
    letter-spacing: 2px;
    color: var(--text-muted);
    margin-bottom: 10px;
}

.contact-header h1 {
    font-size: 48px;
    font-weight: 700;
    margin-bottom: 10px;
}

.contact-header p {
    font-size: 18px;
    color: var(--text-secondary);
    line-height: 1.6;
}

.header-line {
    width: 60px;
    height: 3px;
    background: var(--primary);
    margin: 20px auto 0;
    border-radius: 2px;
}

/* GRID */
.contact-grid {
    display: flex;
    gap: 48px;
    flex-wrap: wrap;
}

/* CARD */
.contact-card {
    flex: 1;
    min-width: 300px;
    background: white;
    padding: 32px;
    border-radius: 20px;
    box-shadow: 0 4px 20px var(--shadow);
    transition: 0.3s cubic-bezier(0.4,0,0.2,1);
    position: relative;
}

.contact-card::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    height: 4px;
    width: 100%;
    background: linear-gradient(90deg, var(--primary), transparent);
    opacity: 0;
    transition: 0.3s;
}

.contact-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 12px 40px var(--shadow-hover);
}

.contact-card:hover::before {
    opacity: 1;
}

/* TITLE */
.contact-card h3 {
    font-size: 22px;
    font-weight: 600;
    margin-bottom: 20px;
    border-bottom: 2px solid rgba(143,188,143,0.2);
    padding-bottom: 8px;
}

/* CONTACT ITEM */
.contact-item {
    display: flex;
    gap: 16px;
    margin-bottom: 20px;
    align-items: flex-start;
}

.contact-icon {
    width: 42px;
    height: 42px;
    background: #f5f5f5;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: 0.3s;
}

.contact-icon img {
    width: 20px;
    opacity: 0.7;
}

.contact-item:hover .contact-icon {
    background: var(--primary);
}

.contact-item:hover img {
    filter: brightness(0) invert(1);
}

/* TEXT */
.contact-item strong {
    display: block;
    margin-bottom: 2px;
}

.contact-item p {
    margin: 0;
    color: var(--text-secondary);
}

/* FORM */
.contact-form input,
.contact-form textarea {
    width: 100%;
    margin-bottom: 16px;
    padding: 16px;
    border-radius: 12px;
    border: 1px solid #eee;
    font-size: 15px;
    transition: 0.2s;
}

.contact-form input:focus,
.contact-form textarea:focus {
    outline: none;
    border-color: var(--primary);
    box-shadow: 0 0 0 3px rgba(143,188,143,0.15);
    transform: translateY(-1px);
}

/* BUTTON */
.btn-main {
    width: 100%;
    padding: 18px;
    border-radius: 28px;
    background: var(--primary);
    color: white;
    border: none;
    font-size: 16px;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 8px;
    transition: 0.3s cubic-bezier(0.4,0,0.2,1);
}

.btn-main span {
    transition: 0.3s;
}

.btn-main:hover {
    transform: translateY(-3px) scale(1.03);
    box-shadow: 0 12px 40px rgba(143,188,143,0.35);
}

.btn-main:hover span {
    transform: translateX(4px);
}

/* SUCCESS */
.alert-success-custom {
    background: #e6f4ea;
    color: #2e7d32;
    padding: 16px;
    border-radius: 12px;
    text-align: center;
    margin-bottom: 30px;
}

/* ANIMATION */
@keyframes fadeInUp {
    from { opacity: 0; transform: translateY(20px);}
    to { opacity: 1; transform: translateY(0);}
}

.contact-card {
    animation: fadeInUp 0.4s ease;
}

/* MOBILE */
@media (max-width: 768px) {
    .contact-grid {
        flex-direction: column;
    }

    .contact-header h1 {
        font-size: 32px;
    }
}
</style>

<!-- HEADER -->
<div class="contact-header">
    <div class="eyebrow">FLOWERMASTER</div>
    <h1>Свяжитесь с нами</h1>
    <p>Мы всегда готовы помочь и ответить на любые вопросы</p>
    <div class="header-line"></div>
</div>

% if success:
<div class="alert-success-custom">
    Сообщение успешно отправлено!
</div>
% end

<!-- GRID -->
<div class="contact-grid">

    <!-- INFO -->
    <div class="contact-card">

        <h3>Контактная информация</h3>

        <div class="contact-item">
            <div class="contact-icon"><img src="/static/images/map.png"></div>
            <div>
                <strong>Адрес</strong>
                <p>г. Москва, ул. Цветочная, 10</p>
            </div>
        </div>

        <div class="contact-item">
            <div class="contact-icon"><img src="/static/images/phone.png"></div>
            <div>
                <strong>Телефон</strong>
                <p>+7 (999) 123-45-67</p>
            </div>
        </div>

        <div class="contact-item">
            <div class="contact-icon"><img src="/static/images/message.png"></div>
            <div>
                <strong>Email</strong>
                <p>info@flowermaster.ru</p>
            </div>
        </div>

        <div class="contact-item">
            <div class="contact-icon"><img src="/static/images/time.png"></div>
            <div>
                <strong>Часы работы</strong>
                <p>Ежедневно с 9:00 до 21:00</p>
            </div>
        </div>

    </div>

    <!-- FORM -->
    <div class="contact-card">

        <h3>Напишите нам</h3>

        <form method="post" action="/contact" class="contact-form">

            <input type="text" name="name" placeholder="Например, Анна" required>
            <input type="email" name="email" placeholder="example@mail.com" required>
            <textarea name="message" rows="4" placeholder="Ваше сообщение..." required></textarea>

            <button type="submit" class="btn-main">
                Отправить <span>→</span>
            </button>

        </form>

    </div>

</div>

</div>