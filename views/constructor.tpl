% rebase('layout.tpl', title='Конструктор', year=year)

<div class="hero">
    <h1>Собери свой идеальный букет</h1>
    <p class="lead">Кликай по цветам, чтобы добавить их в букет.</p>
</div>

<div class="constructor-container">
    
    <div class="options">
        <h3>1. Выберите цветы</h3>
        <div class="flowers-selection">
            <div class="flower-card" onclick="addFlower('/static/images/rose1.png', 150)">
                <img src="/static/images/rose1.png" alt="Роза">
                <p>Роза<br><b>150 ₽</b></p>
            </div>
            
            <div class="flower-card" onclick="addFlower('/static/images/tulip.png', 100)">
                <img src="/static/images/tulip.png" alt="Тюльпан">
                <p>Тюльпан<br><b>100 ₽</b></p>
            </div>

            <div class="flower-card" onclick="addFlower('/static/images/peony.png', 350)">
                <img src="/static/images/peony.png" alt="Пион">
                <p>Пион<br><b>350 ₽</b></p>
            </div>
        </div>

        <button class="btn-cancel" onclick="removeLastFlower()">
            ↩ Отменить последний цветок
        </button>

        <h3>2. Оформление</h3>
        <select id="packaging" class="packaging-select">
            <option value="0" data-img="/static/images/wrap_none.png">Без упаковки (0 ₽)</option>
            <option value="250" data-img="/static/images/wrap_craft.png">Крафтовая бумага (250 ₽)</option>
        </select>
    </div>

    <div class="preview-area">
        <div class="bouquet-preview">
            <div id="flowers-layer"></div>
            <img id="wrapper-layer" src="/static/images/wrap_none.png" alt="Упаковка" style="display: none;">
        </div>

        <div class="summary product-card">
            <h3>Итого к оплате:</h3>
            <h2 id="total-price">0 ₽</h2>
            
            <button class="btn" onclick="addToCart()" style="width: 100%;">В корзину</button>
        </div>
    </div>
</div>

<script src="/static/scripts/constructor.js"></script>