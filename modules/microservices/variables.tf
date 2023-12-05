variable "instance_type" {
    type = string 
    description = "The type of instance you want to use"
}

variable "public_subnets_ids" {
    type = list(string)
    description = "A list of public subnets to launch you ec2 instances in"
}

variable "security_group_ids" {
    type = string
    description = "The security group ID assigned to your instance"
}

variable "key_name" {
    type = string 
    description = "The key name you want to use for this instance"
    default = "terraform-project-key"
}

variable "name" {
    type = string 
    description = "The name of your AMI"
    default = "new_ami"
}