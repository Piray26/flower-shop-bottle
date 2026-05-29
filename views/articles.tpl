% rebase('layout.tpl', title='Полезные статьи', year=year)
<link rel="stylesheet" href="/static/content/articles.css">

<div class="articles-page">
    <div class="articles-header">
        <h1>Полезные статьи</h1>
        <p>Читайте актуальные материалы о цветах и добавляйте свои статьи.</p>
        <div class="header-line"></div>
    </div>

    <div class="articles-grid">
        <div class="articles-form">
            <h3>Новая статья</h3>
            <form method="post" accept-charset="UTF-8" class="article-form">
                <div class="form-group">
                    <label for="author">Автор</label>
                    <input type="text" id="author" name="author" placeholder="Например, Анна" value="{{form_data.get('author', '')}}">
                    % if errors.get('author'):
                    <span class="error">{{errors['author']}}</span>
                    % end
                </div>

                <div class="form-group">
                    <label for="title">Название статьи</label>
                    <input type="text" id="title" name="title" placeholder="Короткий и понятный заголовок" value="{{form_data.get('title', '')}}">
                    % if errors.get('title'):
                    <span class="error">{{errors['title']}}</span>
                    % end
                </div>

                <div class="form-group">
                    <label for="description">Описание</label>
                    <textarea id="description" name="description" placeholder="Основная мысль статьи...">{{form_data.get('description', '')}}</textarea>
                    % if errors.get('description'):
                    <span class="error">{{errors['description']}}</span>
                    % end
                </div>

                <div class="form-group">
                    <label for="phone">Телефон (необязательно)</label>
                    <input type="text" id="phone" name="phone" placeholder="+7(999)-222-56-89" value="{{form_data.get('phone', '')}}">
                    % if errors.get('phone'):
                    <span class="error">{{errors['phone']}}</span>
                    % end
                </div>

                <button type="submit" class="btn-submit">Разместить статью</button>
            </form>
        </div>

        <div class="articles-list">
            <h3>Последние публикации</h3>
            % if not articles:
            <div class="empty-state">
                <p>Пока нет статей. Будьте первым автором.</p>
            </div>
            % else:
                % for article in articles:
                <div class="article-card">
                    <div class="article-header">
                        <span class="article-title">{{article['title']}}</span>
                        <span class="article-phone">{{article.get('phone', 'Телефон не указан')}}</span>
                    </div>
                    <div class="article-body">
                        <p><strong>Автор:</strong> <span>{{article['author']}}</span></p>
                        <p><strong>Описание:</strong> <span>{{article['description']}}</span></p>
                    </div>
                </div>
                % end
            % end
        </div>
    </div>
</div>
