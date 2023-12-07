// Main VPC creation
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true


  tags = {
    Name = var.name
  }
}

// Public subnet creations
resource "aws_subnet" "public_subnets" {
  vpc_id                  = aws_vpc.main_vpc.id
  map_public_ip_on_launch = true
  count                   = var.public_subnet_count

  cidr_block        = "10.0.${count.index * 5}.0/26"
  availability_zone = "${var.azs_config}${element(["a", "b", "c"], count.index)}"

  tags = {
    Name = "${var.publicSubnets_name}-${var.azs_config}${element(["a", "b", "c"], count.index)}-${count.index + 1}"
  }
}


// Private subnet creations
resource "aws_subnet" "private_subnets" {
  vpc_id = aws_vpc.main_vpc.id
  count  = var.private_subnet_count

  cidr_block        = "10.0.${count.index * 5 + 128}.0/26"
  availability_zone = "${var.azs_config}${element(["a", "b", "c"], count.index)}"

  tags = {
    Name = "${var.privateSubnets_name}-${var.azs_config}${element(["a", "b", "c"], count.index)}-${count.index + 1}"
  }
}


// Internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = var.ig_name
  }
}

//  Nat gateway
resource "aws_nat_gateway" "ngw" {
  count = 1

  connectivity_type = "private"
  subnet_id         = aws_subnet.private_subnets[count.index].id

  tags = {
    Name = var.nat_name
  }
}


// Public route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.public_rt_name
  }
}

// Private route tables
resource "aws_route_table" "private-route-table" {
  count  = var.private_subnet_count
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw[count.index - count.index].id
  }

  tags = {
    Name = "${var.private_rt_names}-${var.azs_config}${element(["a", "b", "c"], count.index)}-${count.index + 1}"
  }
}


// Route table associations for public subnets
resource "aws_route_table_association" "public_route" {
  count = var.public_subnet_count

  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

// Route table associations for private subnets
resource "aws_route_table_association" "private-route" {
  count = var.private_subnet_count

  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private-route-table[count.index].id
}
