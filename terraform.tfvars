// ------------------------------------------------------- //
// VPC Module:
// ------------------------------------------------------- //

// VPC Settings:
name       = "new-vpc"
azs_config = "eu-west-2"

// Public Subnet Settings:
publicSubnets_name  = "public-subnet"
public_subnet_count = 3

// Private Subnet Settings:
privateSubnets_name  = "private-subnet"
private_subnet_count = 3

// Internet Gateway Settings:
enable_internet_gateway = true
ig_name                 = "internet-gateway"

// Nat Internet Gateway Settings:
nat_name = "nat-internet-gateway"

// Public Route Table Settings:
public_rt_name = "public-route-table"

// Priavte Route Table Settings:
private_rt_names = "private-route-table"




// ------------------------------------------------------- //
// Secuirty Module:
// ------------------------------------------------------- //

// Security Group Settings:
sg_name = "microservice_sg"

// HTTP ipv6 Ingress Settings:
cidr_ipv6_ingress        = "::/0"
from_port_ipv6           = 80
ip_protocol_ingress_ipv6 = "tcp"
to_port_ipv6             = 80

// HTTP ipv4 Ingress Settings:
cidr_ipv4_ingress        = "0.0.0.0/0"
from_port_ipv4           = 80
ip_protocol_ingress_ipv4 = "tcp"
to_port_ipv4             = 80

// Local Route ipv6 Settings:
cidr_ipv6_local        = "::/0"
from_localPort_ipv6    = 3000
ip_protocol_local_ipv6 = "tcp"
to_localPort_ipv6      = 3000

// Local Route ipv4 Settings:
cidr_ipv4_local        = "0.0.0.0/0"
from_localPort_ipv4    = 3000
ip_protocol_local_ipv4 = "tcp"
to_localPort_ipv4      = 3000

// ipv6 Egress Settings:
cidr_ipv6_egress        = "::/0"
ip_protocol_egress_ipv6 = "-1"

// ipv4 Egress Settings:
cidr_ipv4_egress        = "0.0.0.0/0"
ip_protocol_egress_ipv4 = "-1"

// SSH Ingress Settings:
from_port_ssh   = 22
ip_protocol_ssh = "tcp"
to_port_ssh     = 22




// ------------------------------------------------------- //
// Microservices Module:
// ------------------------------------------------------- //

// Key Settings:
key_name = "terraform-project-key"

// AMI Settings:
num_ami        = 3
ami_names      = ["lighting", "heating", "status"]
ami_names_rep  = ["lighting_clone", "heating_clone", "status_clone"]
ami_filterName = "name"

// Ec2 Settings:
num_ec2   = 3
ec2_names = ["lighting", "heating", "status"]

// DynamoDB Settings:
dynamo_num  = 2
dynamo_name = ["lighting", "heating"]
read_cap    = 20
write_cap   = 20



// ------------------------------------------------------- //
// Load-Balancer Module:
// ------------------------------------------------------- //

// Load-Balancer Settings:
lb_name = "microservicesLB"

// Target Group Settings:
tg_name          = ["lighting", "heating", "status"]
tg_port          = 3000
tg_protocol      = "HTTP"
num_targetGroups = 3


// Lb Listner Settings:
lb_listner_name = "lb_listner"
lb_port         = 80
lb_protocol     = "HTTP"



// ------------------------------------------------------- //
// Auto-Scaling Module:
// ------------------------------------------------------- //

// Auto Scaling Settings:
name_asg                  = ["lighting", "heating", "status"]
min_size                  = 1
max_size                  = 2
desired_size              = 1
health_check_grace_period = 300
num_launchTemplates       = 3
num_asg                   = 3

// Launch Template Settings:
instance_type = "t2.micro"

// lt_name array and image_id array must match the num_launchTemplates amount
lt_name  = ["lighting", "heating", "status"]
image_id = ["ami-08ec351898b2d71a9", "ami-08ec351898b2d71a9", "ami-08ec351898b2d71a9"]
