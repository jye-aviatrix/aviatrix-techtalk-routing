resource "aws_vpc" "main" {
  cidr_block = "10.128.80.0/24"
  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.128.80.0/24"

  tags = {
    Name = "Main"
  }
  depends_on = [aws_internet_gateway.main]
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "main"
  }
}


resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main.id
}


resource "aws_instance" "main" {
  ami           = "ami-0d43ca842a14ff342" # us-east-2
  instance_type = "t2.medium"

  private_ip = "10.128.80.10"
  subnet_id  = aws_subnet.main.id
  key_name   = var.aws_key_name
  security_groups = [aws_security_group.main.id]
  tags = {
    Name = "main"
  }
}


resource "aws_eip" "main" {
  vpc = true

  instance                  = aws_instance.main.id
  associate_with_private_ip = "10.128.80.10"
  depends_on                = [aws_internet_gateway.main]
  tags = {
    Name = "main"
  }
}


resource "aws_security_group" "main" {
  name        = "allow_csr"
  description = "Allow CSR inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "SSH"
    from_port        = 0
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["${var.your_public_ip}/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_csr"
  }
}