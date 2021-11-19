include ../.devstack/Makefile
DOCKER_COMPOSE = docker-compose -f docker-compose.yml

install: install-stack ## Install dependencies
	-cp -n .env.dist .env
	${DOCKER_COMPOSE} build
	${DOCKER_COMPOSE} run --no-deps --rm admin npm install

start: start-stack ## Start the application
	${DOCKER_COMPOSE} up -d

stop: ## Stop the application
	${DOCKER_COMPOSE} down
	$(MAKE) stop-stack

logs: ## Display the containers logs
	${DOCKER_COMPOSE} logs -f

db-migrate: ## Migrate database schema
	${DOCKER_COMPOSE} exec api bin/rails db:migrate

db-rollback: ## Rollback database schema migration
	${DOCKER_COMPOSE} exec api bin/rails db:rollback

connect: ## Connect to api service
	${DOCKER_COMPOSE} exec api bash
