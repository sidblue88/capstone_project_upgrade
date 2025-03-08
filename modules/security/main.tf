resource "aws_security_group" "web_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "ec2_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

output "sg_id" {
  value = aws_security_group.web_sg.id
}

output "key_name" {
  value = aws_key_pair.ssh_key.key_name
}
