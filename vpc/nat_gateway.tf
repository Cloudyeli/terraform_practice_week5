resource "aws_nat_gateway" "nat_gateway" {
  subnet_id     = aws_subnet.public_subnet_1.id
  allocation_id = aws_eip.elastic_ip.id

  tags = {
    Name = "nat_gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.internet_gateway]
}