provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.28"
  subnets         = ["subnet-0d62f5ff8858c1ffb", "subnet-0f417f637a926a494"] # Replace with your subnets
  vpc_id          = "vpc-09f5ad8f881eb1972 # Replace with your VPC ID
  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_size         = 3
      min_size         = 1
      instance_type    = "t3.medium"
    }
  }
}
