pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/AleksandrAleksejev/project-travel.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t travel-app .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 3000:3000 --name travel-app travel-app'
            }
        }

        stage('Test Endpoint') {
            steps {
                sh 'sleep 5' // дать время контейнеру запуститься
                sh 'curl --fail http://localhost:3000/travel'
            }
        }
    }
}
