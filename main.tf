
# AWS Transit VPC for us-east-1
resource "aviatrix_vpc" "aws_ue1_transit_vpc" {
  cloud_type           = 1
  account_name         = var.aws_access_account
  region               = var.aws_region
  name                 = var.aws_transit_name
  cidr                 = var.aws_transit_cidr
  aviatrix_transit_vpc = true
  aviatrix_firenet_vpc = false
}