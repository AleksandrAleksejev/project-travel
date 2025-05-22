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
                script {
                    // 1. Останавливаем и удаляем все контейнеры, использующие наш образ
                    sh 'docker ps -aq --filter ancestor=travel-app | xargs -r docker rm -f || true'
                    
                    // 2. Освобождаем порт 3000 (если занят не Docker-процессом)
                    sh 'pkill -f "node app.js" || true'
                    sh 'fuser -k 3000/tcp || true'
                    
                    // 3. Запускаем контейнер с проверкой порта
                    def portAvailable = sh(script: 'nc -z localhost 3000 && echo "no" || echo "yes"', returnStdout: true).trim()
                    if (portAvailable == "no") {
                        error("Port 3000 is still in use after cleanup!")
                    } else {
                        sh 'docker run -d -p 3000:3000 --name travel-app travel-app'
                    }
                }
            }
        }

        stage('Test Endpoint') {
            steps {
                sh 'sleep 5'
                sh 'curl --fail --retry 3 --retry-delay 5 http://localhost:3000/travel'
            }
        }
    }

    post {
        always {
            sh 'docker stop travel-app || true'
            sh 'docker rm -f travel-app || true'
            sh 'docker rmi travel-app || true'
        }
    }
}
