<div class="container cart-page">

<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap');

:root {
  --primary: #8fbc8f;
  --text-primary: #333;
  --text-secondary: #666;
  --text-muted: #888;
  --bg-light: #fdfdfd;
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
.cart-page::before {
    content: "";
    position: fixed;
    inset: 0;
    background: url('/static/images/petals.png') center/cover no-repeat;
    opacity: 0.16;
    z-index: -1;
}

/* ОБЩЕЕ */
.cart-page {
    padding: 40px 20px;
    font-family: 'Montserrat', sans-serif;
    color: var(--text-primary);
}

/* HEADER */
.cart-header {
    text-align: center;
    margin-bottom: var(--space-xl);
}

.cart-header .eyebrow {
    text-transform: uppercase;
    font-size: 12px;
    letter-spacing: 2px;
    color: var(--text-muted);
    margin-bottom: 10px;
}

.cart-header h1 {
    font-size: 52px;
    font-weight: 700;
    margin-bottom: 12px;
}

.cart-header p {
    font-size: 18px;
    color: var(--text-secondary);
    line-height: 1.6;
}

.cart-line {
    width: 60px;
    height: 3px;
    background: var(--primary);
    margin: 20px auto 0;
    border-radius: 2px;
}

/* GRID */
.cart-grid {
    display: flex;
    gap: 48px;
    flex-wrap: wrap;
}

/* ITEMS */
.cart-items {
    flex: 2;
    min-width: 300px;
}

.cart-item {
    position: relative;
    display: flex;
    gap: 24px;
    background: white;
    padding: 30px;
    border-radius: 20px;
    margin-bottom: 24px;
    box-shadow: 0 4px 20px var(--shadow);
    transition: 0.3s cubic-bezier(0.4,0,0.2,1);
    animation: fadeInUp 0.3s ease forwards;
}

.cart-item:nth-child(2) { animation-delay: 0.1s; }
.cart-item:nth-child(3) { animation-delay: 0.2s; }

.cart-item::before {
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

.cart-item:hover {
    transform: translateY(-6px);
    box-shadow: 0 12px 40px var(--shadow-hover);
}

.cart-item:hover::before {
    opacity: 1;
}

.cart-item:hover img {
    filter: brightness(1.05);
}

/* IMAGE */
.cart-item img {
    width: 120px;
    height: 120px;
    object-fit: cover;
    border-radius: 16px;
}

/* INFO */
.cart-info {
    flex: 1;
}

.cart-info h3 {
    margin-bottom: 6px;
    font-weight: 600;
}

.cart-info p {
    color: var(--text-secondary);
    margin-bottom: 14px;
    line-height: 1.6;
}

/* ACTIONS */
.cart-actions {
    display: flex;
    align-items: center;
    gap: 14px;
}

.qty-btn {
    width: 36px;
    height: 36px;
    border-radius: 50%;
    border: none;
    background: #f2f2f2;
    cursor: pointer;
    transition: 0.3s;
}

.qty-btn:hover {
    background: var(--primary);
    color: white;
    box-shadow: 0 4px 12px rgba(143,188,143,0.3);
}

.qty-btn:focus {
    outline: 3px solid rgba(143,188,143,0.6);
    outline-offset: 2px;
}

.qty {
    font-weight: 600;
}

/* PRICE */
.cart-price {
    text-align: right;
    min-width: 120px;
}

.cart-price strong {
    font-size: 18px;
    font-weight: 700;
    color: var(--primary);
}

/* SUMMARY */
.cart-summary {
    flex: 1;
    min-width: 280px;
    background: linear-gradient(135deg, var(--bg-gradient-start), var(--bg-gradient-end));
    padding: 40px;
    border-radius: 20px;
    box-shadow: 0 4px 20px var(--shadow);
    position: sticky;
    top: 90px;
    height: fit-content;
}

.cart-summary h3 {
    font-size: 24px;
    margin-bottom: 20px;
    border-bottom: 2px solid rgba(143,188,143,0.2);
    padding-bottom: 8px;
}

.summary-row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 12px;
    color: var(--text-secondary);
}

.summary-total {
    font-size: 20px;
    font-weight: 700;
    margin-top: 24px;
}

/* BUTTON */
.btn-main {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    width: 100%;
    margin-top: var(--space-md);
    padding: 18px 36px;
    border-radius: 28px;
    background: var(--primary);
    color: white;
    border: none;
    font-size: 16px;
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

.btn-main:focus {
    outline: 3px solid rgba(143,188,143,0.6);
}

/* ANIMATION */
@keyframes fadeInUp {
    from { opacity: 0; transform: translateY(20px);}
    to { opacity: 1; transform: translateY(0);}
}

/* MOBILE */
@media (max-width: 768px) {
    .cart-grid {
        flex-direction: column;
    }

    .cart-summary {
        position: static;
    }

    .cart-item {
        padding: 20px;
    }

    .cart-item img {
        width: 100px;
        height: 100px;
    }

    .cart-header h1 {
        font-size: 32px;
    }

    .btn-main {
        width: 100%;
    }
}

@media (max-width: 480px) {
    .cart-item {
        padding: 16px;
    }

    .qty-btn {
        width: 32px;
        height: 32px;
    }
}
</style>

<!-- HEADER -->
<div class="cart-header">
    <div class="eyebrow">FLOWERMASTER</div>
    <h1>Ваша корзина</h1>
    <p>Проверьте выбранные букеты перед оформлением заказа</p>
    <div class="cart-line"></div>
</div>

<div class="cart-grid">

    <!-- ITEMS -->
    <div class="cart-items">

        <div class="cart-item">
            <img src="/static/images/pink_roses.png">

            <div class="cart-info">
                <h3>Розовый букет</h3>
                <p>Нежная композиция из роз</p>

                <div class="cart-actions">
                    <button class="qty-btn" aria-label="Уменьшить">-</button>
                    <span class="qty">1</span>
                    <button class="qty-btn" aria-label="Увеличить">+</button>
                </div>
            </div>

            <div class="cart-price">
                <strong>2 500 ₽</strong>
            </div>
        </div>

        <div class="cart-item">
            <img src="/static/images/white_tulips.png">

            <div class="cart-info">
                <h3>Белые тюльпаны</h3>
                <p>Лёгкость и свежесть</p>

                <div class="cart-actions">
                    <button class="qty-btn" aria-label="Уменьшить">-</button>
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

        <button class="btn-main">
            Оформить заказ <span>→</span>
        </button>
    </div>

</div>

</div>