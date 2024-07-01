# Inception Project

## 💡 About the Project

The goal of this project is to set up a small infrastructure with Docker, following specific rules, which consists of three services: MariaDB, WordPress, and Nginx.

## How to Use

### Prerequisites

Before diving in, you'll need to ensure you have the following prerequisites installed on your system:

- Make
- Docker
- Docker Compose

### Clone the Repository

```sh
$ git clone git@github.com:lamiae-sadiq/inception.git
$ cd Inception
```
### Run the Setup
```sh
$ make
```
### What is Docker?
Docker is a popular containerization technology that makes it easier to create, manage, and deploy containers. It is built on top of existing Linux technologies such as namespaces and cgroups, which are used to provide an isolated and controlled environment for running processes, while also ensuring that resource usage is limited and controlled.

Overall, Docker provides a powerful and flexible tool for building, deploying, and managing containerized applications across different platforms and environments.

### What is a Container?
A container is a standardized unit of software that packages up code and all its dependencies so that the application can run reliably and consistently on any computing environment. Containers provide a lightweight, isolated environment for running applications, where they can share the same operating system kernel but have their own filesystem, processes, and networking.

### What is Docker Compose?
Docker Compose simplifies the handling of multi-container Docker apps. Using a single YAML file called docker-compose.yml, you define all services, networks, and volumes required for your app. Just run docker-compose up to start everything effortlessly. This makes managing complex apps a breeze, as you can handle them all with one command.
### Example docker-compose.yml
```yml
version: '3.7'

networks:
  inception:
    driver: bridge

volumes:
  wordpress:
    driver: local
    name: wordpress
    driver_opts:
      type: non
      device: /home/lsadiq/data/wordpress
      o: bind
  mariadb:
    driver: local
    name: mariadb
    driver_opts:
      type: non
      device: /home/lsadiq/data/mariadb
      o: bind

services:
  mariadb:
    build: ./requirements/mariadb
    pull_policy: never
    image: mariadb
    container_name: mariadb
    volumes:
      - mariadb:/var/lib/mysql
    restart: always
    env_file:
      - .env
    networks:
      - inception

  nginx:
    build: ./requirements/nginx
    pull_policy: never
    image: nginx
    container_name: nginx
    volumes:
    - wordpress:/var/www/wordpress
    restart: always
    ports:
      - "443:443"
    networks:
      - inception
    depends_on:
      - wordpress

  wordpress:
    pull_policy: never
    image: wordpress
    container_name: wordpress
    volumes:
      - wordpress:/var/www/wordpress
    restart: always
    build: ./requirements/wordpress
    env_file:
      - .env
    networks:
      - inception
    depends_on:
      - mariadb
```
### What are Docker Volumes?
Docker volumes are a way to persist and share data between containers and the host machine. They provide a mechanism for storing and managing data separate from the container's filesystem, ensuring that data persists even if the container is stopped or removed.

Types of Volumes
* **Bind mount:** A file or directory on the host machine that is mounted into a container. Changes are reflected on the host and other containers.
* **Named volume:** A managed volume created and managed by Docker, useful for sharing data between containers.
<p> <img decoding="async" width="550" height="320" src="https://semaphoreci.com/wp-content/uploads/2023/12/docker-volumes.png" alt="" class="wp-image-22052 entered lazyloaded" data-lazy-srcset="https://semaphoreci.com/wp-content/uploads/2023/12/docker-volumes.png 550w, https://semaphoreci.com/wp-content/uploads/2023/12/docker-volumes-165x96.png 165w, https://semaphoreci.com/wp-content/uploads/2023/12/docker-volumes-548x320.png 548w" data-lazy-sizes="(max-width: 550px) 100vw, 550px" data-lazy-src="https://semaphoreci.com/wp-content/uploads/2023/12/docker-volumes.png" data-ll-status="loaded" sizes="(max-width: 550px) 100vw, 550px" srcset="https://semaphoreci.com/wp-content/uploads/2023/12/docker-volumes.png 550w, https://semaphoreci.com/wp-content/uploads/2023/12/docker-volumes-165x96.png 165w, https://semaphoreci.com/wp-content/uploads/2023/12/docker-volumes-548x320.png 548w">

### What are Docker Networks?
In Docker, a network acts as a virtual space where containers reside and interact.

Types of Networks
* **Bridge:** Allows containers to communicate internally and with the host.
* **Host:** Shares the host machine's network configuration with the containers.
* **Overlay:** Connects containers across different machines.
* **Macvlan:** Each container receives its own unique IP address.
* **None:** Isolates containers from all networks.
### How does Docker Work?
Docker operates through a client-server architecture where the Docker client interacts with the Docker daemon running on the Docker host to execute commands. The Docker daemon is responsible for managing various aspects of containerization including containers, images, networks, and volumes on the host system.

Components
* **Docker Client:** A CLI tool that interacts with the Docker daemon.
* **Docker Daemon:** A background process that manages Docker objects.
* **Docker Host:** The machine where Docker containers are deployed and run.
* **Docker Engine:** Includes the Docker daemon and the container runtime.
* **Containerd:** Manages the lifecycle of containers.
### Containers VS Virtual Machines
Containers and virtual machines (VMs) are both technologies used for deploying and running applications, but they differ significantly in their approach and architecture.

