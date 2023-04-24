BLACK		= $(shell tput -Txterm setaf 0)
RED			= $(shell tput -Txterm setaf 1)
GREEN		= $(shell tput -Txterm setaf 2)
YELLOW		= $(shell tput -Txterm setaf 3)
BLUE		= $(shell tput -Txterm setaf 4)
PURPLE		= $(shell tput -Txterm setaf 5)
LIGHTBLUE	= $(shell tput -Txterm setaf 6)
WHITE		= $(shell tput -Txterm setaf 7)
RESET		= $(shell tput -Txterm sgr0)

all:
		sudo docker-compose -f ./srcs/docker-compose.yml build
		mkdir -p /home/abkasmi/data/database
		mkdir -p /home/abkasmi/data/wordpress
		docker-compose -f ./srcs/docker-compose.yml up --detach
		@echo "${GREEN}ready!${RESET}"

up:		
		sudo docker-compose -f ./srcs/docker-compose.yml up --detach
		@echo "${LIGHTBLUE}container up${RESET}"

down:
		sudo docker-compose -f ./srcs/docker-compose.yml down
		@echo "${BLUE}container down${RESET}"

clean:	down
		sudo docker volume rm -f srcs_mariadb_volume
		sudo docker volume rm -f srcs_wordpress_volume
		@echo "${YELLOW}cleaned${RESET}"

fclean:	clean
		@docker image rm -f mariadb
		@docker image rm -f wordpress
		@docker image rm -f nginx
		@docker image rm -f debian:buster
		@sudo rm -rf /home/abkasmi/data
		@echo "${RED}full cleaned${RESET}"

re:	fclean all

.PHONY:	all up down clean fclean re
