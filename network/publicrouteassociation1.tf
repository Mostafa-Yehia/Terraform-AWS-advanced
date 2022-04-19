resource "aws_route_table_association" "mostafa_public_route_association_one" {
  subnet_id      = aws_subnet.mostafa_public_subnet_one.id
  route_table_id = aws_route_table.mostafa_public_route_one.id
} 