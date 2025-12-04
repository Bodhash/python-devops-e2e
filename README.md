# Python DevOps E2E Project

## Overview
End-to-end DevOps demo using Flask → Docker → Jenkins CI/CD → AWS ECR → Kubernetes (Minikube).

## Tech Stack
- Python 3.10 / Flask
- Docker
- Jenkins
- Terraform (AWS ECR)
- Kubernetes (Minikube / Docker Desktop)

## Run locally
1. Clone repo
2. `pip install -r requirements.txt`
3. `python app/main.py` → check http://localhost:5000

## CI/CD
- Jenkins pipeline automates build, test, image push to ECR, and K8s deployment.

## AWS
- Terraform creates ECR repo.
- Docker image stored in ECR.

## Kubernetes
- Deploy locally on Minikube using `kubectl apply -f k8s/`.

## Author
Created for learning DevOps workflow: CI/CD + IaC + Containers + K8s.
