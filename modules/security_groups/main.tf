data "http" "myipaddr" {
   url = "http://icanhazip.com"
}

// Security Group
resource "aws_security_group" "security_group" {
  name        = "security_group"
  description = "security group for subnets"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.security_group_name
  }
}

// https route for ipv6
resource "aws_vpc_security_group_ingress_rule" "http_ipv6" {
  security_group_id = aws_security_group.security_group.id

  cidr_ipv6   = "::/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

// http route for ipv4
resource "aws_vpc_security_group_ingress_rule" "http_ipv4" {
  security_group_id = aws_security_group.security_group.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

// local route for ipv6
resource "aws_vpc_security_group_ingress_rule" "local_port_ipv6" {
  security_group_id = aws_security_group.security_group.id

  cidr_ipv6   = "::/0"
  from_port   = 3000
  ip_protocol = "tcp"
  to_port     = 3000
}

// local route for ipv4
resource "aws_vpc_security_group_ingress_rule" "local_port_ipv4" {
  security_group_id = aws_security_group.security_group.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 3000
  ip_protocol = "tcp"
  to_port     = 3000
}

// egress rule - ipv6
resource "aws_vpc_security_group_egress_rule" "outgoing_ipv6" {
  security_group_id = aws_security_group.security_group.id

  cidr_ipv6   = "::/0"
  ip_protocol = "-1"
}

// egress rule - ipv4
resource "aws_vpc_security_group_egress_rule" "outgoing_ipv4" {
  security_group_id = aws_security_group.security_group.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}

// ssh ingress rule
resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.security_group.id

  cidr_ipv4   = "${chomp(data.http.myipaddr.response_body)}/32"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}