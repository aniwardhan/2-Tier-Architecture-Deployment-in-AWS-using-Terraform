
resource "aws_db_subnet_group" "db_subnet" {
  name       = "private-subnet-rds"
  subnet_ids = [aws_subnet.private_subnet[0].id, aws_subnet.private_subnet[1].id]
}


resource "aws_db_instance" "rds-database" {
  allocated_storage      = 10
  db_name                = "mydb"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  username               = var.rds-username
  password               = var.rds-password
  parameter_group_name   = "default.mysql5.7"
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name
  vpc_security_group_ids = [aws_security_group.rds-sg.id]
  publicly_accessible    = false
  skip_final_snapshot    = true
  multi_az               = true
}