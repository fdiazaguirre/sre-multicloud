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

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = local.vpc_name
  }
}

output "vpc_name" {
  value = local.vpc_name
}

resource "aws_subnet" "web" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "web"
  }
}

resource "aws_subnet" "app" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "app"
  }
}

resource "aws_subnet" "db" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"
  tags = {
    Name = "db"
  }
}

resource "aws_security_group" "db" {
  name        = "db"
  description = "DB access"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_subnet.app.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_subnet.app.cidr_block]
  }
}

resource "aws_security_group" "app" {
  name        = "app"
  description = "App access"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_subnet.web.cidr_block, aws_subnet.db.cidr_block]
  }
}
