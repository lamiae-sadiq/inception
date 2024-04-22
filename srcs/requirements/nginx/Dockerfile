FROM alpine:3.18

MAINTAINER LUMLUM

RUN apk update && apk upgrade && apk add nginx
RUN apk add vim
RUN apk add curl
RUN mkdir -p /etc/nginx/ssl
RUN apk add openssl
RUN nginx