# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aamzil <aamzil@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/21 16:55:43 by aamzil            #+#    #+#              #
#    Updated: 2020/10/24 17:06:14 by aamzil           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine
COPY ./script/install.sh .
RUN sh install.sh
COPY ./srcs/nginx.conf /etc/nginx/
# RUN echo "daemon off;" >> /etc/nginx/nginx.conf
# CMD service nginx start
