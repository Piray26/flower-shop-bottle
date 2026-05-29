% rebase('layout.tpl', title='О нас', year=year)

<link rel="stylesheet" href="/static/content/contact.css">

</head>

<body>

<div class="contact-page">

    <div class="contact-header">

        <h1>Свяжитесь с нами</h1>

        <p>
            Мы всегда готовы помочь и ответить на любые вопросы
        </p>

        <div class="header-line"></div>

    </div>

    % if success:

        <div class="success-message">
            {{ success }}
        </div>

    % end

    <div class="contact-grid">

        <div class="contact-card">

            <h3>Контактная информация</h3>

            <div class="contact-item">

                <div class="contact-icon">
                    <img src="/static/images/map.png">
                </div>

                <div>

                    <strong>Адрес</strong>

                    <p>г. Москва, ул. Цветочная, 10</p>

                </div>

            </div>

            <div class="contact-item">

                <div class="contact-icon">
                    <img src="/static/images/phone.png">
                </div>

                <div>

                    <strong>Телефон</strong>

                    <p>+7 (999) 123-45-67</p>

                </div>

            </div>

            <div class="contact-item">

                <div class="contact-icon">
                    <img src="/static/images/message.png">
                </div>

                <div>

                    <strong>Email</strong>

                    <p>info@flowermaster.ru</p>

                </div>

            </div>

            <div class="contact-item">

                <div class="contact-icon">
                    <img src="/static/images/time.png">
                </div>

                <div>

                    <strong>Часы работы</strong>

                    <p>Ежедневно с 9:00 до 21:00</p>

                </div>

            </div>

        </div>

        <div class="contact-card">

            <h3>Напишите нам</h3>

            <form method="post"
                  action="/contact"
                  class="contact-form">

                <div class="form-group">

                    <input type="text"
                           name="name"
                           placeholder="Например, Анна"
                           value="{{ form_data.get('name', '') }}">

                    % if errors.get('name'):

                        <div class="error">
                            {{ errors['name'] }}
                        </div>

                    % end

                </div>

                <div class="form-group">

                    <input type="email"
                           name="email"
                           placeholder="example@mail.com"
                           value="{{ form_data.get('email', '') }}">

                    % if errors.get('email'):

                        <div class="error">
                            {{ errors['email'] }}
                        </div>

                    % end

                </div>

                <div class="form-group">

                    <textarea name="message"
                              rows="4"
                              placeholder="Ваше сообщение...">{{ form_data.get('message', '') }}</textarea>

                    % if errors.get('message'):

                        <div class="error">
                            {{ errors['message'] }}
                        </div>

                    % end

                </div>

                <button type="submit"
                        class="btn-cart-contact">

                    Отправить
                    <span>→</span>

                </button>

            </form>

        </div>

    </div>

</div>

</body>
</html>