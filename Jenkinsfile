// Jenkins file for building image and pushing docker image to dockerhub
pipeline {
    agent any
    stages {
        stage("Git repo cloning") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'github-creds', usernameVariable: 'GIT_USER', passwordVariable: 'GIT_PASS')]) {
                    sh """
                    git clone https://github.com/Ajay73867/Java-myapp.git
                    cd Java-myapp
                    git checkout main
                    """
                }
            }
        }
        stage('Build with Maven') {
            steps {
                sh """
                cd Java-myapp
                mvn clean package
                """
            }
        }
        stage("Archiving artifacts to jar file") {
            steps {
                archiveArtifacts artifacts: "Java-myapp/target/*.jar", fingerprint: true
                // fingerprint is useful for tracking the archives, we can specify fingerprintArtifact:true and copy the arichive jar in other build pipeline
                // we can alos use/myapp-1.0.jar as well
            }
        }
        stage("Converting Jar file to Docker image") {
            steps {
                sh """
                cd Java-myapp
                docker build -t adabala73867/myownapp:latest .
                """
                withCredentials ([usernamePassword(credentialsId: "docker-creds", usernameVariable: "DOCKER_USER", passwordVariable: "DOCKER_PASSWORD")]) {
                    sh """
                    echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USER" --password-stdin
                    docker push adabala73867/myownapp:latest
                    """
                }
            }
        } 
    }
}
