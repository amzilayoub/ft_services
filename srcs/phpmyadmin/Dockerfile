FROM alpine:3.11
COPY ./script/ .
RUN sh install.sh
COPY ./srcs/default.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/config.inc.php /www/config.inc.php
CMD sh start.sh