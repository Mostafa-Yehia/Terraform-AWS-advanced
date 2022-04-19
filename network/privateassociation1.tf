resource "aws_route_table_association" "mostafa_private_route_association_one" {
  subnet_id      = aws_subnet.mostafa_private_subnet_one.id
  route_table_id = aws_route_table.mostafa_private_route_one.id
} 