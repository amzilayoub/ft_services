#!/bin/sh

# Deleteing if there's an old instance of Minikube
minikube delete

# Starting Minikube
minikube start --driver hyperkit

eval $(minikube docker-env)
# Storing Minikube ip in variable
export MINIKUBE_IP=$(minikube ip)

# Putting Minikube ip on the right place in every file
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./mysql/srcs/wp.sql > ./mysql/srcs/wordpress.sql
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./yaml/metallb-origin.yaml > ./yaml/metallb.yaml
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./nginx/srcs/default_.conf > ./nginx/srcs/default.conf
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./ftps/srcs/vsftpd_.conf > ./ftps/srcs/vsftpd.conf

# Building images
docker build -t nginx nginx/
docker build -t wordpress wordpress/
docker build -t mysql mysql/
docker build -t ftps ftps/
docker build -t pma phpmyadmin/

# LoadBalancer (Metallb) config file
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f yaml/metallb.yaml

# Deployment yaml file
kubectl apply -f yaml/nginx.yaml
kubectl apply -f yaml/mysql.yaml
kubectl apply -f yaml/wordpress.yaml
kubectl apply -f yaml/phpmyadmin.yaml
kubectl apply -f yaml/ftps.yaml