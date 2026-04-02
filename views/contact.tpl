% rebase('layout.tpl', title='О нас', year=year)

<!-- ДОБАВЬ ЭТО -->
<link rel="stylesheet" href="/static/content/contact.css">

</head>

<body>

<div class="container contact-page">

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
