kubectl apply -f heating-deployment.yaml 
kubectl apply -f heating-services.yaml 

kubectl apply -f lighting-deployment.yaml 
kubectl apply -f lighting-services.yaml 

kubectl apply -f status-deployment.yaml 
kubectl apply -f status-services.yaml

kubectl apply -f ingress-microservices.yaml
