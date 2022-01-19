resource "aws_network_interface" "this" {
  subnet_id       = var.subnet_id
  private_ips     = [var.private_ip]
  security_groups = [aws_security_group.this.id]

  tags = local.tags
}

resource "aws_instance" "this" {
  ami           = "ami-08e4e35cccc6189f4" # us-east-1
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.this.id
    device_index         = 0
  }

  key_name = var.key_name
  tags     = local.tags
}


resource "aws_eip" "this" {
  vpc = true

  instance = aws_instance.this.id
  tags     = local.tags
}


resource "aws_security_group" "this" {
  name        = "allow SSH"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.your_public_ip}/32"]
  }

  ingress {
    description = "ICMP10"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    description = "ICMP172"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["172.16.0.0/12"]
  }

  ingress {
    description = "ICMP192"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["192.168.0.0/16"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = local.tags
}


