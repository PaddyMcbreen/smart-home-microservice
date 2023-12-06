// Launch Templates For All Services Created:
resource "aws_launch_template" "launch_templates" {
  count = var.num_launchTemplates

  name = var.lt_name[count.index]
  image_id = var.image_id[count.index]
  
  instance_type = "t2.micro"
  key_name = var.key_name

  tags = {
    name = "${var.lt_name[count.index]}_lt"
  }
}

// Auto Scaling Group Setup:
resource "aws_autoscaling_group" "microservice_asg" {
  count = var.num_asg
  name = "${var.name_asg[count.index]}_asg"

  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_size

  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type

  force_delete              = false
  vpc_zone_identifier       = var.public_subnets_ids


    launch_template { 
    id      = aws_launch_template.launch_templates[count.index].id
    version = "$Latest"
  }
}


