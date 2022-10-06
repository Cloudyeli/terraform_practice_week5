resource "aws_instance" "public_server" {
  ami                       = data.aws_ami.amz_linux_image.id
  instance_type             = var.movie_app_ec2_type
  subnet_id                 = data.aws_subnet.public_subnet_1.id
  vpc_security_group_ids   = [aws_security_group.public_sg.id]
  key_name                  = var.keypair_name

  tags = {
    Name = "public_server"
  }
}