
// Public Subnets: 
variable "public-subnet-count" {
  type = number

  // Remove default value to ask for user input
  default = 3
}


// Private Subnets: 
variable "private-subnet-count" {
  type = number

  // Remove default value to ask for user input
  default = 3
}

// Instance type:
variable "instance_type" {
  type        = string
  description = "The instance type of EC2 to create"
  default     = "t2.micro"
}
