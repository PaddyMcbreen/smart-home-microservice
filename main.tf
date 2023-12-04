// VPC Module
module "new-vpc" {
  source = "./modules/vpc"

  name = "new-vpc"

  azs_config      = "eu-west-2"

  public_subnet_count = 3
  private_subnet_count = 3

  enable_internet_gateway = true

}

// Security Module
module "security_group" {
  source = "./modules/security_groups"
  vpc_id = module.new-vpc.vpc_id
}