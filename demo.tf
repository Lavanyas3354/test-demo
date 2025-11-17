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
  region = var.aws_region
}

variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "dev"
}

resource "aws_s3_bucket" "example" {
  bucket = "lavanya-demo-bucket-2025-test-3354"

  tags = {
    Name        = "lavanya-demo-bucket-2025-test-3354"
    Environment = var.environment
  }
}

