pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('Configuration') {
      steps {
        sh 'git rev-parse --short HEAD > GIT_COMMIT'
      }
    }
  }
}
