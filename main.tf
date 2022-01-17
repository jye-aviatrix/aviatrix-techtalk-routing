
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
  gw_size                  = "t3.small"
  subnet                   = var.aws_transit_gw_subnet
  ha_subnet                = var.aws_transit_gw_ha_subnet
  ha_gw_size               = "t3.small"
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


resource "aviatrix_spoke_gateway" "aws_ue1_spoke_prod_gw" {
  cloud_type                        = 1
  account_name                      = var.aws_access_account
  gw_name                           = var.aws_spoke_prod_name
  vpc_id                            = aviatrix_vpc.aws_ue1_spoke_prod_vpc.vpc_id
  vpc_reg                           = var.aws_region
  gw_size                           = "t3.small"
  subnet                            = var.aws_spoke_prod_gw_subnet
  ha_gw_size                        = "t3.small"
  ha_subnet                         = var.aws_spoke_prod_gw_ha_subnet
  single_ip_snat                    = false
  enable_active_mesh                = true
  manage_transit_gateway_attachment = false
}


# AWS Spoke QA VPC for us-east-1
resource "aviatrix_vpc" "aws_ue1_spoke_qa_vpc" {
  cloud_type           = 1
  account_name         = var.aws_access_account
  region               = var.aws_region
  name                 = var.aws_spoke_qa_name
  cidr                 = var.aws_spoke_qa_cidr
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = false
}

resource "aviatrix_spoke_gateway" "aws_ue1_spoke_qa_gw" {
  cloud_type                        = 1
  account_name                      = var.aws_access_account
  gw_name                           = var.aws_spoke_qa_name
  vpc_id                            = aviatrix_vpc.aws_ue1_spoke_qa_vpc.vpc_id
  vpc_reg                           = var.aws_region
  gw_size                           = "t3.small"
  subnet                            = var.aws_spoke_qa_gw_subnet
  single_ip_snat                    = false
  enable_active_mesh                = true
  manage_transit_gateway_attachment = false
}


# Azure Transit VPC for east-us-2
resource "aviatrix_vpc" "az_wu_transit_firenet_vpc" {
  cloud_type           = 8
  account_name         = var.az_access_account
  region               = var.az_region
  name                 = var.az_transit_firenet_name
  cidr                 = var.az_transit_firenet_cidr
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = true
}