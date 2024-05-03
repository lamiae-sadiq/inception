# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: weirdo <weirdo@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/21 16:02:01 by lsadiq            #+#    #+#              #
#    Updated: 2024/05/02 16:58:36 by weirdo           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

WP_PATH=/home/lsadiq/data/wordpress
DB_PATH=/home/lsadiq/data/mariadb
DATA_PATH=/home/lsadiq/data
DOCKER_COMPOSE_FILE=docker-compose.yml
DOCKER_COMPOSE_CMD=docker-compose --file $(DOCKER_COMPOSE_FILE)
SYSTEM_PRUNE=docker system prune -af

all:
	sudo mkdir -p $(WP_PATH) $(DB_PATH)
	$(DOCKER_COMPOSE_CMD) up -d
clean:
	$(DOCKER_COMPOSE_CMD) down
fclean:
	sudo rm -rf $(DATA_PATH)
	$(SYSTEM_PRUNE)
	$(DOCKER_COMPOSE_CMD) down -v --rmi all
re: fclean all