###################################################################
## ARGUMENTS

NAME= compose.yaml
WP_DATABASE = wordpress_data
MA_DATABASE = mariadb_data
LOCALHOST = 127.0.0.1
HOSTNAME = nrobinso.42.fr
CONTAINER_NAME_NGINX = nginx
CONTAINER_NAME_DATA = mariadb
CONTAINER_NAME_WEB = wordpress
IMAGE_NGINX = srcs-nginx
IMAGE_DATA = srcs-mariadb
IMAGE_WEB = srcs-wordpress

###################################################################
## SOURCES

SRC_DIR = srcs/
DATA_DIR = ~/data
MARIADB_DIR = $(DATA_DIR)/mariadb
WORDPRESS_DIR = $(DATA_DIR)/wordpress

###################################################################
## RULES

all: setup

setup:
	@mkdir -p $(DATA_DIR)
	@mkdir -p $(MARIADB_DIR)
	@mkdir -p $(WORDPRESS_DIR)
	@if ! grep -q "$(HOSTNAME)" /etc/hosts; then \
    		echo "Adding "$(HOSTNAME)" entry to /etc/hosts..."; \
    		sudo sh -c 'echo "$(LOCALHOST)\t$(HOSTNAME)" >> /etc/hosts'; \
	fi
	@echo "making container .....\n"
	@sudo docker compose -f $(SRC_DIR)$(NAME) build # --no-cache
	@sudo docker compose -f $(SRC_DIR)$(NAME) up -d

clean:
	@if [ -n "$(shell sudo docker images -f "dangling=true" -q)" ]; then \
    		echo "Deleting dangling images..."; \
    		sudo docker rmi $(shell sudo docker images -f "dangling=true" -q); \
	fi
	@sudo docker compose -f $(SRC_DIR)$(NAME) down

fclean: clean
	@if [ -n "$(shell sudo docker images -q "$(IMAGE_NGINX)")" ]; then \
		echo "Deleting image ... "$(IMAGE_NGINX)""; \
        	sudo docker image rm  "$(IMAGE_NGINX)"; \
    	fi
	@if [ -n "$(shell sudo docker images -q "$(IMAGE_WEB)")" ]; then \
		echo "Deleting image ... "$(IMAGE_WEB)""; \
        	sudo docker image rm  "$(IMAGE_WEB)"; \
    	fi
	@if [ -n "$(shell sudo docker images -q "$(IMAGE_DATA)")" ]; then \
		echo "Deleting image ... "$(IMAGE_DATA)""; \
        	sudo docker image rm  "$(IMAGE_DATA)"; \
    	fi
	@if sudo docker volume ls | grep -q "$(MA_DATABASE)"; then \
		echo "Deleting MariaDB   Volume ..... "; \
		sudo docker volume rm "$(MA_DATABASE)"; \
	fi
	@if sudo docker volume ls | grep -q "$(WP_DATABASE)"; then \
		echo "Deleting Wordpress Volume ..... "; \
		sudo docker volume rm "$(WP_DATABASE)"; \
	fi
	@sudo docker system prune --all
	@if [ -d ~/data ]; then \
    		echo "Removing ~/data..."; \
    		sudo rm -rf ~/data; \
	else \
    		echo "Folder ~/data does not exist."; \
	fi

re: fclean all

.PHOMY: all build clean fclean re

