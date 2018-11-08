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
            bat "mvn clean compile"
            dspot ouputDir: "dspot-output"
        }
       
    }
}
