# FullstackDevOpsProject
🚀 A full-stack microservices application deployed using GitHub Actions, Docker, Kubernetes, and AWS ECR.

## 🔧 Tech Stack

- Frontend: React (Dockerized)
- Backend: Golang REST API
- Microservices: Auth & Payments
- Containerization: Docker
- Orchestration: ECS
- CI/CD: GitHub Actions
- Monitoring: Prometheus + Grafana
- Infra as Code: Terraform
- Cloud: AWS

## 🔄 Git Branch Flow

- `main` → production-ready
- `develop` → integration/staging
- `feature/*` → per module feature development

## 📁 Infrastructure Modules

- `infra/ecr`: Manages ECR repos for all services
- `infra/ecs`: Manages ECS cluster and task roles
- `tf_modules/*`: Reusable Terraform modules


## 🚧 Current Phase

✅ Project scaffold created  
✅ Frontend/Backend/Services Dockerized  
✅ Docker Compose working locally  
✅ Modular ECR & ECS Execution Role provisioned using Terraform  
⏳ ECS Cluster creation in progress via IaC  

