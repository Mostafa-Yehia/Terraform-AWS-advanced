resource "aws_subnet" "mostafa_private_subnet_two" {
  vpc_id     = aws_vpc.mostafa_vpc.id
  cidr_block = var.private_subnet_two_cidr
  availability_zone = var.az2
  map_public_ip_on_launch = false
  tags = {
    Name = "mostafa_private_subnet_two"
  }
}
