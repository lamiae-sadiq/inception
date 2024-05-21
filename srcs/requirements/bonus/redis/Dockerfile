FROM debian:11
RUN apt-get update -y && apt-get install redis -y
RUN chown -R www-data:www-data /var/lib/redis
COPY conf/redis.conf /etc/redis/redis.conf
EXPOSE 6379
CMD [ "redis-server"]