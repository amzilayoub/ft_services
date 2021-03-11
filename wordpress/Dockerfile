FROM alpine:3.11
COPY ./script/install.sh .
RUN sh install.sh
COPY ./srcs/default.conf /etc/nginx/conf.d/default.conf
COPY ./script/start.sh .
COPY ./srcs/wp-config.php /www/
CMD sh start.sh