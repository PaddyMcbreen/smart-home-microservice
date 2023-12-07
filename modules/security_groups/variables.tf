variable "vpc_id" {
    type = string 
    description = "The id of the VPC created in modules/vpc/main.tf"
}


variable "sg_name" {
    type = string 
    description = "The name of your security group"
}

  // HTTP ipv6 Ingress Settings:

variable "cidr_ipv6_ingress" {
    type = string 
    description = "The cidr block chosen for ipv6 for ingress routes"
}

variable "from_port_ipv6" {
    type = number 
    description = "The outgoing port number for ingress routes - ipv6"
}

variable "ip_protocol_ingress_ipv6" {
    type = string
    description = "The IP protocol chosen for ingress routes for ipv6"
}

variable "to_port_ipv6" {
    type = number 
    description = "The incoming port number for ingress routes - ipv6"
}


  // HTTP ipv4 Ingress Settings:

variable "cidr_ipv4_ingress" {
    type = string 
    description = "The cidr block chosen for ipv4 for ingress routes"
}

variable "from_port_ipv4" {
    type = number 
    description = "The outgoing port number for ingress routes - ipv4"
}

variable "ip_protocol_ingress_ipv4" {
    type = string
    description = "The IP protocol chosen for ingress routes for ipv4"
}

variable "to_port_ipv4" {
    type = number 
    description = "The incoming port number for ingress routes - ipv4"
}


  // Local Route ipv6 Settings:

variable "cidr_ipv6_local" { 
    type = string
    description = "The ipv6 cidr block for local routes"
}

variable "from_localPort_ipv6" { 
    type = number
    description = "The outgoing local port number for ipv6"
}

variable "ip_protocol_local_ipv6" { 
    type = string
    description = "The IP protocol for local routes with ipv6"
}

variable "to_localPort_ipv6" { 
    type = number
    description = "The incoming local port number for ipv6"
}


  // Local Route ipv4 Settings:

variable "cidr_ipv4_local" { 
    type = string
    description = "The ipv4 cidr block for local routes"
}

variable "from_localPort_ipv4" { 
    type = number
    description = "The outgoing local port number for ipv4"
}

variable "ip_protocol_local_ipv4" { 
    type = string
    description = "The IP protocol for local routes with ipv4"
}

variable "to_localPort_ipv4" { 
    type = number
    description = "The incoming local port number for ipv4"
}


  // ipv6 Egress Settings:

  variable "cidr_ipv6_egress" {
    type = string 
    description = "The egress cidr block for ipv6"
  }

   variable "ip_protocol_egress_ipv6" {
    type = string 
    description = "The ip protocol for egress routes - ipv6"
  }



  // ipv4 Egress Settings:

    variable "cidr_ipv4_egress" {
    type = string 
    description = "The egress cidr block for ipv4"
  }

   variable "ip_protocol_egress_ipv4" {
    type = string 
    description = "The ip protocol for egress routes - ipv4"
  }


  // SSH Ingress Settings:

  variable "from_port_ssh" {
    type = number 
    description = "The outgoing port number for ingress SSH"
  }

  variable "ip_protocol_ssh" {
    type = string 
    description = "The IP protocol used for SSH ingress "
  }
  
  variable "to_port_ssh" {
    type = number 
    description = "The incoming port number for ingress SSH"
  }
