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
    stage('Amplify') {
      steps {
        withMaven(maven: 'maven3') {
          sh 'mvn eu.stamp-project:dspot-maven:amplify-unit-tests -Dpath-to-properties=dhell.dspot -Damplifiers=TestDataMutator -Dtest-criterion=JacocoCoverageSelector -Diteration=1'
        }
        sh 'cp -rf target/dspot/output/eu src/test/java/'
        sh '''git checkout -b newbranchzz
        git commit -a -m "added tests"'''

        withCredentials([sshUserPrivateKey(credentialsId: 'nicolabertazzo', keyFileVariable: 'SSH_KEY')]) {
        sh ("git remote set-url origin git@github.com:nicolabertazzo/dhell.git")
        sh ("git push --set-upstream origin newbranchzz")
      }
      }
    }
  }
  environment {
    pom = 'readMavenPom file:\'pom.xml\''
    artefactName = '"${pom.getArtifactId()}.${pom.getPackaging()}"'
  }
}