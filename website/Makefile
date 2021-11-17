DOCKER_COMPOSE = docker-compose -f docker-compose.yml

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Install dependencies
	-cp -n .env.dist .env
	${DOCKER_COMPOSE} run --no-deps --rm website npm install

start: network-start ## Start the application
	${DOCKER_COMPOSE} up -d

stop: ## Stop the application
	${DOCKER_COMPOSE} down
	$(MAKE) network-stop

logs: ## Display the containers logs
	${DOCKER_COMPOSE} logs -f

connect: ## Connect to api service
	${DOCKER_COMPOSE} exec website bash

network-start: ## Start global project network (will be joined by other projects)
	@docker network inspect userbooknet >/dev/null 2>&1 || docker network create userbooknet

network-stop: ## Stop global project network
	@docker network rm userbooknet >/dev/null 2>&1 || echo "userbooknet is used by another project"
