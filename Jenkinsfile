pipeline {
  agent any
    deleteDir()
    stages {
      stage('Clone repo') {
        steps {
          git url: 'git@github.com:dmeulen/hass.git', credentialsId: '62c172ed-19c0-4cfd-b6da-0f567c4ee1b5'
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
