## SET UP
1. クローン

```
git clone https://github.com/RyotaFujishima/temp-rails-api.git
```

2. イメージをビルド

```
docker-compose build
```

3. APIモードでアプリを作成

```
docker-compose run web rails new . --force --detabase=mysql --skip-bundle --api
```

4. DB設定を変更
config/database.yml

```
default: &default
  adapter: sqlite3
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  password: password
  timeout: 5000
  host: db
```

5. コンテナを起動

```
docker-compose up -d
```

6. DBを作成

```
docker-compose run web rails db:create
```

7. ルーティング名前空間を設定
config/routes.rb

```
Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :posts
    end
  end
end
```

## Versions
- mysql: 5.7
- rails: 5.2.2