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
        when {branch 'jenkins_pullrequest'}
      steps {
        withMaven(maven: 'maven3') {
          sh 'mvn eu.stamp-project:dspot-maven:amplify-unit-tests -Dpath-to-properties=dhell.dspot -Damplifiers=TestDataMutator -Dtest-criterion=JacocoCoverageSelector -Diteration=1'
        }

        sh 'cp -rf target/dspot/output/eu src/test/java/'
      }
    }
    stage('Pull Request') {
      environment {
                GITHUB_CREDS = credentials('jenkins-bitbucket-common-creds')
                GITHUB_TOKEN = "${GITHUB_CREDS_PSW}"
            }
      when {branch 'jenkins_pullrequest'}
      steps {
        sh 'echo ${env.GITHUB_TOKEN}'
        sh 'git checkout -b newbranch${BUILD_NUMBER}'
        sh 'git commit -a -m "added tests"'
        withCredentials([usernamePassword(credentialsId: 'nicolabertazzo', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
          sh('git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/nicolabertazzo/dhell newbranch${BUILD_NUMBER}')
        }
        sh 'hub pull-request -m "prova pull request"'
        }
      }
    }
  environment {
    pom = 'readMavenPom file:\'pom.xml\''
    artefactName = '"${pom.getArtifactId()}.${pom.getPackaging()}"'
  }
}