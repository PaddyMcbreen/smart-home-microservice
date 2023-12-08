
variable "min_size" {
    type = number 
    description = "The minimum number of instances you want"
}

variable "max_size" {
    type = number 
    description = "The maximum number of instances you want"
}

variable "desired_size" {
    type = number 
    description = "The desired number of isntances you want"
}

variable "health_check_grace_period" {
    type = number 
    description = "Time after instance comes into service before checking health"

}

variable "health_check_type" {
    type = string 
    description = "The type of health check type you want on your auto scaling group"
    default = "ELB"
}

variable "public_subnets_ids" {
    type = list(string) 
    description = "List of subnet IDs to launch resources in"
}


variable "instance_type" {
    type = string 
    description = "The instance type of your launch template"
}


variable "num_launchTemplates" {
    type = number 
    description = "The number of launch templates  you want to create"
    default = 3
}

variable "num_asg" {
    type = number
    description = "The number of auto scaling groups you want to create"
    default = 3
}

variable "lt_name" {
    type = list(string) 
    description = "A list of names for the launch template resource"
}

variable "image_id" {
    type = list(string)
    description = "A list of AMi ids for the launch template resource"
}

variable "key_name" {
    type = string 
    description = "The name of the key pair your want to use"
}

variable "name_asg" {
    type = list(string)
    description = "The names of the auto scaling groups created"
}


variable "instance_ids" {
    type = list(string) 
    description = "A list of ec2 IDs"
}

variable "ami_names" {
    type = list(string)
    description = "Names of AMIs"
}

variable "ami_names_rep" {
    type = list(string)
    description = "Names of AMIs"
}