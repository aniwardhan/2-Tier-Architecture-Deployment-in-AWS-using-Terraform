# Security Group Resources for Application Load Balancer

resource "aws_security_group" "alb_security_group" {
  name        = "demo-alb-security-group"
  description = "Application Load Balancer Security Group"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "HTTP from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS from Internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  /*
  ingress {
    description = "Allow Port 81 from internet"
    from_port   = 81
    to_port     = 81
    protocol    = 6
    cidr_blocks = ["0.0.0.0/0"]
  }
*/
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "demo-alb-security-group"
  }
}
