# Security Group Resources for Auto-Scaling-Group

resource "aws_security_group" "asg_security_group" {
  name        = "demo-asg-security-group"
  description = "ASG Security Group"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "HTTP from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_security_group.id]
  }

  ingress {
    description     = "Allow SSH"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_security_group.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  /*
  egress {
    description      = "Rule to allow connections to database from any instances this security group is attached to"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = [aws_security_group.rds-sg.id]
    self             = false
  }*/

  tags = {
    Name = "demo-asg-security-group"
  }
}
