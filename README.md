# End-to-End DevOps Project: AWS + CI + Terraform + Kubernetes + Python

📌 Overview
This project demonstrates an end-to-end DevOps workflow using
Flask → Docker → Jenkins CI/CD → AWS ECR → Kubernetes (Docker Desktop).

It covers the complete lifecycle including application development, containerization, CI/CD automation, Infrastructure as Code, and Kubernetes-based deployment using industry-standard DevOps tools.

🧰 Tech Stack

Cloud: AWS (Free Tier)
Programming: Python 3.10 (Flask)
CI/CD: Jenkins
Containers: Docker
Orchestration: Kubernetes (Docker Desktop)
IaC: Terraform
Source Control: GitHub

🏗 Architecture & Workflow

Developer commits code to GitHub
Jenkins pipeline is triggered automatically
Docker image is built and tested
Infrastructure is provisioned using Terraform (AWS ECR)
Application is deployed to Kubernetes (Docker Desktop)
Application is exposed using a Kubernetes Service

Note: AWS resources were provisioned and later destroyed to optimize cost.
Kubernetes deployment was validated locally using Docker Desktop, following production-like workflows similar to EKS.

📸 Execution Proof
🔹 Flask Application Output
Application running locally and serving API response

🔹 Kubernetes Deployment
Pod running successfully inside Docker Desktop Kubernetes cluster

📂 Project Structure

python-devops-e2e/
│── app/
│── docker/
│── k8s/
│── terraform/
│── images/
│── Jenkinsfile
│── Dockerfile
│── README.md

🔐 Best Practices Followed

Infrastructure as Code using Terraform
Containerized application builds with Docker
CI/CD automation using Jenkins
Environment-agnostic Kubernetes manifests
Clean Git history and structured repository

📬 Feedback

Suggestions and improvements are welcome.
