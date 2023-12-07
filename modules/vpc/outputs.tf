output "vpc_id" {
    value = aws_vpc.paddys_vpc.id
}

output "public_subnets_ids" {
  value = aws_subnet.public_subnets[*].id
}

