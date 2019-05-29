pipeline {
  agent any
    stages {
      stage('Clean Workspace') {
        steps {
          dir {
            deleteDir()
          }
        }
      }
      stage('Prepare environment') {
        steps {
          sh 'jenkins_scripts/prepare.sh'
        }
      }
      stage('Test Config') {
        steps {
          sh 'jenkins_scripts/test.sh'
        }
      }
    }
}
