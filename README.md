# Dert

## Development

### Dependencies:

- Docker (incl. Docker Compose, which already part of Docker for Mac and Docker Toolbox)

### Setup
```
cp .env-example .env
```

Build the containers:
```
docker-compose build
```

Start up all of the containers:
```
docker-compose up
```

Visit http://localhost:3000

### Install new dependencies

Add the dependency to the Gemfile and run:
```
docker-compose run web bundle
```

Followed by:
```
docker-compose build
```

### Database

Create:
```
docker-compose run web bin/rails db:create
```

Migrations:

After adding any new migrations they need to be run inside docker:
```
docker-compose run web bin/rails db:migrate
```

Seed:
```
docker-compose run web bin/rails db:seed
```

## Testing

Uses [rspec](https://github.com/rspec/rspec)
```
docker-compose run web bin/rspec
```

To use [guard](https://github.com/guard/guard) to watch the tests:
```
docker-compose run web bin/guard
```