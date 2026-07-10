pipeline {
    agent any
    stages {
        stage('Hello & Clone') { 
            steps {
                echo 'Hello from Pipeline'
                git branch: 'main', url: 'https://github.com/Matiorus/Django-build.git'
                sh 'ls -la'
            }
        }
        stage('Build') { 
            steps {
                echo 'Building...'
                sh 'echo "Zbudowano w Dockerze!" > output.txt'
            }
        }
        stage('Test') { 
            steps {
                echo 'Testing...'
                sh 'echo "Testy OK" >> output.txt'
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: 'output.txt', onlyIfSuccessful: true
        }
    }
}
