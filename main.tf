// VPC Module
module "vpc" {
  source = "./modules/vpc"

  // VPC Settings:
  name = "new-vpc"
  azs_config      = "eu-west-2"

  // Public Subnet Settings:
  publicSubnets_name = "public-subnet"
  public_subnet_count = 3

  // Private Subnet Settings:
  privateSubnets_name = "private-subnet"
  private_subnet_count = 3

  // Internet Gateway Settings:
  enable_internet_gateway = true
  ig_name = "internet-gateway"

  // Nat Internet Gateway Settings:
  nat_name = "nat-internet-gateway"

  // Public Route Table Settings:
  public_rt_name = "public-route-table"

  // Priavte Route Table Settings:
  private_rt_names = "private-route-table"
}