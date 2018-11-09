# triunfei-v2

## Getting running

### Using Docker

#### Setup

```
docker-compose build
docker-compose run web bash
yarn install
rails db:create
rails db:migrate
rails db:seed
exit
```

#### Run

```
docker-compose up
```

#### Access the web container

To open a shell inside web docker container

```
docker-compose run web bash
```

To execute a command inside a already running container

```
docker-compose exec web rails c
```

#### Tests

```
docker-compose run test
```