# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lsadiq <lsadiq@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/21 16:02:01 by lsadiq            #+#    #+#              #
#    Updated: 2024/05/09 17:40:56 by lsadiq           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

WP_PATH=/home/lsadiq/data/wordpress
DB_PATH=/home/lsadiq/data/mariadb
DATA_PATH=/home/lsadiq/data
DOCKER_COMPOSE_FILE=docker-compose.yml
DOCKER_COMPOSE_CMD=docker compose --file $(DOCKER_COMPOSE_FILE)
SYSTEM_PRUNE=docker system prune -af

all:
	echo "lsadiq.42.fr 127.0.0.1" >> /etc/hosts
	sudo mkdir -p $(WP_PATH) $(DB_PATH)
	$(DOCKER_COMPOSE_CMD) up -d
clean:
	$(DOCKER_COMPOSE_CMD) down
fclean:
	$(DOCKER_COMPOSE_CMD) down -v --rmi all
	$(SYSTEM_PRUNE)
	sudo rm -rf $(DATA_PATH)
re: fclean all