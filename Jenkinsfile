pipeline {
    agent any

    environment {
        AWS_ACCOUNT_ID = "481317144779"
        AWS_REGION     = "us-east-1"
        ECR_REPO       = "481317144779.dkr.ecr.us-east-1.amazonaws.com/python-devops-e2e-repo"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Test') {
            steps {
                sh '''
                #!/bin/bash
                set -e

                python3 -m venv venv
                . venv/bin/activate
                export PYTHONPATH="$WORKSPACE"
                pip install --upgrade pip
                pip install -r requirements.txt
                pytest || true
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                #!/bin/bash
                docker build -t python-devops-e2e:latest .
                '''
            }
        }

        stage('Login to ECR') {
            steps {
                withCredentials([
                    string(credentialsId: 'aws-access-key', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws-secret-key', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {

                    sh '''
                    #!/bin/bash

                    aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
                    aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
                    aws configure set default.region $AWS_REGION

                    aws ecr get-login-password --region $AWS_REGION | \
                        docker login --username AWS --password-stdin \
                        $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
                    '''
                }
            }
        }

        stage('Tag & Push') {
            steps {
                sh '''
                #!/bin/bash
                docker tag python-devops-e2e:latest $ECR_REPO:latest
                docker push $ECR_REPO:latest
                '''
            }
        }

        stage('Deploy (Local K8s)') {
            steps {
                sh '''
                #!/bin/bash
                set -e

                echo "Applying Kubernetes manifests..."
                kubectl apply -f k8s/deployment.yaml
                kubectl apply -f k8s/service.yaml

                echo "Updating deployment image..."
                kubectl set image deployment/python-devops-e2e-deployment \
                    python-devops-e2e=$ECR_REPO:latest --record

                echo "Waiting for rollout to finish..."
                kubectl rollout status deployment/python-devops-e2e-deployment
                '''
            }
        }
    }

    post {
        failure {
            echo "Build failed! Please check Jenkins logs."
        }
    }
}
