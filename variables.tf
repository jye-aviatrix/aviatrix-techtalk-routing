variable "controller_ip" {
  type = string
}

variable "controller_username" {
  type = string
}

variable "controller_password" {
  type = string
}

variable "aws_access_account" {
  type = string
  description = "Provide Aviatrix AWS Access Account name"
}

variable "az_access_account" {
  type = string
  description = "Provide Aviatrix Azure Access Account name"
}

variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "aws_transit_cidr" {
  type = string
  default = "10.32.254.0/23"
}

variable "aws_transit_name" {
  type = string
  default = "aws-ue1-transit"
}

