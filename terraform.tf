terraform {

  required_version = ">= 1.10.0"

  required_providers {
    sonarqube = {
      source  = "jdamata/sonarqube"
      version = "~> 0.16.14"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.3"
    }
  }

  backend "local" {}
}

provider "sonarqube" {
  host  = var.sonar_host
  token = var.sonar_token
}

provider "random" {
}