provider "aws" {
  region  = var.region_name
  profile = "AI-chatbot-905418236735"
}

# Terraform provider Block
terraform {
  required_version = "~> 1.9.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.85.0"
    }
  }
  #backend "s3" {}
  # bucket  = "dev-tf-state-file-ap-south-1"
  # key     = "chatbot-app/${terraform.workspace}/terraform.tfstate"
  # region  = "ap-south-1"
  # encrypt = true
  #dynamodb_table = "${var.project_name}-tf-locks"
}
