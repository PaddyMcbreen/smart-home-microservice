// VPC Module
module "vpc" {
  source = "./modules/vpc"

  name = "new-vpc"

  azs_config = "eu-west-2"

  public_subnet_count  = 3
  private_subnet_count = 3

  enable_internet_gateway = true
}


// Security Module
module "security_group" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id

  security_group_name = "new_security_group"
}


module "microservices" {
  source = "./modules/microservices"

  name = "new_ami"
  key_name = "terraform-project-key"

  instance_type      = var.instance_type
  security_group_id  = module.security_group.security_group_id
  public_subnets_ids = module.vpc.public_subnets_ids
}