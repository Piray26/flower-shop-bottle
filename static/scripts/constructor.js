
// Состояние приложения
let flowersData = []; 
let flowersPriceSum = 0; 

// Основные элементы
const flowersLayer = document.getElementById('flowers-layer');
const packagingSelect = document.getElementById('packaging');
const wrapperLayer = document.getElementById('wrapper-layer');
const totalPriceText = document.getElementById('total-price');

// 1. Смена упаковки
packagingSelect.addEventListener('change', function() {
    const imgSrc = this.options[this.selectedIndex].getAttribute('data-img');
    if (imgSrc) {
        wrapperLayer.src = imgSrc;
        wrapperLayer.style.display = 'block';
    } else {
        wrapperLayer.style.display = 'none';
    }
    updateView();
});

// 2. Добавление цветка
function addFlower(imgSrc, price) {
    const img = document.createElement('img');
    img.src = imgSrc;
    
    // позиционирование
    img.style.position = 'absolute';
    img.style.bottom = '0';
    img.style.left = '50%';
    img.style.width = '140px'; 
    img.style.transformOrigin = 'bottom center';
    
    flowersLayer.appendChild(img);
    flowersData.push({ element: img, price: price });
    flowersPriceSum += price;

    updateView();
}

// 3. Удаление последнего
function removeLastFlower() {
    if (flowersData.length === 0) return;
    const lastFlower = flowersData.pop();
    flowersLayer.removeChild(lastFlower.element);
    flowersPriceSum -= lastFlower.price;
    
    updateView();
}

// 4. Обновление интерфейса (Без анимаций)
function updateView() {
    // Пересчет цены
    const packPrice = parseInt(packagingSelect.value) || 0;
    totalPriceText.innerText = (flowersPriceSum + packPrice) + ' ₽';

    // Простая раскладка веером
    const count = flowersData.length;
    if (count === 0) return;

    const startAngle = -40; // Крайний левый угол
    const angleStep = count > 1 ? 80 / (count - 1) : 0;

    flowersData.forEach((flower, index) => {
        const angle = count === 1 ? 0 : startAngle + (angleStep * index);
        flower.element.style.transform = `translateX(-50%) rotate(${angle}deg)`;
    });
}

// 5. Кнопка "В корзину" (теперь просто показывает сообщение)
function addToCart() {
    if (flowersData.length === 0) {
        alert('Сначала добавьте хотя бы один цветок!');
        return;
    }
    alert('Букет на сумму ' + totalPriceText.innerText + ' добавлен в корзину!');
}