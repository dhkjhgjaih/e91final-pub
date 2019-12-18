pipeline {
    agent any

    stages{
        stage('Build Dev Environment'){
            steps {
/*              NOTE This doesn't work unless it's already been run...need to adjust order of operations...
                same with stage and prod...

                echo 'Cleaning Old Builds'
                sshagent (credentials: ['e91GroupProject']) {
                	sh "ssh -o StrictHostKeyChecking=no e91GroupProject@100.26.211.76 'sudo docker stop dev && sudo docker rm dev && sudo docker rmi centosapache && rm -rf e91final-pub'"
                }*/
                echo 'Building Dev Environment'
                sshagent (credentials: ['e91GroupProject']) {
                	sh "ssh -o StrictHostKeyChecking=no e91GroupProject@100.26.211.76 'git clone https://github.com/dhkjhgjaih/e91final-pub.git && cd e91final-pub/ && git checkout dev && sudo docker build -t centosapache . && sudo docker run --name dev -d -p 80:80 centosapache'"
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
                sshagent (credentials: ['e91GroupProject']) {
                	sh "ssh -o StrictHostKeyChecking=no e91GroupProject@100.26.211.76 'cd e91final-pub/ && git checkout stage && git merge dev && git remote set-url origin git@github.com:dhkjhgjaih/e91final-pub.git && yes | git push origin stage'"
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
                /*echo 'Cleaning Old Builds'
                sshagent (credentials: ['e91GroupProject']) {
                	sh "ssh -o StrictHostKeyChecking=no e91GroupProject@54.236.8.50 'sudo docker stop stage && sudo docker rm stage && sudo docker rmi centosapache && rm -rf e91final-pub'"
                }*/
                echo 'Building Stage Environment'
                sshagent (credentials: ['e91GroupProject']) {
                	sh "ssh -o StrictHostKeyChecking=no e91GroupProject@54.236.8.50 'git clone https://github.com/dhkjhgjaih/e91final-pub.git && cd e91final-pub/ && git checkout stage && sudo docker build -t centosapache . && sudo docker run --name stage -d -p 80:80 centosapache'"
                }            }
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
                /*echo 'Cleaning Old Builds'
                sshagent (credentials: ['e91GroupProject']) {
                	sh "ssh -o StrictHostKeyChecking=no e91GroupProject@35.188.241.194 'sudo docker stop prod && sudo docker rm prod && sudo docker rmi centosapache && rm -rf e91final-pub'"
                }*/
                echo 'Building Prod Environment'
                sshagent (credentials: ['e91GroupProject']) {
                	sh "ssh -o StrictHostKeyChecking=no e91GroupProject@35.188.241.194 'git clone https://github.com/dhkjhgjaih/e91final-pub.git && cd e91final-pub/ && git checkout master && sudo docker build -t centosapache . && sudo docker run --name prod -d -p 80:80 centosapache'"
                }            }
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