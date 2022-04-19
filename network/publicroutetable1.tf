resource "aws_route_table" "mostafa_public_route_one" {
  vpc_id = aws_vpc.mostafa_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mostafa_igw.id
  }
  tags = {
    Name = "mostafa_public_route_one"
  }
}