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

