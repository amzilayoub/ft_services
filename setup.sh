#!/bin/sh

# Deleteing if there's an old instance of Minikube
minikube delete

# Starting Minikube
minikube start --driver hyperkit
# minikube start --cpus 6 --memory 2288 --disk-size=10g --driver=hyperkit

eval $(minikube docker-env)
# Storing Minikube ip in variable
export MINIKUBE_IP=$(minikube ip)

# Putting Minikube ip on the right place in every file
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./srcs/mysql/srcs/wp.sql > ./srcs/mysql/srcs/wordpress.sql
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./srcs/yaml/metallb-origin.yaml > ./srcs/yaml/metallb.yaml
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./srcs/nginx/srcs/default_.conf > ./srcs/nginx/srcs/default.conf
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./srcs/ftps/srcs/vsftpd_.conf > ./srcs/ftps/srcs/vsftpd.conf

# Building images
docker build -t ftps srcs/ftps/
docker build -t grafana srcs/grafana/
docker build -t influxdb srcs/influxdb/
docker build -t mysql srcs/mysql/
docker build -t nginx srcs/nginx/
docker build -t pma srcs/phpmyadmin/
docker build -t wordpress srcs/wordpress/

# LoadBalancer (Metallb) config file
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml

# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/yaml/metallb.yaml

# Deployment yaml file
kubectl apply -f srcs/yaml/ftps.yaml
kubectl apply -f srcs/yaml/grafana.yaml
kubectl apply -f srcs/yaml/influxdb.yaml
kubectl apply -f srcs/yaml/mysql.yaml
kubectl apply -f srcs/yaml/phpmyadmin.yaml
kubectl apply -f srcs/yaml/wordpress.yaml
kubectl apply -f srcs/yaml/nginx.yaml

# Start Minikube dashboard