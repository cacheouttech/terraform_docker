terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  
  backend "s3" {
    bucket = "terraformdockerbucket"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "docker" {}

provider "aws" {
  region = "us-east-1"
}




