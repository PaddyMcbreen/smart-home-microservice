variable "vpc_id" {
    type = string 
    description = "The id of the VPC created in modules/vpc/main.tf"
}

variable "security_group_name" {
    type = string 
    description = "The given name to the security group"
}