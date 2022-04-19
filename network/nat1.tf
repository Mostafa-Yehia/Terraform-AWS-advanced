resource "aws_nat_gateway" "nat1" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.mostafa_public_subnet_one.id

  tags = {
    Name = "nat1"
  }
  
}
