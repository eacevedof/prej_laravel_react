#!/bin/bash
TODAY := $(shell date +'%Y-%m-%d')
CURRENT_BRANCH := $(shell git rev-parse --abbrev-ref HEAD)

help: ## Show this help message
	@echo "usage: make [target]"
	@echo
	@echo "targets:"
	@egrep "^(.+)\:\ ##\ (.+)" ${MAKEFILE_LIST} | column -t -c 2 -s ":#"

gitpush: ## git push m=any message
	clear;
	git add .; git commit -m "$(m)"; git push;

rebuild: ## rebuild apache
	clear
	docker-compose down
	docker-compose -f docker-compose.yml up -d --build --remove-orphans
	docker ps

destroy-all: ## destroy container and image
	docker-compose down --rmi all

ssh-apache: ## connect to container
	docker exec -it --user root cont-lr-apache bash

ssh-mariadb: ## connect to container
	docker exec -it --user root cont-lr-mariadb bash

start:  ## start container
	docker-compose start

stop:   ## stop it
	docker-compose stop
	
artisan-migrate: ## artisan-migrate t=oqotech
	clear;
	docker exec -it cont-lr-apache sh -c "cd /var/www/lr-app && php artisan cache:clear && php artisan migrate --force"