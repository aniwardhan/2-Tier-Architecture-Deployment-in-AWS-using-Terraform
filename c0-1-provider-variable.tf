# Terraform Variables
# Local Values
locals {
  vpc_name    = "demo-vpc"
  environment = "development"
}

variable "aws_region" {
  description = "Define the AWS Region"
  type        = string
  default     = "us-east-1"
}

locals {
  az_names = ["${var.aws_region}a", "${var.aws_region}b"]
}