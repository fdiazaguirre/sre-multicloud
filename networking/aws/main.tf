provider "aws" {
  region = var.aws_region
}

locals {
  current_time = formatdate("YYYY-MM-DD-hh:mm:ss", timestamp())
  vpc_name     = "${var.username}_${local.current_time}_vpc"
}
