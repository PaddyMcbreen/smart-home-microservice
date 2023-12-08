output "instance_type" {
    value = var.instance_type
}

output "public_subnets_ids" {
    value = var.public_subnets_ids[0]
}

output "security_group_ids" {
    value = [var.security_group_ids]
}

output "key_name" {
    value = var.key_name
}

output "instance_ids" {
    value = aws_instance.microservices[*].id
}

output "num_ec2" {
    value = var.num_ec2
}
