# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lsadiq <lsadiq@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/21 16:02:01 by lsadiq            #+#    #+#              #
#    Updated: 2024/05/18 18:30:57 by lsadiq           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

WP_PATH=/home/lsadiq/data/wordpress
DB_PATH=/home/lsadiq/data/mariadb
DATA_PATH=/home/lsadiq/data
DOCKER_COMPOSE_FILE=docker-compose.yml
DOCKER_COMPOSE_CMD=docker compose -f $(DOCKER_COMPOSE_FILE)
SYSTEM_PRUNE=docker system prune -af

all: host
	mkdir -p $(WP_PATH) $(DB_PATH)
	$(DOCKER_COMPOSE_CMD) up -d --build
clean:
	$(DOCKER_COMPOSE_CMD) down

host:
	echo "127.0.0.1 lsadiq.42.fr" >> /etc/hosts

fclean:
	$(DOCKER_COMPOSE_CMD) down -v --rmi all
	$(SYSTEM_PRUNE)
	rm -rf $(DATA_PATH)

re: fclean all