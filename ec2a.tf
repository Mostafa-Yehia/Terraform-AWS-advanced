resource "aws_instance" "ec2a" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.mostafa-kp.key_name
  subnet_id              = module.network.public_subnet_one_id
  vpc_security_group_ids = [aws_security_group.security_group_one.id]
  provisioner "local-exec"{
        command = "echo the server ip address is ${self.public_ip}"
  }
  depends_on = [
    module.network.nat1,
    module.network.mostafa_public_route_association_one
  ]
user_data              = <<EOF
#!/bin/bash
sudo -i
apt update -y
apt install awscli -y
mkdir ~/.aws
touch ~/.aws/credentials
touch ~/.aws/config
echo -e "[default] \naws_access_key_id = AKIAUA4UONBDFYSN6BXH  \naws_secret_access_key = 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 " >> ~/.aws/credentials
echo -e "[default] \nregion = ${var.region} " >> ~/.aws/config
aws secretsmanager get-secret-value --secret-id mostafa-sm3 --query 'SecretString' --output text > ~/private.pem
chmod 400 ~/private.pem
EOF 
}

#
