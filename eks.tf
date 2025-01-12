provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.28"
  subnets         = ["subnet-xyz123", "subnet-abc456"] # Replace with your subnets
  vpc_id          = "vpc-xyz123" # Replace with your VPC ID
  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_size         = 3
      min_size         = 1
      instance_type    = "t3.medium"
    }
  }
}
