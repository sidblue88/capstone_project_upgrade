output "security_group_id" {
  value = aws_security_group.allow_ssh_http.id
}

output "key_name" {
  value = aws_key_pair.ec2_key.key_name
}
