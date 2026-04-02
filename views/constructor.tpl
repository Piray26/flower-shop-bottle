% rebase('layout.tpl', title='Конструктор', year=year)

<div class="hero">
    <h2>Собери свой идеальный букет</h2>
    <p class="lead">Кликай по цветам, чтобы добавить их в букет. Размер пересчитается автоматически!</p>
</div>

<div class="constructor-container" style="display: flex; gap: 30px; flex-wrap: wrap; margin-bottom: 40px;">
    
    <div class="options" style="flex: 2; min-width: 300px;">
        
        <h3>1. Выберите цветы</h3>
        <div class="flowers-selection" style="display: flex; gap: 15px; flex-wrap: wrap; margin-bottom: 25px;">
            <div class="flower-card" onclick="addFlower('/static/images/rose.png', 150)" style="cursor: pointer; background: white; border: 1px solid #eaeaea; padding: 15px; border-radius: 15px; text-align: center; width: 110px; transition: 0.2s; box-shadow: 0 2px 10px rgba(0,0,0,0.05);">
                <img src="/static/images/rose.png" alt="Роза" style="width: 60px; height: 60px; object-fit: contain;">
                <p style="margin: 10px 0 0; font-size: 14px; color: #4a4a4a;">Роза<br><b style="color: #8fbc8f;">150 ₽</b></p>
            </div>
            
            <div class="flower-card" onclick="addFlower('/static/images/tulip.png', 100)" style="cursor: pointer; background: white; border: 1px solid #eaeaea; padding: 15px; border-radius: 15px; text-align: center; width: 110px; transition: 0.2s; box-shadow: 0 2px 10px rgba(0,0,0,0.05);">
                <img src="/static/images/tulip.png" alt="Тюльпан" style="width: 60px; height: 60px; object-fit: contain;">
                <p style="margin: 10px 0 0; font-size: 14px; color: #4a4a4a;">Тюльпан<br><b style="color: #8fbc8f;">100 ₽</b></p>
            </div>

            <div class="flower-card" onclick="addFlower('/static/images/peony.png', 350)" style="cursor: pointer; background: white; border: 1px solid #eaeaea; padding: 15px; border-radius: 15px; text-align: center; width: 110px; transition: 0.2s; box-shadow: 0 2px 10px rgba(0,0,0,0.05);">
                <img src="/static/images/peony.png" alt="Пион" style="width: 60px; height: 60px; object-fit: contain;">
                <p style="margin: 10px 0 0; font-size: 14px; color: #4a4a4a;">Пион<br><b style="color: #8fbc8f;">350 ₽</b></p>
            </div>
        </div>

        <button onclick="removeLastFlower()" style="background: #ff6b6b; color: white; border: none; padding: 8px 15px; border-radius: 10px; margin-bottom: 25px; cursor: pointer;">
            ↩ Отменить последний цветок
        </button>

        <h3>2. Оформление</h3>
        <select id="packaging" style="width: 100%; max-width: 360px; padding: 12px; border-radius: 10px; border: 1px solid #ccc; font-family: 'Montserrat', sans-serif;">
            <option value="0" data-img="/static/images/wrap_none.png">Без упаковки (0 ₽)</option>
            <option value="250" data-img="/static/images/wrap_craft.png">Крафтовая бумага (250 ₽)</option>
            <option value="600" data-img="/static/images/wrap_box.png">Шляпная коробка (600 ₽)</option>
        </select>
    </div>

    <div style="flex: 1; min-width: 320px; display: flex; flex-direction: column; align-items: center;">
        
        <div class="bouquet-preview" style="position: relative; width: 100%; max-width: 350px; height: 400px; background: white; border-radius: 20px; box-shadow: 0 4px 20px rgba(0,0,0,0.06); overflow: hidden; margin-bottom: 20px;">
            <div id="flowers-layer" style="position: absolute; bottom: 120px; left: 0; width: 100%; height: 250px; z-index: 2;">
                </div>
            <img id="wrapper-layer" src="/static/images/wrap_none.png" style="position: absolute; bottom: -10px; left: 0; width: 100%; height: 220px; object-fit: contain; z-index: 3; transition: 0.3s pointer-events: none;">
        </div>

        <div class="summary product-card" style="width: 100%; max-width: 350px; padding: 25px; box-sizing: border-box;">
            <h3 style="margin-top: 0; color: #4a4a4a;">Итого к оплате:</h3>
            <h2 id="total-price" style="color: #8fbc8f; font-weight: 700; margin-bottom: 20px;">0 ₽</h2>
            
            <form action="/order_constructor" method="POST" id="order-form">
                <input type="hidden" name="total_sum" id="hidden-total" value="0">
                <input type="hidden" name="flowers_count" id="hidden-count" value="0">
                <button type="button" class="btn-buy" onclick="submitOrder()">Оформить заказ</button>
            </form>
        </div>

    </div>
