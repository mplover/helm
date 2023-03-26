#!groovy

pipeline {
  environment {
    registry = "https://docker.mplover.com"
    image = "mplover/helm"
    registryCredential = "docker-registry-jenkins"
  }
  agent any
  triggers { cron("H 0 1 * *") }
  stages {
    stage('Building image') {
      steps{
        script {
          docker.withRegistry(registry, registryCredential) {
            image = docker.build(image, "--no-cache .")
            image.push()
          }
        }
      }
    }
    stage('Tagging latest') {
      steps{
        script {
          docker.withRegistry(registry, registryCredential) {
            image.push('latest');
          }
        }
      }
    }
  }
}
