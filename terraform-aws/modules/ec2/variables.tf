variable "instance_count" {
  type = number
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "key_name" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "instance_names" {
  type    = list(string)
  default = ["App-Machine", "Tools-Machine"]
}
