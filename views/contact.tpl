
<div class="container mt-5">

    <div class="text-center mb-5 p-4" style="background-color: #f3eaea; border-radius: 20px;">
        <h1>Контакты</h1>
        <p class="text-muted">Свяжитесь с нами любым удобным способом</p>
    </div>

    % if success:
    <div class="alert alert-success text-center">
        Сообщение успешно отправлено!
    </div>
    % end

    <div class="catalog-grid">

        <!-- Левая карточка -->
        <div class="product-card">
            <div class="product-info">

                <h3>Наш адрес</h3>
                <p class="text-muted">г. Москва, ул. Цветочная, 10</p>

                <h3>Телефон</h3>
                <p class="text-muted">+7 (999) 123-45-67</p>

                <h3>Email</h3>
                <p class="text-muted">info@flowermaster.ru</p>

                <h3>Часы работы</h3>
                <p class="text-muted">Ежедневно с 9:00 до 21:00</p>

            </div>
        </div>

        <!-- Правая карточка -->
        <div class="product-card">
            <div class="product-info">

                <h3>Напишите нам</h3>

                <form method="post" action="/contact">

                    <div class="mb-3">
                        <input type="text" name="name" class="form-control" placeholder="Ваше имя" required>
                    </div>

                    <div class="mb-3">
                        <input type="email" name="email" class="form-control" placeholder="Email" required>
                    </div>

                    <div class="mb-3">
                        <textarea name="message" class="form-control" rows="4" placeholder="Сообщение" required></textarea>
                    </div>

                    <button type="submit" class="btn-buy">
                        Отправить
                    </button>

                </form>

            </div>
        </div>

    </div>

</div>