* **Virtual Machines**
Simulate a complete hardware environment.
Each VM runs its own OS instance.
Strong isolation and security.
Higher resource overhead.
* **Containers**
Encapsulate an application and its dependencies.
Share the host system's kernel.
Highly efficient in terms of resource usage.
Fast startup times.
Lighter isolation than VMs.
### What is MariaDB?
MariaDB is an open-source relational database management system (RDBMS) derived from MySQL. It provides a structured environment for storing and organizing data using tables, rows, and columns, following the relational model.
#### Example Dockerfile for MariaDB
```dockerfile
FROM debian:11

RUN apt-get update && apt-get install -y mariadb-server

COPY /conf/50-server.cnf  /etc/mysql/my.cnf

COPY /tools/maria.sh /maria.sh

RUN chmod +x /maria.sh

# Start MariaDB server by default
ENTRYPOINT ["bash","maria.sh"]
```
#### Example Database Creation Script
```sh
#!/bin/bash

# active bashjob
set -m

mysqld_safe &

until mariadb -u root -h localhost --password="${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"; do
  echo "Database is not up yet. Waiting..."
  sleep 0.2
done
echo " create a database if it's not exist"
mariadb -u root -h localhost --password="${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

# echo "create the user if it's not exists (adding localhost so the user can only connect from the localhost)"
mariadb -u root -h localhost --password="${MYSQL_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# echo "give the user all the privilages of the database"
mariadb -u root -h localhost --password="${MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%';"

# echo "modify the user: root connecting form: localhsot old password and replace it with the new password"
mariadb -u root -h localhost --password="${MYSQL_ROOT_PASSWORD}" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

# echo "reload the grant tables memory for the changes to take effect immediately"
mariadb -u root -h localhost --password="${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

# echo "shutdown the sql server"
mysqladmin -u root -h localhost --password="${MYSQL_ROOT_PASSWORD}" shutdown

#starting mysql server in safe mode
exec mysqld_safe
```

### What is WordPress?
WordPress is a content management system that simplifies website creation. It allows you to create websites using themes and plugins, publish articles, showcase photos, sell products online, and more.

#### Example Dockerfile for WordPress
```dockerfile
FROM debian:11

RUN apt update -y && apt upgrade -y && apt install curl -y && apt install php-fpm -y /
    && apt install php-mysql -y && apt install php-cli -y && apt install wget -y /
    && apt-get install mariadb-client -y
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN php wp-cli.phar --info

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/bin/wp

COPY ./tools/script.sh /

RUN chmod +x /script.sh

ENTRYPOINT [ "bash", "script.sh" ]
```
#### Example WordPress Configuration Script
```sh
mkdir -p /var/www/wordpress
cd /var/www/wordpress


until mariadb -u "$MYSQL_USER" -h mariadb --password="${MYSQL_PASSWORD}" -e "show databases;"; do
  echo "Database is not up yet. Waiting..."
  sleep 0.2 
done
sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/7.4/fpm/pool.d/www.conf


wp core download  --allow-root

wp config create --allow-root  --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb 

wp core install --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL  --allow-root --url=$DOMAIN_NAME

wp user create ${WP_USER} ${WP_EMAIL} --role="author" --user_pass=$WP_USER_PWD --allow-root

chown -R www-data:www-data /var/www/wordpress

mkdir -p /run/php/

exec php-fpm7.4 -F -R
```
### What is NGINX?
NGINX is a high-performance web server that also serves as a reverse proxy, load balancer, and HTTP cache. It is used to serve static content, handle SSL termination, and improve the overall performance and reliability of web applications.
#### Example Dockerfile for NGINX
```dockerfile
FROM debian:11

RUN apt-get update && \
    apt-get install -y nginx vim curl openssl && \
    rm -rf /var/lib/apt/lists/*

# Generate SSL certificate
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"

RUN mkdir -p /var/run/nginx
RUN mkdir -p /var/www/wordpress
COPY conf/default /etc/nginx/sites-available/default
EXPOSE 443

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
```
### NGINX configuration :
```
server
{
    listen 443 ssl;
    root /var/www/wordpress;
    index index.php ;

	autoindex on;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_certificate /etc/nginx/ssl/inception.crt;
    ssl_certificate_key /etc/nginx/ssl/inception.key;

	location / 
	{
		# First attempt to serve request as file, then
		# as directory, then fall back to displaying a 404.
		try_files $uri $uri/ =404;
			# pass PHP scripts to FastCGI server
	#
		location ~ \.php$
		{
			include snippets/fastcgi-php.conf;
			fastcgi_pass wordpress:9000;
		}
	}
}
```

### Conclusion
This project demonstrates the power and versatility of Docker in orchestrating a complex, multi-service application. By integrating MariaDB, WordPress, and Nginx into a single Dockerized environment, you have created a scalable and easily manageable web application stack. Docker's containerization technology ensures that each component runs in an isolated and controlled environment, providing consistency across different deployment platforms.


