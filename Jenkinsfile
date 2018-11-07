pipeline {
  agent any
  stages {
    stage('Configuration') {
      steps {
        sh '''echo ${pom}
echo ${artefactName}
echo ${mvnHome}'''
      }
    }
    stage('Build') {
      steps {
        withMaven(maven: 'maven3') {
          sh 'mvn compile'
        }

      }
    }
    stage('Unit Tests') {
      steps {
        withMaven(maven: 'maven3') {
          sh 'mvn test'
        }

        junit(testResults: 'target/surefire-reports/*.xml', allowEmptyResults: true)
      }
    }
  }
  environment {
    pom = 'readMavenPom file:\'pom.xml\''
    artefactName = '"${pom.getArtifactId()}.${pom.getPackaging()}"'
  }
}