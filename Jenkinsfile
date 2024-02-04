pipeline {
    agent {
        node {
            label 'AGENT-1'
        }
    } 

    // Just like variables 
    // environment {
    //     packageVersion = ''
    //     nexusURL = '<place nexsus ec2 instance public ip adddress here>:8081'        
    // }
    
    // Terminating Build if it takes certain time
     options {
        ansiColor("xterm")
        timeout(time: 1, unit: 'HOURS')
        // dose not allow two pipleline builds at a time 
        disableConcurrentBuilds() 
    }
    
    parameters {
        string(name: 'version', defaultValue: '', description: 'What is the artifact version?') 
        string(name: 'environment', defaultValue: '', description: 'What is the environment?')       
    }
    
    // BUILD
    stages {
        stage('Print Version') {
            steps {
                sh """
                    echo "version: ${params.version}"
                    echo "version: ${params.environment}"
                """
            }
        }
        stage('Deploy') {
            steps {
                script {
                        def params = [
                            string(name: 'version', value: "$packageVersion"),
                            string(name: 'environment', value: "dev")
                        ]
                        build job: "catalogue-deploy", wait: true, parameters: params
                    }
            }
        }              
    }

    // POST BUILD
    post { 
        always { 
            echo 'I will always say Hello again!'
            // This will remove pipleline log files
            deleteDir() 
        }
         failure { 
            echo 'This runs when pipeline is failed, used set alert'
        }
         success { 
            echo 'This runs when pipeline is SUCCESS'
        }
    }
}