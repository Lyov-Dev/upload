
resource "aws_db_subnet_group" "db_subnet" {
  name       = "db_subnet"
  subnet_ids = [aws_subnet.DB-private-us-east-1e.id, aws_subnet.DB-private-us-east-1f.id]

  tags = {
    Name = "My DB subnet group"
  }
}


resource "aws_db_parameter_group" "param-group" {
  name        = "param-group"
  description = "RDS parameter group for postgres"
  family      = "postgres12"
  parameter {
    name  = "log_statement"
    value = "none"
  }
  
}


resource "aws_db_instance" "rds-instance"{
  allocated_storage    = 20
  identifier           = "rds-website"
  engine               = "postgres"
  storage_type         = "gp2"
  engine_version       = "12"
  instance_class       = "db.t3.micro"
  db_name              = "djangoproject"
  username             = "djangoproject"
  password             = var.rds_password
  db_subnet_group_name = aws_db_subnet_group.db_subnet.id
  vpc_security_group_ids = ["${aws_security_group.db_sec_group.id}"]
  publicly_accessible    = false
  skip_final_snapshot    = true

   tags = {
    Name = "jango-rds"
   }
}

 

