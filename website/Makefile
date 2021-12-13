include ../.devstack/Makefile
DOCKER_COMPOSE = docker-compose -f docker-compose.yml

install: install-stack ## Install dependencies
	-cp -n .env.dist .env
	@REVERSE_PROXY_IP=${REVERSE_PROXY_IP} \
	${DOCKER_COMPOSE} run --no-deps --rm website npm install

start: start-stack ## Start the application
	@REVERSE_PROXY_IP=${REVERSE_PROXY_IP} \
	${DOCKER_COMPOSE} up -d

stop: ## Stop the application
	${DOCKER_COMPOSE} down
	$(MAKE) stop-stack

logs: ## Display the containers logs
	${DOCKER_COMPOSE} logs -f

connect: ## Connect to api service
	${DOCKER_COMPOSE} exec website bash
