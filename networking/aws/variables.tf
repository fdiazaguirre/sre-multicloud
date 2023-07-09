variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
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
