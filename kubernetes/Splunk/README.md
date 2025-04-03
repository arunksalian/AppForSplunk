# Splunk Enterprise Cluster on Kubernetes

This directory contains Kubernetes configurations for deploying a Splunk Enterprise cluster.

## Components

1. **Deployment Server**
   - Single instance deployment server
   - Manages configurations across the cluster
   - Ports: 8000 (web), 8089 (management)

2. **Search Head**
   - Single instance search head
   - Handles search requests and visualization
   - Ports: 8000 (web), 8089 (management)

3. **Indexer**
   - Single instance StatefulSet
   - Handles data ingestion and storage
   - Ports: 8000 (web), 8089 (management), 9997 (s2s)

## Storage

- Deployment Server: 10GB
- Search Head: 20GB
- Each Indexer: 50GB

## Configuration

All Splunk configurations are stored in ConfigMaps:
- Default admin password
- Clustering configuration
- License acceptance

## Network Access

- Web UI accessible via: https://splunk.local
- Internal services use ClusterIP
- Indexer discovery via headless service

## Deployment Instructions

1. Create the namespace:
```bash
kubectl apply -f namespace.yaml
```

2. Create storage resources:
```bash
kubectl apply -f storage.yaml
```

3. Create configuration:
```bash
kubectl apply -f configmap.yaml
```

4. Deploy Splunk components:
```bash
kubectl apply -f deployment-server.yaml
kubectl apply -f search-head.yaml
kubectl apply -f indexer.yaml
```

5. Configure ingress:
```bash
kubectl apply -f ingress.yaml
```

6. Add to hosts file:
```
127.0.0.1 splunk.local
```

## Access Credentials

- URL: https://splunk.local
- Username: admin
- Password: Chang3M3! (default, should be changed)

## Monitoring

Check cluster status:
```bash
kubectl get all -n splunk-cluster
```

View logs:
```bash
kubectl logs -n splunk-cluster -l app=splunk-deployment
kubectl logs -n splunk-cluster -l app=splunk-searchhead
kubectl logs -n splunk-cluster -l app=splunk-indexer
```
