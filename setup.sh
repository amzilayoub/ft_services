#!/bin/sh

# Deleteing if there's an old instance of Minikube
minikube delete

# Starting Minikube
minikube start

eval $(minikube docker-env)
# Storing Minikube ip in variable
export MINIKUBE_IP=$(minikube ip)
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./mysql/srcs/wp.sql > ./mysql/srcs/wordpress.sql
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./yaml/metallb-origin.yaml > ./yaml/metallb.yaml

# Building images
docker build -t wordpress wordpress/
docker build -t mysql mysql/

# LoadBalancer (Metallb) config file
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f yaml/metallb.yaml

# Deployment yaml file
kubectl apply -f yaml/mysql.yaml
kubectl apply -f yaml/wordpress.yaml
docker build -t pma phpmyadmin