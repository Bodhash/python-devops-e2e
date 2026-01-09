# End-to-End DevOps Project: AWS + CI + Terraform + Kubernetes + Python

📌 Overview
End-to-end DevOps demo using Flask → Docker → Jenkins CI/CD → AWS ECR → Kubernetes (Docker desktop). This project demonstrates a complete end-to-end DevOps workflow covering application development, containerization, CI/CD automation, Infrastructure as Code, and Kubernetes deployment using industry-standard tools.

🧰 Tech Stack

Cloud: AWS (Free Tier)
Programming: Python (3.10 / Flask)
CI/CD: Jenkins
Containers: Docker
Orchestration: Kubernetes (Docker Desktop)
IaC: Terraform
Source Control: GitHub

🏗 Architecture Flow

Developer commits code to GitHub
Jenkins triggers CI pipeline
Docker image is built and tested
Infrastructure is provisioned using Terraform
Application is deployed to Kubernetes (Docker Desktop)
Application exposed via Kubernetes Service

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

Infrastructure as Code (Terraform)
Containerized application builds
CI/CD automation with Jenkins
Environment-agnostic Kubernetes manifests
Clean Git commit history

📬 Feedback
Suggestions and improvements are welcome!
