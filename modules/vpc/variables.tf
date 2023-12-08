# //name change
variable "name" {
  type = string
  default = "new-vpc"
}

// Public Subnets: 
variable "public_subnet_count" {
  type = number
  default = 3
}

// azs config:
variable "azs_config" {
  type    = string
  default = "eu-west-2" // London
}

// Private Subnets: 
variable "private_subnet_count" {
  type = number
  default = 3
}


// internet gateway option
variable "enable_internet_gateway" {
    type = bool
    default = false
}


variable "publicSubnets_name" {
  type = string 
  description = "The names of your public subnets"
}

variable "privateSubnets_name" {
  type = string 
  description = "The names of your private subnets"
}

variable "ig_name" {
  type = string 
  description = "The name of your internet gateway"
}

variable "public_rt_name" {
  type = string 
  description = "The name of your public route table"
}


variable "private_rt_names" {
  type = string 
  description = "The names of your private route table"
}

variable "nat_name" {
  type = string 
  description = "The Name of your nat internet gateway"
}









 