# Inception Project - 42 School

The aim is to set up a system using Docker and Docker Compose to run multiple containers. The main components are MariaDB as the database, Nginx as the web server, and WordPress as the application. The project requires configuring services, managing storage, and establishing networking between containers. It teaches automation, scalability, security, and system administration concepts. It provides experience in working with modern infrastructure tools.


## Overview  
The aim is to set up a system using Docker and Docker Compose to run multiple containers.  

## Components  
- **MariaDB** - Database server  
- **Nginx** - Web server  
- **WordPress** - Application  

## Configuration  
- Services must be configured  
- Storage must be managed  
- Networking between containers must be established  

## Learning Outcomes  
- Automation  
- Scalability  
- Security  
- System administration  

## Experience Gained  
- Working with modern infrastructure tools  


# Basic Settings in `50-server.cnf` - Mariadb

## General Configuration
- **`user = mysql`** → Defines the system user under which MySQL/MariaDB runs.
- **`pid-file = /run/mysqld/mysqld.pid`** → Specifies the location of the process ID file.
- **`socket = /run/mysqld/mysqld.sock`** → Sets the Unix socket file for local connections.
- **`port = 3306`** → Defines the port MySQL/MariaDB listens on (default is 3306).

## Paths & Directories
- **`basedir = /usr`** → Specifies the base directory where MySQL/MariaDB is installed.
- **`datadir = /var/lib/mysql`** → Defines the directory where database files are stored.
- **`tmpdir = /tmp`** → Sets the temporary directory for MySQL/MariaDB operations.
- **`lc-messages-dir = /usr/share/mysql`** → Defines the directory for language-specific messages.

## Network & Security
- **`bind-address = 127.0.0.1`** → Restricts MySQL/MariaDB to listen only on localhost for security.

These settings ensure efficient and secure database operation. Want me to include additional performance-related configurations?

# Docker CLI Commands with Options

## General Commands
- `docker --version` → Display Docker version.
- `docker info` → Show system-wide Docker information.
- `docker help` → List all available Docker commands.
- `docker help <command>` → Show help for a specific command.

## Container Management
- `docker run <image>` → Run a container from an image.
- `docker run -d <image>` → Run a container in detached mode.
- `docker run --name <name> <image>` → Run a container with a custom name.
- `docker run -p <host_port>:<container_port> <image>` → Map ports from host to container.
- `docker run -v <host_volume>:<container_volume> <image>` → Mount a volume.
- `docker run --env <key>=<value> <image>` → Set environment variables.
- `docker ps` → List running containers.
- `docker ps -a` → List all containers (running & stopped).
- `docker ps -q` → List only container IDs.
- `docker ps --format "{{.ID}}: {{.Names}}"` → Custom format for listing containers.
- `docker stop <container_id>` → Stop a running container.
- `docker start <container_id>` → Start a stopped container.
- `docker restart <container_id>` → Restart a container.
- `docker rm <container_id>` → Remove a stopped container.
- `docker rm -f <container_id>` → Force remove a container.
- `docker logs <container_id>` → Show logs of a container.
- `docker logs -f <container_id>` → Show live logs of a container.
- `docker exec -it <container_id> bash` → Run an interactive terminal in a running container.
- `docker exec -it <container_id> <command>` → Execute a command inside a running container.

## Image Management
- `docker images` → List all images.
- `docker images -a` → Show all images including intermediate ones.
- `docker pull <image>` → Download an image from Docker Hub.
- `docker pull <image>:<tag>` → Pull a specific tagged image.
- `docker build -t <image_name> <dockerfile_path>` → Build an image from a Dockerfile.
- `docker tag <image_id> <repo_name>:<tag>` → Tag an image.
- `docker push <image_name>` → Push an image to a repository.
- `docker rmi <image_id>` → Remove an image.
- `docker rmi -f <image_id>` → Force remove an image.

## Network Management
- `docker network ls` → List available networks.
- `docker network create <network_name>` → Create a custom network.
- `docker network inspect <network_name>` → Inspect details of a network.
- `docker network connect <network_name> <container_id>` → Connect a container to a network.
- `docker network disconnect <network_name> <container_id>` → Disconnect a container from a network.
- `docker network prune` → Remove all unused networks.

## Volume Management
- `docker volume ls` → List available volumes.
- `docker volume create <volume_name>` → Create a new volume.
- `docker volume inspect <volume_name>` → Show details of a volume.
- `docker volume rm <volume_name>` → Remove a volume.
- `docker volume prune` → Remove all unused volumes.

## Docker System Commands
- `docker system info` → Show detailed Docker system information.
- `docker system df` → Display disk usage stats for Docker.
- `docker system prune` → Remove all stopped containers, dangling images, and unused networks.
- `docker system events` → Show real-time events from Docker.

## Docker Compose
- `docker-compose up -d` → Start services in detached mode.
- `docker-compose down` → Stop and remove containers, networks, and volumes.
- `docker-compose ps` → List running services.
- `docker-compose logs` → Show logs of all running services.
- `docker-compose build` → Build images for services.

## System Cleanup
- `docker system prune` → Remove all stopped containers, unused networks, dangling images, and caches.
- `docker system df` → Show disk usage by Docker.
- `docker container prune` → Remove all stopped containers.
- `docker image prune` → Remove unused and dangling images.

