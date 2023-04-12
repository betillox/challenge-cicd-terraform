pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM',
                          branches: [[name: '*/master']],
                          userRemoteConfigs: [[url: 'https://github.com/betillox/challenge-cicd-terraform.git']]])
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'aws-vault exec beto-devops -- terraform init'
            }
        }
        stage ("terraform fmt") {
            steps {
                sh 'aws-vault exec beto-devops -- terraform fmt'
            }
	}
        stage ("terraform validate") {
            steps {
                sh 'aws-vault exec beto-devops -- terraform validate'
            }
        }
        stage('Terraform Plan') {
            steps {
            	sh 'aws-vault exec beto-devops -- terraform plan'    
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'aws-vault exec beto-devops -- terraform apply --auto-approve'
            }
        }
    }
}

