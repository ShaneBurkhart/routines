BASE_TAG=shaneburkhart/routines

COMPOSE_FILE?=docker-compose.dev.yml
export COMPOSE_FILE

all: dev

build:
	docker build -t ${BASE_TAG} .
	docker build -f Dockerfile.dev -t ${BASE_TAG}:dev .
	#docker push ${BASE_TAG}

dev:
	docker-compose -f docker-compose.dev.yml up -d

stop:
	docker stop $$(docker ps -q)

clean: stop
	docker rm $$(docker ps -aq)

logs:
	docker-compose logs

pg:
	echo "Enter 'postgres'..."
	docker-compose run --rm pg psql -h pg -d mydb -U postgres --password

c:
	docker-compose run --rm web /bin/bash

ps:
	docker-compose ps
