
output "asg" {
  value = aws_autoscaling_group.auto_scaling_group.availability_zones[*]
}

output "launchtemplate" {
  value = aws_launch_template.launch_template.default_version
}