resource "tls_private_key" "tls" {
  algorithm = "RSA"
}

resource "aws_key_pair" "mostafa-kp" {
  key_name   = "mostafa-kp"
  public_key = tls_private_key.tls.public_key_openssh
  tags = {
    Name = "mostafa-kp"
  }
}
resource "aws_secretsmanager_secret" "mostafa-sm3" {
  name = "mostafa-sm3"
}

resource "aws_secretsmanager_secret_version" "mostafa-smv" {
  secret_id     = aws_secretsmanager_secret.mostafa-sm3.id
  secret_string = tls_private_key.tls.private_key_pem
}

resource "local_file" "private_key" {
  depends_on = [
    tls_private_key.tls,
  ]
  content  = tls_private_key.tls.private_key_pem
  filename = "~/private.pem"
} 

