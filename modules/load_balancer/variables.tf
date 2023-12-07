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


variable "vpc_id" {
    type = string 
    description = "The ID of the vpc created in modules/vpc/main.tf"
}


variable "lb_listner_name" {
    type = string 
    description = "The name of the load-balance listner"
}

variable "num_targetGroups" {
    type = number 
    description = "The number of target groups you want to create"
    default = 3
}

variable "tg_name" {
    type = list(string)
    description = "The names of the target groups you created"
}

variable "tg_port" {
    type = number 
    description = "The port number for your target groups"
}

variable "tg_protocol" {
    type = string 
    description = "The protocol for your target groups"
}

variable "lb_port" {
    type = number 
    description = "The port number for your load balancer listner"
}

variable "lb_protocol" {
    type = string 
    description = "The protocol of your load balance listner"
}

# variable "path_values" {
#     type = list(string) 
#     description = "The paths to the microservices for each lb listner rule"
# }

# variable "num_listnerRules" {
#     type = number 
#     description = "The number of listner rules you want to create"
# }