variable "create_jenkins_ec2" {
  type = bool
  default = true
}

variable "key_name" {
  type = string
  description = "SSH key pair name"
}

variable "my_ip" {
  type = string
  description = "IP to allow SSH and jenkins access"
