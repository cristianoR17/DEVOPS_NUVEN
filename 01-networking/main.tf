terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = "xxxxx"
    key    = "xxxxx"
    region = "us-east-1"
    dynamodb_table = "xxxxx"
  }

}

provider "aws" {
  region = var.region
  default_tags {
    tags = var.tags
  }

  assume_role {
    role_arn    = var.assume_role.role_arn
    external_id = var.assume_role.external_id
  }
}

