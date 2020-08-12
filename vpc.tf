resource "aws_vpc" "main_VPC" {
  cidr_block       = "10.100.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Learning"
  }
}


resource "aws_subnet" "main_VPC_Subnet1_Public" {
  vpc_id     = aws_vpc.main_VPC.id
  cidr_block = "10.100.0.0/24"

  tags = {
    Name = "Learning"
  }
}


resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.main_VPC.id

  tags = {
    Name = "Learning"
  }
}


resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.main_VPC.id

  route {
    cidr_block = "10.100.0.0/24"
    gateway_id = aws_internet_gateway.IGW.id
  }


  tags = {
    Name = "Learning"
  }
}