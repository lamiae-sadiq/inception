FROM debian:11

RUN apt update -y 
RUN apt upgrade -y 
RUN apt install curl -y 
RUN apt install php-fpm -y
RUN apt install php-mysql -y
RUN apt install php-cli -y
RUN apt install wget -y

COPY ./conf/wp-config.php /var/www/wordpress

COPY ./tools/script.sh /

RUN chmod +x /script.sh

ENTRYPOINT [ "sh", "script.sh" ]
