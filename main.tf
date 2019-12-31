/*
* main.tf
*/
provider "aws" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.21.0"
  # Assign IPv6 address on private subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch
  private_subnet_assign_ipv6_address_on_creation = false
  # Assign IPv6 address on intra subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch
  intra_subnet_assign_ipv6_address_on_creation = false
  # Assign IPv6 address on redshift subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch
  redshift_subnet_assign_ipv6_address_on_creation = false
  # Should be true to enable ClassicLink for the VPC. Only valid in regions and accounts that support EC2 Classic.
  enable_classiclink = false
  # Assign IPv6 address on public subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch
  public_subnet_assign_ipv6_address_on_creation = false
  # Assign IPv6 address on database subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch
  database_subnet_assign_ipv6_address_on_creation = false
  # Should be true to enable ClassicLink DNS Support for the VPC. Only valid in regions and accounts that support EC2 Classic.
  enable_classiclink_dns_support = false
  # Assign IPv6 address on elasticache subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch
  elasticache_subnet_assign_ipv6_address_on_creation = false
}

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "5.0.0"
  # A list of subnets to associate with the load balancer. e.g. ['subnet-1a2b3c4d','subnet-1a2b3c4e','subnet-1a2b3c4f']
  subnets = []
  # The resource name prefix and Name tag of the load balancer.
  name_prefix = ""
  # The resource name and Name tag of the load balancer.
  name = ""
  # VPC id where the load balancer and other resources will be deployed.
  vpc_id = ""
}

module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.2.0"
  # Name of security group
  name = ""
  # ID of the VPC where to create security group
  vpc_id = ""
}
