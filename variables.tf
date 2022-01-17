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

# AWS Transit
variable "aws_transit_name" {
  type = string
  default = "aws-ue1-transit"
}
variable "aws_transit_cidr" {
  type = string
  default = "10.32.254.0/23"
}

variable "aws_transit_gw_subnet" {
  type = string
  default = "10.32.254.64/28"
}

variable "aws_transit_gw_ha_subnet" {
  type = string
  default = "10.32.254.96/28"
}

# AWS Spoke Prod

variable "aws_spoke_prod_name" {
  type = string
  default = "aws-ue1-spoke-prod"
}
variable "aws_spoke_prod_cidr" {
  type = string
  default = "10.32.20.0/24"
}


# AWS Spoke QA
variable "aws_spoke_qa_name" {
  type = string
  default = "aws-ue1-spoke-qa"
}
variable "aws_spoke_qa_cidr" {
  type = string
  default = "10.32.120.0/24"
}