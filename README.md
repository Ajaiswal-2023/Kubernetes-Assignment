# GKE Project

This project contains Kubernetes manifests to deploy a PostgreSQL database and Node.js applicatoin using GKE.

## Folder Structure

- **App/**: Contains node.js application that exposes and api endpoints to connect to postgres database. API has swagger spec that can be acccessed using /api-docs.
- **Deployment/**: Contains kubernetes manifests to deploy database and node.js application
    1. API: Deployment manifests for api application.
    2. DB: Deployment manifests for database.


- ## Docker hub image urls
  1. API: https://hub.docker.com/r/anujais2017/ecom-api-service image contains a node.js application to connect to database.
  2. DB: https://hub.docker.com/r/anujais2017/init-db  Image to initialize my postgre database using k8s job.

 ## Demo teams recording
  https://nagarro-my.sharepoint.com/personal/anupam_jaiswal_nagarro_com/_layouts/15/stream.aspx?id=%2Fpersonal%2Fanupam%5Fjaiswal%5Fnagarro%5Fcom%2FDocuments%2FRecordings%2FNAGP%20Kubernetes%20assignment%20demo%2D20240602%5F154848%2DMeeting%20Recording%2Emp4&referrer=StreamWebApp%2EWeb&referrerScenario=AddressBarCopied%2Eview%2E1c3c5781%2Ddde7%2D47b6%2Db7fa%2D50ac7b864715&ga=1

## Setup Instructions

1. **Create GKE Cluster**:
    ```
    gcloud container clusters create <cluster-name> --num-nodes=3 --zone=us-central1-a
    ```
2. **Connect to the Cluster**:
    gcloud container clusters create <cluster-name> --num-nodes=3 --zone=us-central1-a

3. **Deploy Database**: please run the powershell scripts \Deployment\DB\deploy.ps1

4. **Deploy Node.js application**: please run the powershell scripts \Deployment\API\deploy.ps1

5. **Verify Deployment**:
    ```
    kubectl get statefulsets
    kubectl get pods
    kubectl get services
    kubectl get pvc
    kubectl get hpa
    kubectl get pv
    ```

## Build and push docker image for API application:
    Please run the .\App\build_and_push_docker_image.ps1 in order to build docker image for node.js API service and push it to docker hub repo.

## Build and push docker image for database initialization:
    Please run the .\Deployment\DB\db_initialization\build_and_push_docker_image.ps1 powershell script in order to build docker image that includes scripts to create database, schema and insert some seed data into database.

## Running the load test to verify horizantal pod autscaler:
Run the .\hpa-test.ps1 to increase the load on the api-serivce pods to trigger the hpa to create more replicas. Please replace the api-service external ip in the script.

## Deleting Kubernetes Resources for Database: 
 -Running Deployment\DB\delete.ps1 script will delete all the k8s resources created for database.

## Deleting Kubernetes Resources for API: 
 -Running Deployment\API\delete.ps1 script will delete all the k8s resources created for API.

## Accessing the Database:
- The database is accessible internally within the cluster using the service name `db-service` and port `5432`.

## Accessing the API service:
- Api service can be accessed using swagger spec by http://api-service-external-ip/api-doc/, using the swagger spec, one can get/insert into database. or simply hit the http://api-service-external-ip/api/users/ or http://api-service-external-ip/api/products/ in browser.
