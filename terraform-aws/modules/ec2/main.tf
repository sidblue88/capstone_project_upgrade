resource "aws_instance" "example" {
  count         = var.instance_count
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_ids[count.index % length(var.subnet_ids)]
  key_name      = var.key_name
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "${var.instance_names[count.index]}"
  }
}
