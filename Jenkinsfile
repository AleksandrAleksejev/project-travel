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
                // Останавливаем и удаляем контейнер, если он уже существует
                sh 'docker stop travel-app || true'
                sh 'docker rm travel-app || true'
                // Запускаем новый контейнер
                sh 'docker run -d -p 3000:3000 --name travel-app travel-app'
            }
        }

        stage('Test Endpoint') {
            steps {
                sh 'sleep 5' // Даем время контейнеру запуститься
                sh 'curl --fail http://localhost:3000/travel'
            }
        }
    }

    // Добавляем post-секцию для очистки
    post {
        always {
            // Очищаем Docker-контейнеры и образы после завершения
            sh 'docker stop travel-app || true'
            sh 'docker rm travel-app || true'
            sh 'docker rmi travel-app || true'
        }
    }
}
