FROM alpine:3.18

MAINTAINER WEIRDO

RUN apk update && apk upgrade && apk add nginx
RUN apk add vim
RUN apk add curl
RUN mkdir -p /etc/nginx/ssl
RUN apk add openssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/http.d/default.conf
COPY conf/index.html /home/index.html
EXPOSE 443
CMD [ "nginx", "-g", "daemon off;" ]