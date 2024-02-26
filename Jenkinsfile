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
    }
}
