FROM debian:11

RUN apt update && apt upgrade -y 
RUN apt install wget curl netcat monitorix -y
COPY ./tools/monitorix.sh /monitorix.sh
RUN chmod +x /monitorix.sh
CMD [ "/bin/bash", "/monitorix.sh"]






