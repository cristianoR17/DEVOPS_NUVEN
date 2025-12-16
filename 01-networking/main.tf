terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket         = "nssecgoo-terraform-state-files"
    key            = "networking/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "nssecgoo-terraform-state-locking"
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


