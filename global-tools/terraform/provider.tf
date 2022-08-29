terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    region  = "us-east-1"
    bucket  = "bitovi-angular-ngrx-chat-operations-global-tools"
    key     = "tf-state"
    encrypt = true #AES-256encryption
  }
}
 
data "aws_region" "current" {}

provider "aws" {
  region = "us-east-1"
  profile = "default"
  default_tags {
    tags = local.aws_tags
  }
}

