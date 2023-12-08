// VPC Module
module "vpc" {
  source = "./modules/vpc"

  // VPC Settings:
  name       = var.name
  azs_config = var.azs_config

  // Public Subnet Settings:
  publicSubnets_name  = var.publicSubnets_name
  public_subnet_count = var.public_subnet_count

  // Private Subnet Settings:
  privateSubnets_name  = var.privateSubnets_name
  private_subnet_count = var.private_subnet_count

  // Internet Gateway Settings:
  enable_internet_gateway = var.enable_internet_gateway
  ig_name                 = var.ig_name

  // Nat Internet Gateway Settings:
  nat_name = var.nat_name

  // Public Route Table Settings:
  public_rt_name = var.public_rt_name

  // Priavte Route Table Settings:
  private_rt_names = var.private_rt_names
}


// Security Module
module "security_group" {
  source = "./modules/security_groups"

  // Security Group Settings:
  vpc_id  = module.vpc.vpc_id
  sg_name = var.sg_name

  // HTTP ipv6 Ingress Settings:
  cidr_ipv6_ingress        = var.cidr_ipv6_ingress
  from_port_ipv6           = var.from_port_ipv6
  ip_protocol_ingress_ipv6 = var.ip_protocol_ingress_ipv6
  to_port_ipv6             = var.to_port_ipv6

  // HTTP ipv4 Ingress Settings:
  cidr_ipv4_ingress        = var.cidr_ipv4_ingress
  from_port_ipv4           = var.from_port_ipv4
  ip_protocol_ingress_ipv4 = var.ip_protocol_ingress_ipv4
  to_port_ipv4             = var.to_port_ipv4

  // Local Route ipv6 Settings:
  cidr_ipv6_local        = var.cidr_ipv6_local
  from_localPort_ipv6    = var.from_localPort_ipv6
  ip_protocol_local_ipv6 = var.ip_protocol_local_ipv6
  to_localPort_ipv6      = var.to_localPort_ipv6

  // Local Route ipv4 Settings:
  cidr_ipv4_local        = var.cidr_ipv4_local
  from_localPort_ipv4    = var.from_localPort_ipv4
  ip_protocol_local_ipv4 = var.ip_protocol_local_ipv4
  to_localPort_ipv4      = var.to_localPort_ipv4

  // ipv6 Egress Settings:
  cidr_ipv6_egress        = var.cidr_ipv6_egress
  ip_protocol_egress_ipv6 = var.ip_protocol_egress_ipv6

  // ipv4 Egress Settings:
  cidr_ipv4_egress        = var.cidr_ipv4_egress
  ip_protocol_egress_ipv4 = var.ip_protocol_egress_ipv4

  // SSH Ingress Settings:
  from_port_ssh   = var.from_port_ssh
  ip_protocol_ssh = var.ip_protocol_ssh
  to_port_ssh     = var.to_port_ssh
}


// Microservices Module
module "microservices" {
  source = "./modules/microservices"

  // Key Settings:
  key_name = var.key_name

  // AMI Settings:
  num_ami        = var.num_ami
  ami_names      = var.ami_names
  ami_filterName = var.ami_filterName

  // Ec2 Settings:
  num_ec2            = var.num_ec2
  ec2_names          = var.ec2_names
  instance_type      = var.instance_type
  security_group_ids = module.security_group.security_group_id
  public_subnets_ids = module.vpc.public_subnets_ids

  // DynamoDB Settings:
  dynamo_num  = var.dynamo_num
  dynamo_name = var.dynamo_name
  read_cap    = var.read_cap
  write_cap   = var.write_cap
}


// Loadbalancer Module
module "load_balancer" {
  source = "./modules/load_balancer"

  // Load-Balancer Settings:
  lb_name            = var.lb_name
  public_subnets_ids = module.vpc.public_subnets_ids
  security_group_ids = [module.security_group.security_group_id]

  // Target Group Settings:
  vpc_id           = module.vpc.vpc_id
  tg_name          = var.tg_name
  tg_port          = var.tg_port
  tg_protocol      = var.tg_protocol
  num_targetGroups = var.num_targetGroups

  // Target Group Attachment Settings:
  num_ec2      = [module.microservices.num_ec2]
  instance_ids = module.microservices.instance_ids

  // Lb Listner Settings:
  lb_listner_name = var.lb_listner_name
  lb_port         = var.lb_port
  lb_protocol     = var.lb_protocol
}


// Auto_scaling Module
module "auto_scaling" {
  source = "./modules/auto_scaling"

  // Auto Scaling Settings:
  name_asg                  = var.name_asg
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_size              = var.desired_size
  health_check_grace_period = var.health_check_grace_period
  public_subnets_ids        = module.vpc.public_subnets_ids

  // AMI Stuff:
  ami_names     = var.ami_names
  ami_names_rep = var.ami_names_rep

  num_launchTemplates = var.num_launchTemplates
  num_asg             = var.num_asg

  // Launch Template Settings:
  instance_type = var.instance_type

  // Ec2 AMI Link:
  instance_ids = module.microservices.instance_ids

  // lt_name array and image_id array must match the num_launchTemplates amount
  lt_name  = var.lt_name
  image_id = var.image_id

  key_name = module.microservices.key_name
}

