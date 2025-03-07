pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/cjhubgit/jenkinsdemo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t jenkinsdemo-image .'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'docker run --rm jenkinsdemo-image pytest'  // Example for Python tests
            }
        }

        stage('Deploy to Docker Container') {
            steps {
                sh 'docker run -d --name jenkinsdemo-container jenkinsdemo-image'
            }
        }
    }
}
