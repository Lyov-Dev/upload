#public route
resource "aws_route_table" "public_route" {
 vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
   Name = var.route_table_name
  }
}

#Prod EC2 path
resource "aws_route_table_association" "prod-rtb-association" {
  subnet_id      = aws_subnet.prod_subnet.id
  route_table_id = aws_route_table.public_route.id
}

#cluster path

resource "aws_route_table_association" "cluster-public-us-east-1b" {
  subnet_id      = aws_subnet.cluster-public-us-east-1b.id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table_association" "cluster-public-us-east-1c" {
  subnet_id      = aws_subnet.cluster-public-us-east-1c.id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table_association" "cluster-public-us-east-1d" {
  subnet_id      = aws_subnet.cluster-public-us-east-1d.id
  route_table_id = aws_route_table.public_route.id
}