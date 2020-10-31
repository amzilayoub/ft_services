#!bin/sh

source $HOME/.zshrc
docker-machine rm default
docker-machine -s /goinfre/aamzil/defaukt_image create --driver virtualbox default
# docker-machine create default --driver virtualbox
# docker-machine env default
eval $(docker-machine env default)