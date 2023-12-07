data "http" "myipaddr" {
   url = "http://icanhazip.com"
}

// Security Group
resource "aws_security_group" "security_group" {
  name        = var.sg_name
  vpc_id      = var.vpc_id

  tags = {
    Name = "main_security_group"
  }
}

// https route for ipv6
resource "aws_vpc_security_group_ingress_rule" "http_ipv6" {
  security_group_id = aws_security_group.security_group.id

  cidr_ipv6   = var.cidr_ipv6_ingress
  from_port   = var.from_port_ipv6
  ip_protocol = var.ip_protocol_ingress_ipv6
  to_port     = var.to_port_ipv6
}

// http route for ipv4
resource "aws_vpc_security_group_ingress_rule" "http_ipv4" {
  security_group_id = aws_security_group.security_group.id

  cidr_ipv4   = var.cidr_ipv4_ingress
  from_port   = var.from_port_ipv4
  ip_protocol = var.ip_protocol_ingress_ipv4
  to_port     = var.to_port_ipv4
}

// local route for ipv6
resource "aws_vpc_security_group_ingress_rule" "local_port_ipv6" {
  security_group_id = aws_security_group.security_group.id

  cidr_ipv6   = var.cidr_ipv6_local
  from_port   = var.from_localPort_ipv6
  ip_protocol = var.ip_protocol_local_ipv6
  to_port     = var.to_localPort_ipv6
}

// local route for ipv4
resource "aws_vpc_security_group_ingress_rule" "local_port_ipv4" {
  security_group_id = aws_security_group.security_group.id

  cidr_ipv4   = var.cidr_ipv4_local
  from_port   = var.from_localPort_ipv4
  ip_protocol = var.ip_protocol_local_ipv4
  to_port     = var.to_localPort_ipv4
}

// egress rule - ipv6
resource "aws_vpc_security_group_egress_rule" "outgoing_ipv6" {
  security_group_id = aws_security_group.security_group.id

  cidr_ipv6   = var.cidr_ipv6_egress
  ip_protocol = var.ip_protocol_egress_ipv6
}

// egress rule - ipv4
resource "aws_vpc_security_group_egress_rule" "outgoing_ipv4" {
  security_group_id = aws_security_group.security_group.id

  cidr_ipv4   = var.cidr_ipv4_egress
  ip_protocol = var.ip_protocol_egress_ipv4
}

// ssh ingress rule
resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.security_group.id

  cidr_ipv4   = "${chomp(data.http.myipaddr.response_body)}/32"
  from_port   = var.from_port_ssh
  ip_protocol = var.ip_protocol_ssh
  to_port     = var.to_port_ssh
}