#!/bin/bash

docker build -t lordmir/multi-client:latest  -t lordmir/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t lordmir/multi-server:latest  -t lordmir/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t lordmir/multi-worker:latest  -t lordmir/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push lordmir/multi-client:latest
docker push lordmir/multi-server:latest
docker push lordmir/multi-worker:latest
docker push lordmir/multi-client:$SHA
docker push lordmir/multi-server:$SHA
docker push lordmir/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=lordmir/multi-server:$SHA
kubectl set image deployments/client-deployment client=lordmir/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=lordmir/multi-worker:$SHA
