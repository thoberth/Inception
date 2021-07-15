# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: thoberth <thoberth@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/31 11:16:03 by thoberth          #+#    #+#              #
#    Updated: 2021/06/22 16:31:42 by thoberth         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

RM_IMAGES = docker rmi -f $(shell docker images -q)

LAUNCH_DOCKER_COMPOSE = docker-compose up --build

STOP_DOCKER_COMPOSE = docker-compose down

all:
	${LAUNCH_DOCKER_COMPOSE}

down:
	${STOP_DOCKER_COMPOSE}

clean:
	${RM_IMAGES}

re: clean down all
	
.PHONY:	all down clean re