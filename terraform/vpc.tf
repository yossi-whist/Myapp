#########################
# VPC #
#########################

data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name = "${var.vpc-name}"
  cidr = var.vpc_cidr
  azs = data.aws_availability_zones.available.names
  private_subnets = var.private_cidr
  public_subnets = var.public_cidr

  enable_nat_gateway = true
  single_nat_gateway = true
    
}