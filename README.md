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