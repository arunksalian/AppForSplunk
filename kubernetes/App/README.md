# Veltrix Application for Splunk - Kubernetes Setup

## Components

### Application Resources (namespace: veltrix-splunk)
- **Deployment**: `appforsplunk`
  - Image: arunksalian/appforsplunk:1.0.1
  - Port: 8080
- **Service**: `appforsplunk`
  - Type: ClusterIP
  - Port: 8080
- **Ingress**: `appforsplunk-ingress`
  - Host: appforsplunk.local
  - Path: /
- **ConfigMap**: `appforsplunk-config`
  - Contains application properties

### Ingress Controller (namespace: ingress-nginx)
- **Service**: `ingress-nginx-controller`
  - Type: NodePort
  - HTTP Port: 30080
  - HTTPS Port: 30443

## Access Application
1. Add to hosts file (`C:\Windows\System32\drivers\etc\hosts`):
   ```
   127.0.0.1 appforsplunk.local
   ```
2. Access application at: `http://appforsplunk.local:30080`

## Deployment Commands
```bash
# Deploy all resources
kubectl apply -f kubernetes/

# Check deployment status
kubectl get all -n veltrix-splunk

# View logs
kubectl logs -n veltrix-splunk -l app=appforsplunk
```