pipeline {
    agent any
    stages {
        stage('1 Build') {
            steps {
               sh '''
                docker stop webapp
                rm -rf nx_bootcamp_webapp
                git clone https://github.com/Viktoriya-dem/nx_bootcamp_webapp
                cd nx_bootcamp_webapp
                docker build -t nx_bootcamp_webapp .
                docker run --rm -d -p 80:80 --name webapp nx_bootcamp_webapp
               '''
            }
        }
        stage('2 Test') {
            steps {
                sh 'docker inspect webapp | grep "Running"'
            }
		}
        stage('3 Deploy') {
            steps {
                sh 'echo "Webapp is working"'
            }
		}
	}
}
