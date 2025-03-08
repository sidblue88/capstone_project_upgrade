resource "aws_instance" "app_machine" {
  ami           = "ami-12345678"  # Ubuntu AMI (replace with latest)
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet
  key_name      = var.key_name
  security_groups = [var.sg_id]

  tags = {
    Name = "App-Machine"
  }
}

resource "aws_instance" "tools_machine" {
  ami           = "ami-12345678"  # Ubuntu AMI (replace with latest)
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet
  key_name      = var.key_name
  security_groups = [var.sg_id]

  tags = {
    Name = "Tools-Machine"
  }
}

output "app_machine_public_ip" {
  value = aws_instance.app_machine.public_ip
}

output "tools_machine_public_ip" {
  value = aws_instance.tools_machine.public_ip
}
