resource "aws_vpc" "main" {
  cidr_block       = "10.128.80.0/24"
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


resource "aws_network_interface" "main" {
  subnet_id       = aws_subnet.main.id
  private_ips     = ["10.128.80.10"]
#   security_groups = [aws_security_group.web.id]

#   attachment {
#     instance     = aws_instance.test.id
#     device_index = 1
#   }
}

resource "aws_instance" "main" {
  ami           = "ami-0d43ca842a14ff342" # us-east-2
  instance_type = "t2.medium"

  network_interface {
    network_interface_id = aws_network_interface.main.id
    device_index         = 0
  }
  key_name = var.aws_key_name
}