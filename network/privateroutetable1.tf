resource "aws_route_table" "mostafa_private_route_one" {
  vpc_id = aws_vpc.mostafa_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat1.id
  }


  tags = {
    Name = "mostafa_private_route_one"
  }
}