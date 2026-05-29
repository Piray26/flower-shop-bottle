% rebase('layout.tpl', title='Корзина', year=year)

<link rel="stylesheet" href="/static/content/cart.css">

</head>
<body>

<div class="body">

    <div class="cart-header">
        <h1>Ваша корзина</h1>

        <p>
            Проверьте выбранные букеты перед оформлением заказа
        </p>

        <div class="cart-line"></div>
    </div>

    <div class="cart-grid">

        <!-- ТОВАРЫ -->
        <div class="cart-items">

            % if items:

                % for item in items:

                <div class="cart-item">

                    <!-- КАРТИНКА -->
                    <div class="cart-item-image">

                        % if item.get('image'):

                            <img src="/static/images/{{ item['image'] }}"
                                 alt="{{ item['name'] }}">

                        % else:

                            <div class="custom-bouquet-placeholder">

                                Авторский<br>букет

                            </div>

                        % end

                    </div>


                    <!-- ИНФОРМАЦИЯ -->
                    <div class="cart-info">

                        <p>
                            {{ item.get('description', '') }}
                        </p>

                        <div class="cart-actions">

                            <!-- МИНУС -->
                            <a class="qty-btn"
                               href="/decrease/{{ item['id'] }}">
                                −
                            </a>

                            <!-- КОЛИЧЕСТВО -->
                            <span class="qty">
                                {{ item['qty'] }}
                            </span>

                            <!-- ПЛЮС -->
                            <a class="qty-btn"
                               href="/increase/{{ item['id'] }}">
                                +
                            </a>

                        </div>

                    </div>

                    <!-- ЦЕНА -->
                    <div class="cart-price">

                        <strong>
                            {{ item['price'] * item['qty'] }} ₽
                        </strong>

                    </div>

                </div>

                % end

            % else:

                <div class="empty-cart">

                    <h3>Корзина пуста</h3>

                    <p>
                        Добавьте букеты из каталога
                    </p>

                </div>

            % end

        </div>

        <!-- БЛОК ИТОГО -->
        <div class="cart-summary">

            <h3>Итого</h3>

            <div class="summary-row">

                <span>Товары</span>

                <span>{{ total }} ₽</span>

            </div>

            <div class="summary-row">

                <span>Доставка</span>

                <span>
                    % if total > 0:
                        300 ₽
                    % else:
                        0 ₽
                    % end
                </span>

            </div>

            <div class="summary-total">

                % if total > 0:

                    {{ total + 300 }} ₽

                % else:

                    0 ₽

                % end

            </div>

            % if items:

            <a href="/checkout"
               class="btn-cart-contact">

                Оформить заказ
                <span>→</span>

            </a>

            % else:

            <button class="btn-cart-contact disabled"
                    disabled>

                Корзина пуста

            </button>

            % end

        </div>

    </div>

</div>

</body>
</html>