# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aamzil <aamzil@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/21 16:55:43 by aamzil            #+#    #+#              #
#    Updated: 2020/10/24 11:09:06 by aamzil           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine
COPY ./script/ .
RUN sh install.sh
COPY ./srcs/default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
EXPOSE 443
CMD sh start.sh
