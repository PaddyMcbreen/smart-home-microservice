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

variable "num_ami" {
    type = number 
    description = "The number of AMIs you want to create (matches the number of microservices)"
}

variable "ami_names" {
    type = list(string) 
    description = "The names of the AMIs created"
}

variable "ec2_names" {
    type = list(string) 
    description = "The names of the Ec2 Instances created"
}

variable "dynamo_num" {
    type = number 
    description = "The number of DynamoDB tables you want to create"
}

variable "dynamo_name" {
    type = list(string) 
    description = "The names of your DynamoDB tables"
}

variable "num_ec2" {
    type = number 
    description = "The number of Ec2 instances you want to create for your microservices"
}

variable "read_cap" {
    type = number 
    description = "The read capacity given to the users for the DynamoDB tables"
}

variable "write_cap" {
    type = number 
    description = "The write capacity given to the users for the DynamoDB tables"
}

variable "ami_filterName" {
    type = string 
    description = "The filter name for your AMI"
}