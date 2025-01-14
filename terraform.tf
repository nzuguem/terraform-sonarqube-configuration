terraform {

  required_version = ">= 1.10.0"

  required_providers {
    sonarqube = {
      source  = "jdamata/sonarqube"
      version = "~> 0.16.14"
    }
  }

  backend "local" {}
}

provider "sonarqube" {
  host  = var.sonar_host
  token = var.sonar_token
}