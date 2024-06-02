FROM debian:11

RUN apt-get update && apt-get install -y mariadb-server

COPY /conf/50-server.cnf  /etc/mysql/my.cnf

COPY /tools/maria.sh /maria.sh

RUN chmod +x /maria.sh

# Start MariaDB server by default
ENTRYPOINT ["bash","maria.sh"]