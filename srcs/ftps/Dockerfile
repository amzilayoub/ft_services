FROM alpine:3.11
COPY ./script/ .
RUN sh install.sh
COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
CMD sh start.sh