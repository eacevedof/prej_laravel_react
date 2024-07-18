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
	docker-compose down
	docker-compose up -d

destroy-all: ## destroy container and image
	docker-compose down --rmi all

ssh-apache: ## connect to container
	docker exec -it --user root cont-lr-apache bash

start:  ## start container
	docker-compose start

stop:   ## stop it
	docker-compose stop