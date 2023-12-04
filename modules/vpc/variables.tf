//name change
variable "name" {
  type = string
  default = "new-vpc"
}

// Public Subnets: 
variable "public_subnet_count" {
  type = number

  // Remove default value to ask for user input
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

  // Remove default value to ask for user input
  default = 3
}


// internet gateway option
variable "enable_internet_gateway" {
    type = bool
    default = false
}


