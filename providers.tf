provider "aws" {
  
  region = "us-east-1"

}

 data "aws_caller_identity" "current" {}   

terraform {
  required_version = ">= 0.12.4"
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket         = "tf-backend-s3-state-file-storage"
    key            = "remotebackend.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock-dynamo"

  }
}
