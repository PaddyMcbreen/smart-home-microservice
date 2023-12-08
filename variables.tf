// VPC Module Variables:

//vpc name change
variable "name" {
  type = string
}

// Public Subnets: 
variable "public_subnet_count" {
  type = number
}

// azs config:
variable "azs_config" {
  type = string
}

// Private Subnets: 
variable "private_subnet_count" {
  type = number
}


// internet gateway option
variable "enable_internet_gateway" {
  type = bool
}

variable "publicSubnets_name" {
  type        = string
  description = "The names of your public subnets"
}

variable "privateSubnets_name" {
  type        = string
  description = "The names of your private subnets"
}

variable "ig_name" {
  type        = string
  description = "The name of your internet gateway"
}

variable "public_rt_name" {
  type        = string
  description = "The name of your public route table"
}


variable "private_rt_names" {
  type        = string
  description = "The names of your private route table"
}

variable "nat_name" {
  type        = string
  description = "The Name of your nat internet gateway"
}



variable "sg_name" {
  type        = string
  description = "The name of your security group"
}

// HTTP ipv6 Ingress Settings:

variable "cidr_ipv6_ingress" {
  type        = string
  description = "The cidr block chosen for ipv6 for ingress routes"
}

variable "from_port_ipv6" {
  type        = number
  description = "The outgoing port number for ingress routes - ipv6"
}

variable "ip_protocol_ingress_ipv6" {
  type        = string
  description = "The IP protocol chosen for ingress routes for ipv6"
}

variable "to_port_ipv6" {
  type        = number
  description = "The incoming port number for ingress routes - ipv6"
}


// HTTP ipv4 Ingress Settings:

variable "cidr_ipv4_ingress" {
  type        = string
  description = "The cidr block chosen for ipv4 for ingress routes"
}

variable "from_port_ipv4" {
  type        = number
  description = "The outgoing port number for ingress routes - ipv4"
}

variable "ip_protocol_ingress_ipv4" {
  type        = string
  description = "The IP protocol chosen for ingress routes for ipv4"
}

variable "to_port_ipv4" {
  type        = number
  description = "The incoming port number for ingress routes - ipv4"
}


// Local Route ipv6 Settings:

variable "cidr_ipv6_local" {
  type        = string
  description = "The ipv6 cidr block for local routes"
}

variable "from_localPort_ipv6" {
  type        = number
  description = "The outgoing local port number for ipv6"
}

variable "ip_protocol_local_ipv6" {
  type        = string
  description = "The IP protocol for local routes with ipv6"
}

variable "to_localPort_ipv6" {
  type        = number
  description = "The incoming local port number for ipv6"
}


// Local Route ipv4 Settings:

variable "cidr_ipv4_local" {
  type        = string
  description = "The ipv4 cidr block for local routes"
}

variable "from_localPort_ipv4" {
  type        = number
  description = "The outgoing local port number for ipv4"
}

variable "ip_protocol_local_ipv4" {
  type        = string
  description = "The IP protocol for local routes with ipv4"
}

variable "to_localPort_ipv4" {
  type        = number
  description = "The incoming local port number for ipv4"
}


// ipv6 Egress Settings:

variable "cidr_ipv6_egress" {
  type        = string
  description = "The egress cidr block for ipv6"
}

variable "ip_protocol_egress_ipv6" {
  type        = string
  description = "The ip protocol for egress routes - ipv6"
}



// ipv4 Egress Settings:

variable "cidr_ipv4_egress" {
  type        = string
  description = "The egress cidr block for ipv4"
}

variable "ip_protocol_egress_ipv4" {
  type        = string
  description = "The ip protocol for egress routes - ipv4"
}


// SSH Ingress Settings:

variable "from_port_ssh" {
  type        = number
  description = "The outgoing port number for ingress SSH"
}

variable "ip_protocol_ssh" {
  type        = string
  description = "The IP protocol used for SSH ingress "
}

variable "to_port_ssh" {
  type        = number
  description = "The incoming port number for ingress SSH"
}


// Microservice Module variables:

variable "instance_type" {
  type        = string
  description = "The type of instance you want to use"
}


variable "key_name" {
  type        = string
  description = "The key name you want to use for this instance"
  default     = "terraform-project-key"
}

variable "num_ami" {
  type        = number
  description = "The number of AMIs you want to create (matches the number of microservices)"
}

variable "ami_names" {
  type        = list(string)
  description = "The names of the AMIs created"
}

variable "ec2_names" {
  type        = list(string)
  description = "The names of the Ec2 Instances created"
}

variable "dynamo_num" {
  type        = number
  description = "The number of DynamoDB tables you want to create"
}

variable "dynamo_name" {
  type        = list(string)
  description = "The names of your DynamoDB tables"
}

variable "num_ec2" {
  type        = number
  description = "The number of Ec2 instances you want to create for your microservices"
}

variable "read_cap" {
  type        = number
  description = "The read capacity given to the users for the DynamoDB tables"
}

variable "write_cap" {
  type        = number
  description = "The write capacity given to the users for the DynamoDB tables"
}

variable "ami_filterName" {
  type        = string
  description = "The filter name for your AMI"
}




// load Balancer Module Variables:


variable "lb_name" {
  type        = string
  description = "The name of your loadbalancer"
}

variable "lb_listner_name" {
  type        = string
  description = "The name of the load-balance listner"
}

variable "num_targetGroups" {
  type        = number
  description = "The number of target groups you want to create"
}

variable "tg_name" {
  type        = list(string)
  description = "The names of the target groups you created"
}

variable "tg_port" {
  type        = number
  description = "The port number for your target groups"
}

variable "tg_protocol" {
  type        = string
  description = "The protocol for your target groups"
}

variable "lb_port" {
  type        = number
  description = "The port number for your load balancer listner"
}

variable "lb_protocol" {
  type        = string
  description = "The protocol of your load balance listner"
}



// Auto-Scaling Module Variables:


variable "min_size" {
  type        = number
  description = "The minimum number of instances you want"
}

variable "max_size" {
  type        = number
  description = "The maximum number of instances you want"
}

variable "desired_size" {
  type        = number
  description = "The desired number of isntances you want"
}

variable "health_check_grace_period" {
  type        = number
  description = "Time after instance comes into service before checking health"

}

variable "health_check_type" {
  type        = string
  description = "The type of health check type you want on your auto scaling group"
  default     = "ELB"
}


variable "num_launchTemplates" {
  type        = number
  description = "The number of launch templates  you want to create"
}

variable "num_asg" {
  type        = number
  description = "The number of auto scaling groups you want to create"
}

variable "lt_name" {
  type        = list(string)
  description = "A list of names for the launch template resource"
}

variable "image_id" {
  type        = list(string)
  description = "A list of AMi ids for the launch template resource"
}


variable "name_asg" {
  type        = list(string)
  description = "The names of the auto scaling groups created"
}



variable "ami_names_rep" {
  type        = list(string)
  description = "Rep names of AMIs"
}