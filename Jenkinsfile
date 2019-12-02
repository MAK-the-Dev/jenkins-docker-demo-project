pipeline {

    agent any
    
    environment {
        PASS = credentials('docker-registry-password') 
    }

    stages {

        stage('Build') {
            steps {
                sh ' ./jenkins/build/build.sh '
            }
        }

        stage('Test') {
            steps {
                sh ' ./jenkins/test/test.sh '
            }
        }

        stage('Push') {
            steps {
                sh ' ./jenkins/push/push.sh '
            }
        }

        stage('Deploy') {
            steps {
                sh ' ./jenkins/deploy/deploy.sh '
            }
        }
    }
}
