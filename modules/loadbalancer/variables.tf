variable "security_group_ids" {
    type = list(string)
    description = "A list of security group IDs for the load balancer"
}

variable "public_subnets_ids" {
    type = list(string)
    description = "A list of public subnets that your lb will connect to"
}

variable "lb_name" {
    type = string 
    description = "The name of your loadbalancer"
}
