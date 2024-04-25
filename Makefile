# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: weirdo <weirdo@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/21 16:02:01 by lsadiq            #+#    #+#              #
#    Updated: 2024/04/24 19:30:30 by weirdo           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


SRC = srcs/dockerfile
NAME = inception

all :  mkdir ${NAME}

${NAME}: ${SRC} 
		${SRC} up  --build -d
# mkdir:
# 	mkdir -p /Users/lsadiq/Desktop/data/wp; mkdir -p /Users/lsadiq/Desktop/data/db
# hosts :
# 		echo  "127.0.0.1 	lsadiq.42.fr" >> /etc/hosts
# down :
# 	docker stop $$(docker ps -qa); docker rm $$(docker ps -qa);
# clean :
# 	docker stop $$(docker ps -qa); docker rm $$(docker ps -qa); docker rmi $$(docker images -qa) ; docker volume rm $$(docker volume ls -q)
# vclean :
# 	docker volume rm $$(docker volume ls -q)
# fclean : 
# 	rm -rf /Users/lsadiq/Desktop/data/wp/* ; rm -rf /Users/lsadiq/Desktop/data/db/*