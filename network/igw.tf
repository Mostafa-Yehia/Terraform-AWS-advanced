resource "aws_internet_gateway" "mostafa_igw" {
  vpc_id = aws_vpc.mostafa_vpc.id

  tags = {
    Name = "mostafa_igw"
  }
}