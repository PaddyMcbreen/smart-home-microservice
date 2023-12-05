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

  security_group_name = "microservices_sg"
}


// Microservices Module
module "microservices" {
  source = "./modules/microservices"

  name     = "new_ami"
  key_name = "terraform-project-key"

  instance_type      = var.instance_type
  security_group_ids = module.security_group.security_group_id
  public_subnets_ids = module.vpc.public_subnets_ids
}


// Loadbalancer Module
module "load_balancer" {
  source = "./modules/load_balancer"

  lb_name            = "microservicesLB"
  public_subnets_ids = module.vpc.public_subnets_ids
  security_group_ids = [module.security_group.security_group_id]

  // Target Group Settings:
  vpc_id = module.vpc.vpc_id

  // Lb Listner Settings:
  lb_listner_name = "lb_listner"


}


// Auto_scaling Module
# module "auto_scaling" {
#   source = "./modules/auto_scaling"

#   // Auto Scaling Settings:
#   name = "microservice_asg"
#   min_size = 3
#   max_size = 9
#   desired_size = 3
#   health_check_grace_period = 300

#   public_subnets_ids = module.vpc.public_subnets_ids
#   lb_name = [module.load_balancer.lb_name]

#   // Launch Template Settings:
#   instance_type = "t2.micro"
#   image_id = module.microservices.image_id
# }