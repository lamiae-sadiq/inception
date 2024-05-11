FROM debian:11

RUN apt-get update && apt-get install -y mariadb-server

COPY /conf/50-server.cnf  /etc/mysql/my.cnf

COPY /tools/maria.sh /maria.sh

RUN chmod +x /maria.sh

EXPOSE 3306

# Start MariaDB server by default
# ENTRYPOINT ["bash"]
ENTRYPOINT ["bash","maria.sh"]