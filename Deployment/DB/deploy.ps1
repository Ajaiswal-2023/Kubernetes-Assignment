# Apply Persistent Volume and Claim
kubectl apply -f persistent-volume-claim.yaml

# Apply ConfigMap
kubectl apply -f configmap.yaml

# Apply Secrets
kubectl apply -f secret.yaml

# Apply StatefulSet
kubectl apply -f statefulset.yaml

#Apply Service
kubectl apply -f service.yaml

# Apply Job to initialize the database
kubectl apply -f init-job.yaml
