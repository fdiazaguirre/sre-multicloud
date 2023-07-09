provider "aws" {
  region = var.aws_region
}

locals {
  current_time = formatdate("YYYY-MM-DD-hh:mm:ss", timestamp())
  vpc_name     = "${var.username}_${local.current_time}_vpc"
}

# FIXME: is not working since is using the downloaded module as a source.
# module "eks_example_complete" {
#   source  = "terraform-aws-modules/eks/aws//examples/complete"
#   version = "18.14.0"
# }
