FROM nginx

RUN apt update && apt install git -y

COPY setup.sh /docker-entrypoint.d/666-webserver-setup.sh
RUN chmod +x /docker-entrypoint.d/666-webserver-setup.sh