node{
    stage('Checkout'){
        checkout scm
    }

    stage ('Build') {
        // Get the Maven tool and Java.
        // ** NOTE: This 'MVN3' Maven tool 
        // ** and 'JDK8' Java must be configured
        // ** in the global configuration.
        withEnv(["JAVA_HOME=${ tool 'JDK8' }", "PATH+MAVEN=${tool 'MVN3'}/bin:${env.JAVA_HOME}/bin"]) {
            bat "mvn -f pom.xml.pitest_descartes clean install org.pitest:pitest-maven:mutationCoverage -DmutationEngine=descartes"
        }
        dspot ouputDir: "dspot-output"
    }
    stage ('Results'){
        // ** NOTE: "HTML Publisher Plugin" must be installed
        publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'target/pit-reports', reportFiles: '**/index.html', reportName: 'PIT Report', reportTitles: ''])
    }
}
