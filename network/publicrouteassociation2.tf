resource "aws_route_table_association" "mostafa_public_route_association_two" {
  subnet_id      = aws_subnet.mostafa_public_subnet_two.id
  route_table_id = aws_route_table.mostafa_public_route_one.id
} 