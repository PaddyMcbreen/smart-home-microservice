# Terraform Smart Home Microservice System

This Git repository contains Terraform code for deploying a smart home microservice system on AWS. The infrastructure is modularized into several components, including VPC, Security, Microservices, Load-Balancer, and Auto-Scaling. The code allows for easy customization through various variables.

## Table of Contents
- [VPC Module](#vpc-module)
- [Security Module](#security-module)
- [Microservices Module](#microservices-module)
- [Load-Balancer Module](#load-balancer-module)
- [Auto-Scaling Module](#auto-scaling-module)
- [How to Use](#how-to-use)
- [Customization](#customization)

## VPC Module

This module sets up the Virtual Private Cloud (VPC) along with public and private subnets. It includes configurations for internet and NAT gateways.

- **Variables:**
  - `name`: The name of the VPC.
  - `azs_config`: Availability Zones configuration.
  - `publicSubnets_name`: Name for public subnets.
  - `public_subnet_count`: Number of public subnets.
  - `privateSubnets_name`: Name for private subnets.
  - `private_subnet_count`: Number of private subnets.
  - `enable_internet_gateway`: Enable/disable internet gateway.
  - `ig_name`: Internet Gateway name.
  - `nat_name`: NAT Gateway name.
  - `public_rt_name`: Public route table name.
  - `private_rt_names`: Private route table name.

## Security Module

This module defines security groups and rules for the microservices, including HTTP, SSH, and local routes.

- **Variables:**
  - `sg_name`: Security Group name.
  - Ingress and Egress settings for IPv6 and IPv4.
  - `from_port_ssh`: SSH port settings.

## Microservices Module

This module deploys key pairs, Amazon Machine Images (AMIs), EC2 instances, and DynamoDB tables for microservices.

- **Variables:**
  - `key_name`: Key pair name.
  - AMI settings including names, replication names, filter names.
  - EC2 settings including names.
  - DynamoDB settings including names, read capacity, and write capacity.

## Load-Balancer Module

This module creates an Application Load Balancer, target groups, and listeners.

- **Variables:**
  - `lb_name`: Load Balancer name.
  - Target group settings including names, port, protocol.

## Auto-Scaling Module

This module configures auto-scaling groups and launch templates.

- **Variables:**
  - `name_asg`: Auto Scaling Group names.
  - `min_size`, `max_size`, `desired_size`: Auto Scaling Group size settings.
  - `health_check_grace_period`: Health check grace period.
  - `num_launchTemplates`: Number of launch templates.
  - `instance_type`: EC2 instance type.
  - `lt_name`: Launch template names.
  - `image_id`: AMI IDs for launch templates.

## How to Use

1. Clone this repository.
2. Navigate to the cloned directory.
3. Run `terraform init` to initialize your working directory.
4. Run `terraform apply` to apply the configuration and create the infrastructure.
5. Confirm with `yes` when prompted.

## Customization

Modify the variables in the respective modules to customize the infrastructure according to your requirements. Adjust the VPC, security, microservices, load balancer, and auto-scaling settings based on your specific needs. Ensure that you review and understand the changes you make before applying them.

Feel free to contribute, report issues, or suggest improvements to this Terraform codebase. Happy coding!




Terraform Graph displaying the infrastructure created within this git repository:
![terraform_graph](https://github.com/PaddyMcbreen/ce-terraform-project/assets/115741865/35480314-0c88-4eb8-a60c-8a3d69e51fd5)


