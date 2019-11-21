node{
    stage('Checkout'){
        checkout scm
    }

    stage ('Build') {
        bat "mvn clean compile"
        dspot ouputDir: "dspot-output", testFilter: "eu.stamp_project.examples.*"
    }
}
