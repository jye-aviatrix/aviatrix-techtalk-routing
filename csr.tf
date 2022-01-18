resource "aws_vpc" "main" {
  cidr_block       = "10.128.80.0/24"
  tags = {
    Name = "main"
  }
}