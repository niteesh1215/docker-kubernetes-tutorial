FROM nginx:stable-alpine

WORKDIR /var/www/html

COPY ./src .

WORKDIR /etc/nginx/conf.d/

COPY ./nginx .

RUN mv ./nginx.conf ./default.conf