pipeline {
    agent any

    parameters {
         string(name: 'dev-server', defaultValue: '54.146.94.27', description: 'Dev Server')
         string(name: 'stage-server', defaultValue: '52.90.14.242', description: 'Stage Server')
         string(name: 'prod-server', defaultValue: '35.188.241.194', description: 'Prod Server')
    }

    stages{
        stage('Build Dev Environment'){
            steps {
                echo 'Building Dev Environment on ${params.dev-server}'
                sh "ping -c 1 ${params.dev-server}"
            }
            post {
                success {
                    echo 'Dev Environment Build Completed on ${params.dev-server}'
                }

                failure {
                    echo 'Dev Environment Build FAILED on ${params.dev-server}'
                }
            }
        }
        
        stage('Test Dev Environment'){
            steps {
                echo 'Testing Dev Environment'
            }
            post {
                success {
                    echo 'Dev Environment Build Test Passed'
                }

                failure {
                    echo 'Dev Environment Build Test FAILED'
                }
            }
        }
        
        stage('Merge Dev to Stage'){
            steps {
                echo 'Merging Dev to Stage'
            }
            post {
                success {
                    echo 'Dev Merged to Stage'
                }

                failure {
                    echo 'Dev Merge to Stage FAILED'
                }
            }
        }
        
        stage('Build Stage Environment'){
            steps {
                echo 'Building Stage Environment'
            }
            post {
                success {
                    echo 'Stage Environment Build Completed'
                }

                failure {
                    echo 'Stage Environment Build FAILED'
                }
            }
        }
        
        stage('Test Stage Environment'){
            steps {
                echo 'Testing Stage Environment'
            }
            post {
                success {
                    echo 'Stage Environment Build Test Passed'
                }

                failure {
                    echo 'Stage Environment Build Test FAILED'
                }
            }
        }
        
        stage('Merge Stage to Prod'){
            steps {
                echo 'Merging Stage to Prod'
            }
            post {
                success {
                    echo 'Stage Merged to Prod'
                }

                failure {
                    echo 'Stage Merge to Prod FAILED'
                }
            }
        }

        stage('Build Prod Environment'){
            steps {
                echo 'Building Prod Environment'
            }
            post {
                success {
                    echo 'Prod Environment Build Completed'
                }

                failure {
                    echo 'Prod Environment Build FAILED'
                }
            }
        }
        
        stage('Test Prod Environment'){
            steps {
                echo 'Testing Prod Environment'
            }
            post {
                success {
                    echo 'Prod Environment Build Test Passed'
                }

                failure {
                    echo 'Prod Environment Build Test FAILED'
                }
            }
        }        
    }
}