FROM alpine
COPY ./script/install.sh .
RUN sh install.sh
COPY ./srcs/nginx.conf /etc/nginx/
COPY ./script/start.sh .
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
CMD sh start.sh