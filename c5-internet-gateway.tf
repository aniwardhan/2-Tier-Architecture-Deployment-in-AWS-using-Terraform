#Internet gateway
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name"        = "${local.environment}-igw"
    "Environment" = local.environment
  }
}

