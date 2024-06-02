FROM debian:11

RUN apt update -y 
RUN apt upgrade -y 
RUN apt install curl -y 
RUN apt install php-fpm -y
RUN apt install php-mysql -y
RUN apt install php-cli -y
RUN apt install wget -y
RUN apt-get install mariadb-client -y
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN php wp-cli.phar --info

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/bin/wp

COPY ./tools/script.sh /

RUN chmod +x /script.sh

ENTRYPOINT [ "bash", "script.sh" ]
