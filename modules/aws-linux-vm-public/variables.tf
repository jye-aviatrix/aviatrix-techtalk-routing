locals {
  tags = merge(
      {
          Name = var.vm_name
      },
      var.tags
  )
}

variable "vm_name" {
  type = string
}

variable "tags" {
  default = {}
  type = map(string)
}

variable "key_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
    type = string
}

variable "private_ip" {
  type = string
}
variable "your_public_ip" {
  type = string
}