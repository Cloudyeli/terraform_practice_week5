resource "aws_security_group" "public_sg" {
  name        = "public_sg"
  description = "SG for our Movie gmgt Application"
  vpc_id      = data.aws_vpc.vpc.id

  # INBOUND CONNECTIONS
  ingress {
    description = "Access to SSH app"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # INBOUND CONNECTIONS
  ingress {
    description = "Access to our Flask app"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # OUTBOUT CONNECTIONS
  egress {
    description = "Access to the internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # TCP + UDP PROTOCOL
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public_sg"
  }
}

resource "aws_security_group" "private_sg" {
  name        = "private_sg"
  description = "SG for our Movie gmgt Application"
  vpc_id      = data.aws_vpc.vpc.id

  # INBOUND CONNECTIONS
  ingress {
    description = "Access to SSH app"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.public_sg.id]
  }

  # INBOUND CONNECTIONS
  ingress {
    description = "Access to our Flask app"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # OUTBOUT CONNECTIONS
  egress {
    description = "Access to the internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # TCP + UDP PROTOCOL
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private_sg"
  }
}