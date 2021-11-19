.DEFAULT_GOAL := help

MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
CURRENT_DIR := $(dir $(MKFILE_PATH))

DOCKER_COMPOSE_STACK = docker-compose -f $(CURRENT_DIR)docker-compose.yml
DOCKER_COMPOSE_STACK_SERVICES_COUNT = ${DOCKER_COMPOSE_STACK} ps --services | wc -l | xargs
DOCKER_CONTAINER_COUNT = docker ps | grep -v COMMAND | wc -l | xargs

help: ## Help command that list available commands
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

install-stack: # Build stack from docker-compose
	@${DOCKER_COMPOSE_STACK} build

start-stack: network-start # Start network and stack
	@${DOCKER_COMPOSE_STACK} up -d

stop-stack: network-stop # Stop network & stack
	@$(MAKE) conditional-compose-stop

conditional-compose-stop: # Stop stack services if there's no other docker container running
	@if [ "`${DOCKER_COMPOSE_STACK_SERVICES_COUNT}`" = "`${DOCKER_CONTAINER_COUNT}`" ]; then \
		${DOCKER_COMPOSE_STACK} down; \
	fi

network-start: # Start global project network (will be joined by other projects)
	@docker network inspect sharednetwork >/dev/null 2>&1 || docker network create sharednetwork >/dev/null 2>&1

network-stop: # Stop global project network
	@docker network rm sharednetwork >/dev/null 2>&1 && echo "Stack network was stopped" || echo "Stack network is used by another project"
