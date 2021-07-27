# create terraform module
module "vpc" {  # vpc just a name we can change it by own choice so it is desired name
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.2.0"
  # VPC basic details
 name = "VPC-terraform"
 cidr = "192.168.0.0/16"
  azs                 = ["us-east-1a", "us-east-1b"]
  private_subnets     = ["192.168.1.0/24", "192.168.2.0/24"]
  public_subnets      = ["192.168.3.0/24", "192.168.4.0/24"]
  # Database Subnets
  create_database_subnet_group = true
  create_database_subnet_route_table= true
  database_subnets    = ["192.168.5.0/24", "192.168.6.0/24"]
   
   #create_database_nat_gateway_route = true
  #create_database_internet_gateway_route = true
   
   # NAT Gateways - Outbound Communication
  enable_nat_gateway = true
  single_nat_gateway = true

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support = true

  public_subnet_tags = {
    Type = "public-subnets"
  }

  private_subnet_tags = {
    Type = "private-subnets"
  }

  database_subnet_tags = {
    Type = "database-subnets"
  }

  vpc_tags = {
    Name = "vpc-terraform"
  }
}

