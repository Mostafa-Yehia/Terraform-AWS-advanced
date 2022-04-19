resource "aws_eip" "eip" {
  vpc      = true
  tags = {
    Name = "eip"
  }
}
