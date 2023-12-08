// AMI Setup for all microservices:
data "aws_ami" "ubuntu" {
  // Gets the latest ubuntu AMI ID
  most_recent = true
  count = var.num_ami

  filter {
    name   = var.ami_filterName
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20231127"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical's ID - creators of the Ubuntu AMI
}


// Ec2 Instance for all microservices:
resource "aws_instance" "microservices" {

count = var.num_ec2
instance_type               = var.instance_type
subnet_id                   = var.public_subnets_ids[0]
vpc_security_group_ids      = [var.security_group_ids]
ami                         = data.aws_ami.ubuntu[count.index].id
associate_public_ip_address = true
key_name = var.key_name

tags = {
    Name = "${var.ec2_names[count.index]}-instance"
  }
}


// DynamoDB Setup for all microservices:
resource "aws_dynamodb_table" "microservices_table" {

count = var.dynamo_num
name           = "${var.dynamo_name[count.index]}-table"
read_capacity  = var.read_cap
write_capacity = var.write_cap
hash_key       =  "id"


   attribute {
    name = "id"
    type = "N"
  }
} 