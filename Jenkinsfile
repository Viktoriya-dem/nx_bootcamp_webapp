pipeline {
    agent any
    stages {
        stage('1 Build') {
            steps {
               sh '''
                docker stop webapp
                docker build -t nx_bootcamp_webapp .
               '''
            }
        }
	stage('2 Start') {
            steps {
               sh '''
                docker run --rm -d -p 80:80 --name webapp nx_bootcamp_webapp
               '''
            }
        }
        stage('3 Test') {
            steps {
                sh 'docker inspect webapp | grep "Running"'
            }
		}
        stage('4 Email Notification') {
            steps {
                mail bcc: '', body: 'Job is working', cc: '', from: '', replyTo: '', subject: 'Jenkins job Webapp(home3)_addition', to: 'viktoriya-dem1dova@yandex.ru'
            }
		}
	}
}
