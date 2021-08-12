# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: thoberth <thoberth@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/31 11:16:03 by thoberth          #+#    #+#              #
#    Updated: 2021/08/06 13:29:44 by thoberth         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

RM_IMAGES = docker rmi -f $(shell docker images -q) && docker rm $(shell docker ps -a -q)

LAUNCH_DOCKER_COMPOSE = docker-compose -f ./srcs/docker-compose.yml up --build -d

STOP_DOCKER_COMPOSE = docker-compose -f ./srcs/docker-compose.yml down

VOL_DIR = /home/thoberth/data

all:	volumes
	${LAUNCH_DOCKER_COMPOSE}

volumes:
	sudo sed -i '1 i\127.0.0.1\tthoberth.42.fr' /etc/hosts
	sudo userdel www-data && sudo useradd -u 82 www-data
	sudo mkdir -p $(VOL_DIR)/database && sudo chown -R mysql:mysql $(VOL_DIR)/database
	sudo mkdir -p $(VOL_DIR)/wp && sudo chown -R www-data:www-data $(VOL_DIR)/wp

down:
	${STOP_DOCKER_COMPOSE}

clean:
	${RM_IMAGES}

re: clean down all

.PHONY:	all down clean re