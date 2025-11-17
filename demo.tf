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
  default     = "dev"
  description = "Environment-tag-test"
}

resource "aws_s3_bucket" "example" {
  bucket = "lavanya-demo-bucket-2050-test-33545"

  tags = {
    Name        = "lavanya-demo-bucket-2050-test-3354"
    Environment = var.environment
  }
}
