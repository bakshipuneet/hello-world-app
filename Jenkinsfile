pipeline {
    agent any
	
	    environment {
        // Customize these variables based on your Docker image details
        DOCKER_IMAGE_NAME = "hello-world-app"
        DOCKER_REGISTRY_URL = "bakshipuneet"
        DOCKER_IMAGE_TAG = "v1.0"
    }


    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/bakshipuneet/hello-world-app'
            }
        }
		stage('Build Docker Image') {
            steps {
                    sh "docker build . -t ${DOCKER_REGISTRY_URL}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
            }
        }

        stage('Push Docker Image') {
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-registry-credentials') {
                                // Push the Docker image to the registry
                                sh "docker push ${DOCKER_REGISTRY_URL}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                    }  
                } 
            }
        }   
        
    }
}

def getDockerTag(){
    def tag = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag
}



