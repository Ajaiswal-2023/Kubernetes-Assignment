# Delete Job
kubectl delete -f init-job.yaml

# Delete service
kubectl delete -f service.yaml

# Delete StatefulSet
kubectl delete -f statefulset.yaml

# Delete Secrets
kubectl delete -f secret.yaml

# Delete ConfigMap
kubectl delete -f configmap.yaml

# Delete Persistent Volume
kubectl delete -f persistent-volume-claim.yaml
