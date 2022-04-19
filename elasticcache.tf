resource "aws_elasticache_cluster" "mostafaredis" {
  cluster_id           = "mostafaredis"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  engine_version       = "3.2.10"
  port                 = 6379
  security_group_ids = [aws_security_group.mostafaelasticcachesecuritygroup.id]
  subnet_group_name    = aws_elasticache_subnet_group.mostafaelasticcachesubnetgroup.name

}

resource "aws_security_group" "mostafaelasticcachesecuritygroup" {
  name        = "mostafaelasticcachesecuritygroup"
  description = "mostafaelasticcachesecuritygroup"
  vpc_id      = module.network.vpc_id

  ingress {
    description      = "port 6379"
    from_port        = 6379
    to_port          = 6379
    protocol         = "tcp"
    cidr_blocks      = [module.network.private_subnet_one.cidr_block,module.network.private_subnet_two.cidr_block]
  }
  depends_on = [
    module.network.private_subnet_one_id,
    module.network.private_subnet_two_id
  ]

  tags = {
    Name = "elasticcache"
  }
}

resource "aws_elasticache_subnet_group" "mostafaelasticcachesubnetgroup" {
  name       = "mostafaelasticcachesubnetgroup"
  subnet_ids = [module.network.private_subnet_one_id,module.network.private_subnet_two_id]
}

resource "aws_elasticache_user" "mostafaelasticcacheuser" {
  user_id       = "mostafaelasticcacheuser"
  user_name     = "mostafa"
  access_string = "on ~app::* -@all +@read +@hash +@bitmap +@geo -setbit -bitfield -hset -hsetnx -hmset -hincrby -hincrbyfloat -hdel -bitop -geoadd -georadius -georadiusbymember"
  engine        = "REDIS"
  passwords     = ["mostafamostafamostafamostafamostafa"]
}