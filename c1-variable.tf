
# Variables used for VPC

variable "vpc_cidr" {
  description = "VPC cidr block"
  type        = string
  default     = "172.16.0.0/16"
}

variable "public_subnets_cidr" {
  description = "Public Subnet cidr block"
  type        = list(string)
  default     = ["172.16.0.0/24", "172.16.1.0/24"]
}

variable "private_subnets_cidr" {
  description = "Private Subnet cidr block"
  type        = list(string)
  default     = ["172.16.10.0/24", "172.16.11.0/24"]
}

# Variables used for EC Instance
variable "amiID" {
  description = "Specify AMI ID"
  type        = string
  default     = "ami-0bb84b8ffd87024d8"
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string
  default     = "t2.micro"
}

# Variables used for RDS Database


variable "rds-username" {
  description = "Username for db instance"
  type        = string
  default     = "admin"
}

variable "rds-password" {
  description = "Password for db instance"
  type        = string
  default     = "admin123"
}

variable "rds-sg-name" {
  description = "Name for db security group"
  type        = string
  default     = "rds-security-group"
}