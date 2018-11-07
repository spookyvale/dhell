pipeline {
  agent any
  environment {
        pom = readMavenPom file:'pom.xml'
        artefactName = "${pom.getArtifactId()}.${pom.getPackaging()}"
  }
  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('Configuration') {
     steps {
       sh 'echo ${pom}'
       sh 'echo ${artefactName}'
      } 
    }
  }
}
