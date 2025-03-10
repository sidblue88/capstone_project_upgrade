output "app_machine_public_ip" {
  value = module.ec2.public_ips[0]
}

output "tools_machine_public_ip" {
  value = module.ec2.public_ips[1]
}