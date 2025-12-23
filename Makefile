all: up

directories:
	@sudo mkdir -p /home/jbutragu/data/mariadb
	@sudo chown -R "101:101" /home/jbutragu/data/mariadb
	@sudo mkdir -p /home/jbutragu/data/wordpress
	@sudo chown -R  "101:101" /home/jbutragu/data/mariadb





up: directories
	docker compose -f srcs/docker-compose.yml up --build


down:
	docker compose -f srcs/docker-compose.yml down


.PHONY: all directories up down
