
#AutoScalingGroup 
/*if the number of requests to the target groups increases, the Auto Scaling group will automatically scale the number 
of instances in the group up to handle the increased load. If the number of requests to the target groups decreases, 
the Auto Scaling group will automatically scale the number of instances in the group down to save costs.*/


resource "aws_autoscaling_group" "auto_scaling_group" {
  name             = "my-autoscaling-group"
  desired_capacity = var.autoscale_desired
  max_size         = var.autoscale_max
  min_size         = var.autoscale_min

  vpc_zone_identifier = flatten([
    aws_subnet.public_subnet.*.id,
  ])

  target_group_arns = [
    aws_lb_target_group.target_group.arn,
  ]

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = aws_launch_template.launch_template.latest_version
  }
}


# Launch Template and ASG Resources
resource "aws_launch_template" "launch_template" {
  name          = "demo-launch-template"
  image_id      = var.amiID
  instance_type = var.instance_type
  key_name      = "tf-key"


  network_interfaces {
    device_index    = 0
    security_groups = [aws_security_group.asg_security_group.id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "demo-asg-ec2"
    }
  }

  user_data = base64encode(file("user-data.sh"))
}