pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'jenkinsdemo-image'
        DOCKER_CONTAINER = 'jenkinsdemo-container'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', 
                    url: 'https://github.com/cjhubgit/JenkinsDemo.git',
                    credentialsId: 'github-credentials'  // Use the correct credentials ID
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Ensure Docker is installed and running
                    sh 'docker --version'
                    // Build the Docker image
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    // Run tests inside the Docker container
                    sh "docker run --rm ${DOCKER_IMAGE} pytest"  // Ensure pytest is installed in the Docker image
                }
            }
        }

        stage('Deploy to Docker Container') {
            steps {
                script {
                    // Stop and remove any existing container with the same name
                    sh "docker stop ${DOCKER_CONTAINER} || true"
                    sh "docker rm ${DOCKER_CONTAINER} || true"
                    // Run the Docker container
                    sh "docker run -d --name ${DOCKER_CONTAINER} -p 80:5000 ${DOCKER_IMAGE}"
                }
            }
        }
    }

    post {
        always {
            // Clean up Docker containers and images (optional)
            sh "docker stop ${DOCKER_CONTAINER} || true"
            sh "docker rm ${DOCKER_CONTAINER} || true"
            sh "docker rmi ${DOCKER_IMAGE} || true"
        }
    }
}
