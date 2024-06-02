# delete ConfigMap
kubectl delete -f configmap.yaml

# delete deployment
kubectl delete -f deployment.yaml

#delete Service
kubectl delete -f service.yaml

# delete horizontal pod scaling
kubectl delete -f hpa.yaml
