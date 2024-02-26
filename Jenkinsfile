pipeline {
    agent any
    stages {
        stage('git pull') { 
            steps {
                git 'https://github.com/deepak-umre/studentapp.ui.git'
            }
        }
        stage('mvn build') { 
            agent {
                label 'mvn'
            }
            steps {
                sh 'mvn clean package'
            }
        }
        stage('docker'){
            agent {
                label 'mvn'
            }
            step {
                sh '''
                    docker login
                    docker buid -t avi087/jentom:latest -f Dockerfile /home/ubuntu/workspace/k8/
                '''
            }
        }
        stage('deploy') {
            agent {
                label 'mvn'
            }
            step {
                kubectl apply -f /home/ubuntu/workspace/k8/deploy.yaml
            }
        }
    }
}
