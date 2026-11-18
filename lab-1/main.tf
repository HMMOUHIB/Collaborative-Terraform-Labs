module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 6.0"

  # ---- INPUTS : paramètres transmis au module ----
  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  # ---- RESOURCES créées en interne par le module ----
  # aws_vpc, aws_subnet (public + private), aws_internet_gateway,
  # aws_route_table, aws_route_table_association, aws_route,
  # (aws_nat_gateway + aws_eip si enable_nat_gateway = true)
}
