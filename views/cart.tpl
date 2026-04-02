% rebase('layout.tpl', title='Корзина', year=year)

<!-- ДОБАВЬ ЭТО -->
<link rel="stylesheet" href="/static/content/cart.css">

</head>

<body>

<div class="body">

    <!-- HEADER -->
    <div class="cart-header">
        <div class="eyebrow">FLOWERMASTER</div>
        <h1>Ваша корзина</h1>
        <p>Проверьте выбранные букеты перед оформлением заказа</p>
        <div class="header-line"></div>
    </div>

    <div class="cart-grid">

        <!-- ITEMS -->
        <div class="cart-items">

            <!-- ITEM -->
            <div class="cart-item">

                <div class="cart-item-image">
                    <img src="/static/images/pink_roses.png" alt="Розовый букет">
                </div>

                <div class="cart-info">
                    <h3>Розовый букет</h3>
                    <p>Нежная композиция из роз</p>

                    <div class="cart-actions">
                        <button class="qty-btn" aria-label="Уменьшить">−</button>
                        <span class="qty">1</span>
                        <button class="qty-btn" aria-label="Увеличить">+</button>
                    </div>
                </div>

                <div class="cart-price">
                    <strong>2 500 ₽</strong>
                </div>

            </div>

            <!-- ITEM -->
            <div class="cart-item">

                <div class="cart-item-image">
                    <img src="/static/images/white_tulips.png" alt="Белые тюльпаны">
                </div>

                <div class="cart-info">
                    <h3>Белые тюльпаны</h3>
                    <p>Лёгкость и свежесть</p>

                    <div class="cart-actions">
                        <button class="qty-btn" aria-label="Уменьшить">−</button>
                        <span class="qty">2</span>
                        <button class="qty-btn" aria-label="Увеличить">+</button>
                    </div>
                </div>

                <div class="cart-price">
                    <strong>3 000 ₽</strong>
                </div>

            </div>

        </div>

        <!-- SUMMARY -->
        <div class="cart-summary">

            <h3>Итого</h3>

            <div class="summary-row">
                <span>Товары</span>
                <span>5 500 ₽</span>
            </div>

            <div class="summary-row">
                <span>Доставка</span>
                <span>300 ₽</span>
            </div>

            <div class="summary-total">
                5 800 ₽
            </div>

            <button class="btn-cart-contact">
                Оформить заказ <span>→</span>
            </button>

        </div>

    </div>

</div>
