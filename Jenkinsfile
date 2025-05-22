pipeline {
    agent any

stages {
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build . -t 'travel-app')
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                     sh 'npm test'
                }
            }
        }

        stage('Test Endpoint') {    
            steps {
                script {
                    sh 'sleep 5' // Ждем запуска
                    sh 'curl http://localhost:3000/travel'
                }
            }
        }
    }
}

