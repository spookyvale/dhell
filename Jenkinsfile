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
	short_commit = readFile('GIT_COMMIT').trim()
	def pom = readMavenPom file:'pom.xml'
        artefactName = "${pom.getArtifactId()}.${pom.getPackaging()}"
        sh 'rm GIT_COMMIT'
      }
    }
  }
}
