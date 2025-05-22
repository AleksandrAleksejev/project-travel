pipeline {
    agent any


        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("travel-app")
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    dockerImage.run('-p 3000:3000')
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

