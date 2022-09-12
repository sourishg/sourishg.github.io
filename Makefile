# build docker image
build:
	docker-compose build

start:build
	docker-compose up --force-recreate

stop: 
	docker-compose stop

# run jekyll build inside container to update on the go
rebuild:
	docker-compose exec jekyll build --incremental --watch