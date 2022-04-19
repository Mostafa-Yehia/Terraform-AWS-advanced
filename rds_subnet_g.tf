resource "aws_db_subnet_group" "mostafa_rds_subnet_group" {
  name       = "mostafa_rds_subnet_group"
  subnet_ids = [module.network.private_subnet_one_id,module.network.private_subnet_two_id]

  tags = {
    Name = "mostafa_rds_subnet_group"
  }
}