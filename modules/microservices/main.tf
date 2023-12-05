// AMI Setup for all microservices:
data "aws_ami" "ubuntu" {
  // Gets the latest ubuntu AMI ID
  most_recent = true
  count = 3

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  tags = {
    Name = "${element(["lighting", "heating", "status"], count.index)}_ami"
  }

  owners = ["099720109477"] # Canonical's ID - creators of the Ubuntu AMI
}


// Ec2 Instance for all microservices:
resource "aws_instance" "microservices" {

count = 3
instance_type               = var.instance_type
subnet_id                   = var.public_subnets_ids[0]
vpc_security_group_ids      = [var.security_group_id]
ami                         = data.aws_ami.ubuntu[count.index].id
associate_public_ip_address = true
key_name = var.key_name

tags = {
    Name = "${element(["lighting", "heating", "status"], count.index)}_Ec2"
  }
}


// DynamoDB Setup for all microservices:
resource "aws_dynamodb_table" "microservices_table" {

count = 3
name           = "${element(["lighting", "heating", "status"], count.index)}_table"
billing_mode   = "PROVISIONED"
read_capacity  = 20
write_capacity = 20
hash_key       =  "id"


   attribute {
    name = "id"
    type = "N"
  }
}