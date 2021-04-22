FROM alpine:3.11
COPY ./script/ .
RUN sh install.sh
COPY ./srcs/telegraf.conf ./telegraf-1.18.0/etc/telegraf/
CMD sh start.sh