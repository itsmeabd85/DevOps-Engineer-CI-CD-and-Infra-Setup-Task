# DevOps Engineer – CI/CD & Infrastructure Setup

## 🧠 Objective
This project demonstrates a production-grade DevOps workflow to deploy a containerized Flask application with CI/CD automation, infrastructure provisioning, Kubernetes orchestration, and basic monitoring.

Project Walkthrough link : https://drive.google.com/file/d/1mtzsI8sgDCCcPBI1HJiLwOaT-_f7fi13/view?usp=sharing

---

## 🔧 Tech Stack
- **Cloud Provider**: AWS (EKS, SSM, IAM, CloudFormation)
- **CI/CD**: GitHub Actions (OIDC-based)
- **Containerization**: Docker
- **Infrastructure as Code**: AWS CloudFormation (YAML format)
- **Orchestration**: Kubernetes (EKS)
- **Monitoring**: Prometheus + Grafana (Helm)

---

## ⚙️ Key Implementations

### 1. **Application Containerization**
- Flask-based application containerized using a custom `Dockerfile`.
- Docker image pushed to Docker Hub securely using credentials stored in AWS SSM.

### 2. **CI/CD with GitHub Actions**
- GitHub Actions pipeline triggered on push to `main` branch.
- Secure AWS access via OIDC (no hardcoded credentials).
- Stages:
  - Build Docker image
  - Push to Docker Hub
  - Update EKS kubeconfig
  - Deploy to `staging` and `production` namespaces

### 3. **Infrastructure Provisioning**
- AWS infrastructure provisioned using CloudFormation (nested stacks):
  - VPC
  - EKS cluster
  - Node Groups
  - IAM roles

### 4. **Kubernetes Orchestration**
- K8s manifests created for:
  - Deployments (separate for staging & production)
  - Services
  - Namespaces
- Autoscaling configured using HPA and metrics-server.

### 5. **Monitoring Setup**
- Monitoring stack deployed using Helm:
  - Prometheus
  - Grafana
  - Node Exporter
  - Kube State Metrics
- Grafana dashboard exposed via `kubectl port-forward`.

---

## 🚀 How to Access Grafana
```bash
kubectl port-forward -n monitoring svc/kube-monitoring-grafana 3000:80
