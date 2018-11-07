pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        sh 'echo checkout'
      }
    }
    stage('Configuration') {
      steps {
        sh 'git rev-parse --short HEAD > GIT_COMMIT'
      }
    }
  }
}