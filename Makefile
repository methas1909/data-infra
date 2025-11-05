.PHONY: help check-make check-python init up down logs check-docker bootstrap

help:
	@echo "Available Make targets:"
	@echo "  help           - Show this help"
	@echo "  check-make     - Show GNU Make version"
	@echo "  check-python   - Show Python version (if installed)"
	@echo "  check-docker   - Show Docker versions"
	@echo "  init           - Bootstrap docker/.env and Airflow Fernet key"
	@echo "  up             - Start all services (docker compose up -d)"
	@echo "  logs           - Tail compose logs"
	@echo "  down           - Stop and remove containers/volumes"
	@echo "  bootstrap      - Create buckets, topics, and tables automatically"

check-make:
	@make --version

check-python:
	@python --version 2>&1

check-docker:
	@docker --version && docker compose version

init:
	@bash ./scripts/bootstrap.sh

up:
	@cd docker && docker compose -f docker-compose.dev.yml up -d

logs:
	@cd docker && docker compose -f docker-compose.dev.yml logs -f --tail=100

down:
	@cd docker && docker compose -f docker-compose.dev.yml down -v

bootstrap:
	@bash ./scripts/bootstrap_resources.sh
