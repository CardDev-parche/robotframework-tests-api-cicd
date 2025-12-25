pipeline {
    agent any

    stages {

        stage('Checkout Code From Git') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                bat  '''
                pip install -r requirements.txt
                '''
            }
        }

        stage('Run Test Automate') {
            steps {
                bat  '''
                robot -d results . 
                '''
            }
        }

        stage('Send Result To Jenkins') {
            steps {
                robot outputPath: 'results'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'results/**', fingerprint: true
        }
        success {
            echo 'Automation test passed ✅'
        }
        failure {
            echo 'Automation test failed ❌'
        }
    }
}
