FROM alpine:3.11
COPY ./script/ .
RUN sh install.sh
COPY ./srcs/grafana.db /grafana-7.4.5/data/
CMD sh start.sh