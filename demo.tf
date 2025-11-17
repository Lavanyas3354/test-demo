terraform {
  cloud {
    organization = "lavanyacloud"

    workspaces {
      name = "test-demo-1"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Add this variable because you are using var.environment
variable "environment" {
  type        = string
  default     = "dev-t"
  description = "Environment-tag-test"
}

resource "aws_s3_bucket" "example" {
  bucket = "lavanya-demo-bucket-2059-test-335455"

  tags = {
    Name        = "lavanya-demo-bucket-2059-test-335455"
    Environment = var.environment
  }
}


import {
  to = aws_s3_bucket.my_bucket
  id = "test-123456870-new"
}


resource "aws_s3_bucket" "my_bucket" {
  bucket = "test-123456870-new"
}
