resource "aws_vpc" "roshan" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "roshan-vpc"
  }
}

resource "aws_subnet" "roshan-subnet" {
  vpc_id            = aws_vpc.roshan.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "roshan-subnet"
  }
}

resource "aws_internet_gateway" "roshan-gw" {
  vpc_id = aws_vpc.roshan.id

  tags = {
    Name = "roshan-gw"
  }
}

resource "aws_route_table" "roshan-route-table" {
  vpc_id = aws_vpc.roshan.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.roshan-gw.id
  }

  tags = {
    Name = "roshan-route-table"
  }
}

resource "aws_route_table_association" "roshan-route-table-association" {
  subnet_id      = aws_subnet.roshan-subnet.id
  route_table_id = aws_route_table.roshan-route-table.id
}