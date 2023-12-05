
// AMI Setup:
data "aws_ami" "ubuntu" {
  // Gets the latest ubuntu AMI ID
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical's ID - creators of the Ubuntu AMI
}


// Ec2 Instance for Stauts:
resource "aws_instance" "status_server" {

  instance_type               = var.instance_type
  subnet_id                   = var.public_subnets_ids[0]
  vpc_security_group_ids      = [var.security_group_id]
  ami                         = data.aws_ami.ubuntu.id
  associate_public_ip_address = true
  key_name = var.key_name

  tags = {
    Name = "Status_Ec2"
  }
}


// DynamoDB Setup:
resource "aws_dynamodb_table" "status_table" {
  name           = "status_table"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       =  "id"


   attribute {
    name = "id"
    type = "N"
  }
}