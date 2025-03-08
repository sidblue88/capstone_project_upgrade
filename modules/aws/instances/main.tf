resource "aws_instance" "app_machine" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet
  key_name      = var.key_name
  security_groups = [var.sg_id]

  tags = {
    Name = "App-Machine"
  }
}

resource "aws_instance" "tools_machine" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet
  key_name      = var.key_name
  security_groups = [var.sg_id]

  tags = {
    Name = "Tools-Machine"
  }
}
