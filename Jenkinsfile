#!groovy

pipeline {
  environment {
    registry = "https://registry.markplover.com"
    image = "dafr33k/helm"
    registryCredential = "docker-registry-jenkins"
  }
  agent any
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