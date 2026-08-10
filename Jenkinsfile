pipeline {
    agent any

    environment {
        APP_NAME = 'student-internship-management'
        TOMCAT_WEBAPPS = '/opt/tomcat/webapps'
        TOMCAT_PORT = '8081'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build & Test') {
            steps {
                sh 'mvn clean test package'
            }
        }

        stage('Archive WAR') {
            steps {
                archiveArtifacts artifacts: 'target/*.war',
                                 fingerprint: true
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                sh '''
                    sudo /usr/bin/cp target/${APP_NAME}.war ${TOMCAT_WEBAPPS}/${APP_NAME}.war
                    sudo /usr/bin/systemctl restart tomcat
                '''
            }
        }

        stage('Health Check') {
            steps {
                sh '''
                    sleep 10
                    curl -f http://localhost:${TOMCAT_PORT}/${APP_NAME}/
                '''
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }

        failure {
            echo 'Pipeline failed!'
        }

        always {
            sh 'df -h /'
        }
    }
}    
