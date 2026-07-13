data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "roshan-instance" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.medium"
  key_name                    = aws_key_pair.roshan-key.key_name
  subnet_id                   = aws_subnet.roshan-subnet.id
  vpc_security_group_ids      = [aws_security_group.roshan-sg.id]
  root_block_device {
    volume_size = 32
  }
  associate_public_ip_address = true
  tags = {
    Name = "roshan-instance"
  }
}

resource "aws_security_group" "roshan-sg" {
  name   = "roshan-sg"
  vpc_id = aws_vpc.roshan.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "roshan-sg"
  }

}
#resource "null_resource" "run_ansible" {
#  depends_on = [
#    aws_instance.roshan-instance
#  ]
#  provisioner "local-exec" {
#    command     = "ansible-playbook setup.yaml"
#    working_dir = "../ansible"
#  }
#}


