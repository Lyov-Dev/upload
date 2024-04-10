

#DB instance path
resource "aws_security_group" "db_sec_group" {
  name        = "RDS_security_group"
  description = " RDS with no internet access"
  vpc_id      =  aws_vpc.main_vpc.id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    cidr_blocks =  ["10.0.0.0/16"]
  }
  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}


#PROD instance path
#create security group
resource "aws_security_group" "prod_security_group" {
  name        = "Prod ec2 security group"
  description = "Openning_ports"
  vpc_id      = aws_vpc.main_vpc.id

  dynamic "ingress" {
    for_each = ["80","443","22","3000","9090","8080"]
    content {
    from_port        = ingress.value
    to_port          = ingress.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
}
}
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
}
}