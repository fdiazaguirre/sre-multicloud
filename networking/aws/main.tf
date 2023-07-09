variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

provider "aws" {
  region = var.aws_region
}

variable "vpc_name" {
  description = "The name of the VPC to be destroyed"
  type        = string
}

variable "username" {
  description = "The username to include in the VPC name"
  type        = string
  default     = "test"
}

locals {
  current_time = formatdate("YYYY-MM-DD-hh:mm:ss", timestamp())
  vpc_name     = "${var.username}_${local.current_time}_vpc"
}

output "vpc_name" {
  value = local.vpc_name
}
