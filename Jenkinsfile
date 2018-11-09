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
      }
    }
    stage('Pull Request') {
      steps {
        sh 'git checkout -b newbranch${BUILD_NUMBER}'
        sh 'git commit -a -m "added tests"'
        withCredentials([usernamePassword(credentialsId: 'nicolabertazzo', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
          sh("git tag -a some_tag -m 'Jenkins'")
          sh('git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/nicolabertazzo/dhell newbranch${BUILD_NUMBER}')
        }
      }
    }
  }
  environment {
    pom = 'readMavenPom file:\'pom.xml\''
    artefactName = '"${pom.getArtifactId()}.${pom.getPackaging()}"'
  }
}