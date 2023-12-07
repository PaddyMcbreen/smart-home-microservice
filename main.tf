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

  // Security Group Settings:
  vpc_id = module.new-vpc.vpc_id
  sg_name = "microservice_sg"

  // HTTP ipv6 Ingress Settings:
  cidr_ipv6_ingress = "::/0"
  from_port_ipv6 = 80
  ip_protocol_ingress_ipv6 = "tcp"
  to_port_ipv6 = 80

  // HTTP ipv4 Ingress Settings:
  cidr_ipv4_ingress = "0.0.0.0/0"
  from_port_ipv4 = 80
  ip_protocol_ingress_ipv4 = "tcp"
  to_port_ipv4 = 80

  // Local Route ipv6 Settings:
  cidr_ipv6_local = "::/0"
  from_localPort_ipv6 = 3000
  ip_protocol_local_ipv6 = "tcp"
  to_localPort_ipv6 = 3000

  // Local Route ipv4 Settings:
  cidr_ipv4_local = "0.0.0.0/0"
  from_localPort_ipv4 = 3000
  ip_protocol_local_ipv4 = "tcp"
  to_localPort_ipv4 = 3000

  // ipv6 Egress Settings:
  cidr_ipv6_egress = "::/0"
  ip_protocol_egress_ipv6 = "-1"

  // ipv4 Egress Settings:
  cidr_ipv4_egress = "0.0.0.0/0"
  ip_protocol_egress_ipv4 = "-1"

  // SSH Ingress Settings:
  from_port_ssh = 22
  ip_protocol_ssh = "tcp"
  to_port_ssh = 22
}