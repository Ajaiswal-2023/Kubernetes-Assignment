# GKE Project

This project contains Kubernetes manifests for deploying a PostgreSQL database using StatefulSets on GKE.

## Folder Structure

- **configmap/**: Contains ConfigMap definitions.
- **secrets/**: Contains Secret definitions.
- **persistent-volume/**: Contains PersistentVolume and PersistentVolumeClaim definitions.
- **statefulset/**: Contains StatefulSet definitions.
- **services/**: Contains Service definitions.

## Setup Instructions

1. **Create GKE Cluster**:
    ```bash
    gcloud container clusters create my-cluster --num-nodes=3 --zone=us-central1-a
    ```

2. **Apply PersistentVolume and PersistentVolumeClaim**:
    ```bash
    kubectl apply -f persistent-volume/persistent-volume.yaml
    ```

3. **Apply ConfigMap and Secret**:
    ```bash
    kubectl apply -f configmap/configmap.yaml
    kubectl apply -f secrets/secret.yaml
    ```

4. **Apply StatefulSet**:
    ```bash
    kubectl apply -f statefulset/statefulset.yaml
    ```

5. **Apply Service**:
    ```bash
    kubectl apply -f services/service.yaml
    ```

6. **Verify Deployment**:
    ```bash
    kubectl get statefulsets
    kubectl get pods
    kubectl get services
    ```

## Accessing the Database

- The database is accessible internally within the cluster using the service name `db` and port `5432`.

## Best Practices

- Use `kubectl` to manage and monitor the resources.
- Ensure secrets are properly encoded and access is restricted.
- Regularly backup your PersistentVolumes to prevent data loss.
