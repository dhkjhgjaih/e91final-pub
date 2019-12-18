pipeline {
    agent any

    stages{
        stage('Build Dev Environment'){
            steps {
                echo 'Building Dev Environment'
                sshagent (credentials: ['e91GroupProject']) {
                	sh "ssh -o StrictHostKeyChecking=no e91GroupProject@54.146.94.27 'touch -f fileFromJenkins'"
                }
                sshagent (credentials: ['e91GroupProject']) {
                	sh "ssh -o StrictHostKeyChecking=no e91GroupProject@54.146.94.27 'git clone https://github.com/dhkjhgjaih/e91final-pub.git && cd e91final-pub/ && git checkout dev && sudo docker build -t centosapache . && sudo docker run --name dev -d -p 80:80 centosapache'"
                }
                
            }
            post {
                success {
                    echo 'Dev Environment Build Completed'
                }

                failure {
                    echo 'Dev Environment Build FAILED'
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
                sshagent (credentials: ['jenkins']) {
                	sh "ssh -o StrictHostKeyChecking=no e91GroupProject@54.146.94.27 'cd e91final-pub/ && git checkout stage && git merge dev'"
                }
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