</div>

<script>
    // Состояние нашего приложения
    let flowersData = []; 
    let flowersPriceSum = 0; 

    // Элементы DOM 
    const flowersLayer = document.getElementById('flowers-layer');
    const packagingSelect = document.getElementById('packaging');
    const wrapperLayer = document.getElementById('wrapper-layer');
    const totalPriceText = document.getElementById('total-price');

    // --- ОБНОВЛЕННЫЕ НАСТРОЙКИ ---
    const bouquetSettings = {
        fanAngle: 90, // Общий угол веера 
        baseY: 100,   // Опустили на 100% (в самый низ слоя, чтобы спрятать за бумагу)
        yVariation: 0 // Убрали рандом — теперь все цветы идеально на одной высоте
    };

    // 1. Смена упаковки
    packagingSelect.addEventListener('change', function() {
        const selectedOption = this.options[this.selectedIndex];
        wrapperLayer.src = selectedOption.getAttribute('data-img');
        updateView();
    });

    // 2. Добавление цветка на сцену 
    function addFlower(imgSrc, price) {
        const img = document.createElement('img');
        img.src = imgSrc;
        img.className = 'bouquet-item';
        
        // Строго по центру
        img.style.left = '50%';
        
        // Строго на одной высоте, без случайных скачков
        img.style.top = bouquetSettings.baseY + '%';
        
        // Точка вращения - низ картинки (корень стебля)
        img.style.transformOrigin = '50% 100%'; 

        // Изначальная позиция
        img.style.transform = 'translate(-50%, -100%) rotate(0deg)';
        img.style.position = 'absolute';
        img.style.transition = 'width 0.3s ease, transform 0.3s ease-out';
        
        flowersLayer.appendChild(img);
        
        flowersData.push({ element: img, price: price });
        flowersPriceSum += price;

        updateView();
    }

    // 3. Отмена последнего действия 
    function removeLastFlower() {
        if (flowersData.length === 0) return;
        const lastFlower = flowersData.pop();
        flowersLayer.removeChild(lastFlower.element);
        flowersPriceSum -= lastFlower.price;
        updateView();
    }

    // 4. Обновление визуальной части и расчетов
    function updateView() {
        const packPrice = parseInt(packagingSelect.value) || 0;
        const finalTotal = flowersPriceSum + packPrice;
        
        totalPriceText.innerText = finalTotal + ' ₽';
        document.getElementById('hidden-total').value = finalTotal;
        document.getElementById('hidden-count').value = flowersData.length;

        recalculateSizes();
        recalculateFan();
    }

    // 5. Алгоритм автомасштабирования 
    function recalculateSizes() {
        const count = flowersData.length;
        if (count === 0) return;

        let targetSize = 140 - (count * 1.5);
        if (targetSize < 55) targetSize = 55; 

        flowersData.forEach(flower => {
            flower.element.style.width = targetSize + 'px';
            flower.element.style.height = 'auto';
        });
    }

    // 6. Алгоритм перестроения веера
    function recalculateFan() {
        const count = flowersData.length;
        if (count === 0) return;

        if (count === 1) {
            flowersData[0].element.style.transform = 'translate(-50%, -100%) rotate(0deg)';
            return;
        }

        const angleStep = bouquetSettings.fanAngle / (count - 1);
        const startAngle = -(bouquetSettings.fanAngle / 2);

        flowersData.forEach((flower, index) => {
            const currentAngle = startAngle + (angleStep * index);
            flower.element.style.transform = `translate(-50%, -100%) rotate(${currentAngle}deg)`;
        });
    }

    // 7. Отправка заказа 
    function submitOrder() {
        if (flowersData.length === 0) {
            alert('Сначала добавьте хотя бы один цветок!');
            return;
        }
        document.getElementById('order-form').submit();
    }
</script>