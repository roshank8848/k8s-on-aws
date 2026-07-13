resource "tls_private_key" "rsa-4096-roshan" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "roshan-key" {
  key_name   = "roshan-key"
  public_key = tls_private_key.rsa-4096-roshan.public_key_openssh
}

resource "local_file" "roshan-key-file" {
  content         = tls_private_key.rsa-4096-roshan.private_key_pem
  filename        = "${path.module}/../ansible/roshank.pem"
  file_permission = "0400"
}