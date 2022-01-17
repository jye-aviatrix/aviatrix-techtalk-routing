
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


# AWS Transit GW for us-east-1

resource "aviatrix_transit_gateway" "aws_ue1_transit_gw" {
  cloud_type               = 1
  account_name             = var.aws_access_account
  gw_name                  = var.aws_transit_name
  vpc_id                   = aviatrix_vpc.aws_ue1_transit_vpc.vpc_id
  vpc_reg                  = var.aws_region
  gw_size                  = "t2.micro"
  subnet                   = var.aws_transit_gw_subnet
  ha_subnet                = var.aws_transit_gw_ha_subnet
  ha_gw_size               = "t2.micro"
  enable_active_mesh       = true
  enable_hybrid_connection = false
  connected_transit        = true
}


# AWS Spoke Prod VPC for us-east-1
resource "aviatrix_vpc" "aws_ue1_spoke_prod_vpc" {
  cloud_type           = 1
  account_name         = var.aws_access_account
  region               = var.aws_region
  name                 = var.aws_spoke_prod_name
  cidr                 = var.aws_spoke_prod_cidr
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = false
}
