# Demo


https://github.com/user-attachments/assets/6e199fc0-a547-4f49-9e2d-2e368229502e



# Docker commands

## Mount the app

```
docker-compose up --build -d
```

## setup the dbs

```
docker-compose exec app rails db:create
```

## run the migrations

```
docker-compose exec app rails db:migrate
```

## run the server

```
docker-compose exec app ./bin/dev -b 0.0.0.0
```

## connect to the shell

```
docker-compose exec app /bin/bash
```
