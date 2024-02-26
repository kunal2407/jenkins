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
            steps {
                sh '''
                    cd /home/ubuntu/workspace/k8/
                    sudo docker login
                    sudo docker build -t avi087/jentom:latest -f Dockerfile .
                    sudo docker push avi087/jentom:latest
                '''
            }
        }
        stage('deploy') {
            agent {
                label 'mvn'
            }
            steps {
                sh '''
                sudo kubectl apply -f /home/ubuntu/workspace/k8/deploy.yaml
                '''
            }
        }
    }
}
