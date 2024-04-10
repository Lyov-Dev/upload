#create subnet
#instance path
resource "aws_subnet" "prod_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "prod_pb_subnet-us-east1-a"
  }
}

##################################################
#cluster path
resource "aws_subnet" "cluster-public-us-east-1b" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                             = "cluster-public-us-east-1b"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned" 
    "kubernetes.io/role/elb"           = 1
  }
}

resource "aws_subnet" "cluster-public-us-east-1c" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    "Name"               = "cluster-public-us-east-1c"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned" 
    "kubernetes.io/role/elb"           = 1
  }
}

resource "aws_subnet" "cluster-public-us-east-1d" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "us-east-1d"
  map_public_ip_on_launch = true

  tags = {
    "Name"                             = "cluster-public-us-east-1d"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned" 
    "kubernetes.io/role/elb"           = 1
  }
}

#DB PRIVATE SUBNETS
resource "aws_subnet" "DB-private-us-east-1e" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.5.0/24"
  availability_zone       = "us-east-1e"
  tags = {
    "Name"                             = "DB-private-us-east-1e"
  

  }
}

resource "aws_subnet" "DB-private-us-east-1f" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.6.0/24"
  availability_zone       = "us-east-1f"

  tags = {
    "Name"                             = "DB-private-us-east-1f" 
  }
}