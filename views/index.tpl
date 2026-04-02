% rebase('layout.tpl', title='Главная', year=year)

<div class="hero">
    <h1>Свежесть в каждом букете</h1>
    <p>Выберите готовое решение от наших флористов или соберите свой уникальный букет.</p>
</div>

<div class="catalog-grid">
    % for b in bouquets:
    <div class="product-card">
        <img class="product-image" src="/static/images/{{ b['image'] }}" alt="{{ b['name'] }}">
        <div class="product-info">
            <h3>{{ b['name'] }}</h3>
            <p>{{ b['desc'] }}</p>
            <p><strong>{{ b['price'] }} ₽</strong></p>
            <button class="btn" onclick="alert('Добавлено!')">В корзину</button>
        </div>
    </div>
    % end
</div>