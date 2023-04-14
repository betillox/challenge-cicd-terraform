pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM',
                          branches: [[name: '*/master']],
                          userRemoteConfigs: [[url: 'https://github.com/betillox/challenge-cicd-terraform']]])
            }
        }
        
	step
	{	
 		emailext mimeType: ‘text/html’,
 		subject: “APPROVAL RQD[JENKINS] ${currentBuild.fullDisplayName}”,
 		to: “eumanachav@ucreativa.com“,
 		body: ‘’’<a href=”${BUILD_URL}input”>click to approve</a>’’’
	}

	stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage ("terraform fmt") {
            steps {
                sh 'terraform fmt'
            }
        }
        stage ("terraform validate") {
            steps {
                sh 'terraform validate'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }
	
	stage('Terraform Apply') {
	    steps {
	    	sh 'terraform apply --auto-approve' 
            }
	}	

     }
  }

