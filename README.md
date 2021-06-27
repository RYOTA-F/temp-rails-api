## SET UP
1. git clone 
2. docker-compose build
3. docker-compose run web rails new . --force --detabase=mysql --skip-bundle --api
4. change ./config/database.yml
5. docker-compose up -d