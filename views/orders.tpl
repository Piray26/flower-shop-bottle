% rebase('layout.tpl', title='Оформленные заказы', year=year)
<link rel="stylesheet" href="/static/content/orders.css">

<div class="orders-page">
    <div class="orders-header">
        <h1>Оформленные заказы</h1>
        <p>Здесь вы можете просмотреть все заказы и добавить новый</p>
        <div class="header-line"></div>
    </div>

    <div class="orders-grid">
        <div class="orders-form">
            <h3>📝 Новый заказ</h3>
            <form method="post" class="order-form">
                <div class="form-group">
                    <label for="number">Номер заказа</label>
                    <input type="text" id="number" name="number" placeholder="Например, 100500" value="{{form_data.get('number', '')}}">
                    % if errors.get('number'):
                    <span class="error">{{errors['number']}}</span>
                    % end
                </div>

                <div class="form-group">
                    <label for="description">Описание заказа</label>
                    <textarea id="description" name="description" placeholder="Опишите состав букета...">{{form_data.get('description', '')}}</textarea>
                    % if errors.get('description'):
                    <span class="error">{{errors['description']}}</span>
                    % end
                </div>

                <div class="form-group">
                    <label for="phone">Телефон</label>
                    <input type="text" id="phone" name="phone" placeholder="+7(999)-999-99-99" value="{{form_data.get('phone', '')}}">
                    % if errors.get('phone'):
                    <span class="error">{{errors['phone']}}</span>
                    % end
                </div>

                <div class="form-group">
                    <label for="date">Дата заказа</label>
                    <input type="date" id="date" name="date" value="{{form_data.get('date', '')}}">
                    % if errors.get('date'):
                    <span class="error">{{errors['date']}}</span>
                    % end
                </div>

                <button type="submit" class="btn-submit">Разместить заказ</button>
            </form>
        </div>

        <div class="orders-list">
            <h3>📋 Последние заказы</h3>
            % if not orders:
            <div class="empty-state">
                <p>Заказов пока нет. Станьте первым! 🌸</p>
            </div>
            % else:
                % for order in orders:
                <div class="order-card">
                    <div class="order-header">
                        <span class="order-number">Заказ № {{order['number']}}</span>
                        <span class="order-date">{{order['date']}}</span>
                    </div>
                    <div class="order-body">
                        <p><strong>Описание:</strong> <span>{{order['description']}}</span></p>
                        <p><strong>Телефон:</strong> <span>{{order['phone']}}</span></p>
                    </div>
                </div>
                % end
            % end
        </div>
    </div>
</div>