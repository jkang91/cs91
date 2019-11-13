# Set Provider to AWS and Region
provider "aws" {
  region = "us-east-1"
}
#e91-a3-main-vpc
#Main VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Virtual Private Cloud"
  }
}

#Public Subnets
resource "aws_subnet" "e91-a3-public-subnet-1" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"
  tags = {
    Name = "Public Subnet 1"
  }
}

resource "aws_subnet" "e91-a3-public-subnet-2" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1b"
  tags = {
    Name = "Public Subnet 2"
  }
}

#Internet Gateway
resource "aws_internet_gateway" "e91-a3-igw" {
  vpc_id = "${aws_vpc.main.id}"
  tags = {
    Name = "Main VPC Internet Gateway"
  }
}

#Routing Table
resource "aws_route_table" "e91-a3-rt" {
  vpc_id = "${aws_vpc.main.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.e91-a3-igw.id}"
  }
  tags = {
    Name = "Main Routing Table"
  }
}

#Routing Table Association
resource "aws_route_table_association" "e91-rta-1" {
  subnet_id = "${aws_subnet.e91-a3-public-subnet-1.id}"
  route_table_id = "${aws_route_table.e91-a3-rt.id}"
}

resource "aws_route_table_association" "e91-rta-2" {
  subnet_id = "${aws_subnet.e91-a3-public-subnet-2.id}"
  route_table_id = "${aws_route_table.e91-a3-rt.id}"
}
