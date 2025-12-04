pipeline{
 agent any
  environment {
    AWS_ACCOUNT_ID = "481317144779"
    AWS_REGION = "us-east-1"
    ECR_REPO = "481317144779.dkr.ecr.us-east-1.amazonaws.com/python-devops-e2e-repo"
  }
  stages {
    stage('Checkout') { steps { checkout scm } }
    stage('Test') {
      steps {
        sh 'python -m venv venv || true'
        sh 'source venv/bin/activate && pip install -r requirements.txt'
        sh 'pytest -q || true'
      }
    }
    stage('Build Docker Image') { steps { sh 'docker build -t python-devops-e2e:latest .' } }
    stage('Login to ECR') {
      steps {
        sh 'aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com'
      }
     steps {
    withCredentials([
      string(credentialsId: 'aws-access-key', variable: 'AWS_ACCESS_KEY_ID'),
      string(credentialsId: 'aws-secret-key', variable: 'AWS_SECRET_ACCESS_KEY')
    ]) {
      sh '''
      aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
      aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
      aws configure set default.region $AWS_REGION

      aws ecr get-login-password --region $AWS_REGION | \
      docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
      '''
    }
  }
    stage('Tag & Push') {
      steps {
        sh 'docker tag python-devops-e2e:latest $ECR_REPO:latest'
        sh 'docker push $ECR_REPO:latest'
      }
    }
    stage('Deploy (Local K8s)') {
      steps {
        sh 'kubectl set image deployment/python-devops-e2e-deployment python-devops-e2e=$ECR_REPO:latest --record || true'
      }
    }
  }
  post {
    failure {
      echo "Build failed! Please check Jenkins logs."
    }
  }
}
