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

  // AMI Settings:
  num_ami = 3
  ami_names = ["lighting", "heating", "status"]

  // Ec2 Settings:
  num_ec2 = 3
  ec2_names = ["lighting", "heating", "status"]

  // DynamoDB Settings:
  dynamo_num = 2
  dynamo_name = ["lighting", "heating"]
  read_cap = 20
  write_cap = 20
}


// Loadbalancer Module
module "load_balancer" {
  source = "./modules/load_balancer"

  lb_name            = "microservicesLB"
  public_subnets_ids = module.vpc.public_subnets_ids
  security_group_ids = [module.security_group.security_group_id]

  // Target Group Settings:
  vpc_id = module.vpc.vpc_id
  tg_name = ["lighting", "heating", "status"]
  tg_port = 3000
  tg_protocol = "HTTP"

  // Lb Listner Settings:
  lb_listner_name = "lb_listner"
  lb_port = 80
  lb_protocol = "HTTP"

  // Lb Listner Rule Settings:
  # path_values = ["/api/heating", "/api/status"]
  # num_listnerRules = 2
}


# // Auto_scaling Module
module "auto_scaling" {
  source = "./modules/auto_scaling"

  // Auto Scaling Settings:
  name_asg = ["lighting", "heating", "status"]
  min_size                  = 1
  max_size                  = 2
  desired_size              = 1
  health_check_grace_period = 300
  public_subnets_ids        = module.vpc.public_subnets_ids

  num_launchTemplates = 3
  num_asg             = 3

  // Launch Template Settings:
  instance_type = "t2.micro"

  // lt_name array and image_id array must match the num_launchTemplates amount
  lt_name  = ["lighting", "heating", "status"]
  image_id = ["ami-08ec351898b2d71a9", "ami-08ec351898b2d71a9", "ami-08ec351898b2d71a9"]

  key_name = module.microservices.key_name
}