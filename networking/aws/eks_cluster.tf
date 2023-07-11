# FIXME: is not working since is using the downloaded module as a source.
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.5.1"

  cluster_name    = "my-cluster"
  cluster_version = "1.24"

  subnet_ids = [aws_subnet.web-1a.id, aws_subnet.app-1a.id, aws_subnet.db-1a.id, aws_subnet.web-1b.id, aws_subnet.app-1b.id, aws_subnet.db-1b.id]
  vpc_id     = aws_vpc.main.id

  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"

  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-1"

      instance_types = ["t2.micro"]

      min_size     = 1
      max_size     = 3
      desired_size = 2
    }

    two = {
      name = "node-group-2"

      instance_types = ["t2.micro"]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }
}
