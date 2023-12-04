// Main VPC creation
resource "aws_vpc" "paddys_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = var.name
  }
}

// Public subnet creations
resource "aws_subnet" "public_subnets" {
  vpc_id                  = aws_vpc.paddys_vpc.id
  map_public_ip_on_launch = true
  count                   = var.public_subnet_count

  cidr_block        = "10.0.${count.index * 5}.0/26"
  availability_zone = "${var.azs_config}${element(["a", "b", "c"], count.index)}"

  tags = {
    Name = "public-subnet-${var.azs_config}${element(["a", "b", "c"], count.index)}-${count.index + 1}"
  }
}


// Private subnet creations
resource "aws_subnet" "private_subnets" {
  vpc_id = aws_vpc.paddys_vpc.id
  count  = var.private_subnet_count

  cidr_block        = "10.0.${count.index * 5 + 128}.0/26"
  availability_zone = "${var.azs_config}${element(["a", "b", "c"], count.index)}"

  tags = {
    Name = "private-subnet-${var.azs_config}${element(["a", "b", "c"], count.index)}-${count.index + 1}"
  }
}


// Internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.paddys_vpc.id

  tags = {
    Name = "internet-gateway"
  }
}


// Public route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.paddys_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-route-table"
  }
}


// Route table associations for public subnets
resource "aws_route_table_association" "public_route" {
  count = var.public_subnet_count

  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}
