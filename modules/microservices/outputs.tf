output "instance_type" {
    value = var.instance_type
}

output "public_subnets_ids" {
    value = var.public_subnets_ids[0]
}

output "security_group_id" {
    value = [var.security_group_id]
}

output "key_name" {
    value = var.key_name
}