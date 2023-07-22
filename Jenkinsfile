pipeline {

agent {
    label 'Jenkins-node1'
}

options {
    timeout(time: 1, unit: 'HOURS')
}
triggers { pollSCM('* * * * 1-5') }

tools {
    jdk 'JDK17'
}

stages{
    stage('Source Code Checkout'){
        
    steps{
        git branch: main
            url: https://github.com/karthivt08/spring-petclinic.git
        }

                                }

    stage('MVN Build')
    {
        steps{
            sh 'mvn package'
        }
    }                            
stage('report stage')
        {
            steps{

                archiveArtifacts artifacts: 'target/spring-petclinic*.jar'
                junit testResults: '**/target/surefire-reports/TEST-*.xml'

            }
        }

    }

}

