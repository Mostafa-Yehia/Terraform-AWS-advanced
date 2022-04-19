resource "aws_subnet" "mostafa_private_subnet_one" {
  vpc_id     = aws_vpc.mostafa_vpc.id
  cidr_block = var.private_subnet_one_cidr
  availability_zone = var.az1
  map_public_ip_on_launch = false
  tags = {
    Name = "mostafa_private_subnet_one"
  }
}
