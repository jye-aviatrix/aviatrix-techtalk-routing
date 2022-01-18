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