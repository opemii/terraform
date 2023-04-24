terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

  }
}
provider "aws" {
    profile = "terraform-user"
    region = "us-east-1"

}
