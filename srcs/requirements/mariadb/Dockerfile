FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

COPY /tools/script.sh /script.sh

RUN chmod +x /script.sh

EXPOSE 3306

# Start MariaDB server by default
ENTRYPOINT ["sh","script.sh"]
