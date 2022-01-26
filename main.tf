
# AWS Transit VPC for us-east-1
resource "aviatrix_vpc" "aws_ue1_transit_vpc" {
  cloud_type           = 1
  account_name         = var.aws_access_account
  region               = var.aws_region_ue1
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
  vpc_reg                  = var.aws_region_ue1
  gw_size                  = "t3.small"
  subnet                   = var.aws_transit_gw_subnet
  ha_subnet                = var.aws_transit_gw_ha_subnet
  ha_gw_size               = "t3.small"
  enable_active_mesh       = true
  enable_hybrid_connection = false
  connected_transit        = true
  local_as_number          = var.aws_transit_ue1_local_as_number
  tags                     = var.additional_tags
}


# AWS Spoke Prod VPC for us-east-1
resource "aviatrix_vpc" "aws_ue1_spoke_prod_vpc" {
  cloud_type           = 1
  account_name         = var.aws_access_account
  region               = var.aws_region_ue1
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
  vpc_reg                           = var.aws_region_ue1
  gw_size                           = "t3.small"
  subnet                            = var.aws_spoke_prod_gw_subnet
  ha_gw_size                        = "t3.small"
  ha_subnet                         = var.aws_spoke_prod_gw_ha_subnet
  single_ip_snat                    = false
  enable_active_mesh                = true
  manage_transit_gateway_attachment = false
  tags                              = var.additional_tags
}




# AWS Spoke Shared Service VPC for us-east-1
resource "aviatrix_vpc" "aws_ue1_spoke_shared_service_vpc" {
  cloud_type           = 1
  account_name         = var.aws_access_account
  region               = var.aws_region_ue1
  name                 = var.aws_spoke_shared_service_name
  cidr                 = var.aws_spoke_shared_service_cidr
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = false
}

resource "aviatrix_spoke_gateway" "aws_ue1_spoke_shared_service_gw" {
  cloud_type                        = 1
  account_name                      = var.aws_access_account
  gw_name                           = var.aws_spoke_shared_service_name
  vpc_id                            = aviatrix_vpc.aws_ue1_spoke_shared_service_vpc.vpc_id
  vpc_reg                           = var.aws_region_ue1
  gw_size                           = "t3.small"
  subnet                            = var.aws_spoke_shared_service_gw_subnet
  single_ip_snat                    = false
  enable_active_mesh                = true
  manage_transit_gateway_attachment = false
  tags                              = var.additional_tags
}


# AWS Transit VPC for us-east-2
resource "aviatrix_vpc" "aws_ue2_transit_vpc" {
  cloud_type           = 1
  account_name         = var.aws_access_account
  region               = var.aws_region_ue2
  name                 = var.aws_transit_ue2_name
  cidr                 = var.aws_transit_ue2_cidr
  aviatrix_transit_vpc = true
  aviatrix_firenet_vpc = false
}


# AWS Transit GW for us-east-2

resource "aviatrix_transit_gateway" "aws_ue2_transit_gw" {
  cloud_type               = 1
  account_name             = var.aws_access_account
  gw_name                  = var.aws_transit_ue2_name
  vpc_id                   = aviatrix_vpc.aws_ue2_transit_vpc.vpc_id
  vpc_reg                  = var.aws_region_ue2
  gw_size                  = "t3.small"
  subnet                   = var.aws_transit_ue2_gw_subnet
  ha_subnet                = var.aws_transit_ue2_gw_ha_subnet
  ha_gw_size               = "t3.small"
  enable_active_mesh       = true
  enable_hybrid_connection = false
  connected_transit        = true
  local_as_number          = var.aws_transit_ue2_local_as_number
  tags                     = var.additional_tags
}


# AWS Spoke QA VPC for us-east-2
resource "aviatrix_vpc" "aws_ue2_spoke_qa_vpc" {
  cloud_type           = 1
  account_name         = var.aws_access_account
  region               = var.aws_region_ue2
  name                 = var.aws_spoke_qa_name
  cidr                 = var.aws_spoke_qa_cidr
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = false
}

resource "aviatrix_spoke_gateway" "aws_ue2_spoke_qa_gw" {
  cloud_type                        = 1
  account_name                      = var.aws_access_account
  gw_name                           = var.aws_spoke_qa_name
  vpc_id                            = aviatrix_vpc.aws_ue2_spoke_qa_vpc.vpc_id
  vpc_reg                           = var.aws_region_ue2
  gw_size                           = "t3.small"
  subnet                            = var.aws_spoke_qa_gw_subnet
  single_ip_snat                    = false
  enable_active_mesh                = true
  manage_transit_gateway_attachment = false
  tags                              = var.additional_tags
}

# Azure Transit VPC for West US 2
resource "aviatrix_vpc" "az_wu2_transit_firenet_vpc" {
  cloud_type           = 8
  account_name         = var.az_access_account
  region               = var.az_region
  name                 = var.az_transit_firenet_name
  cidr                 = var.az_transit_firenet_cidr
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = true
}

resource "aviatrix_transit_gateway" "az_wu2_transit_firenet_gw" {
  cloud_type             = 8
  account_name           = var.az_access_account
  gw_name                = var.az_transit_firenet_name
  vpc_id                 = aviatrix_vpc.az_wu2_transit_firenet_vpc.vpc_id
  vpc_reg                = var.az_region
  gw_size                = "Standard_B2ms"
  subnet                 = var.az_transit_firenet_gw_subnet
  zone                   = "az-1"
  ha_subnet              = var.az_transit_firenet_gw_ha_subnet
  ha_zone                = "az-2"
  ha_gw_size             = "Standard_B2ms"
  connected_transit      = true
  enable_active_mesh     = true
  enable_transit_firenet = true
  local_as_number        = var.az_transit_firenet_local_as_number
  tags                   = var.additional_tags
}


# Azure Spoke Prod VPC for West US 2
resource "aviatrix_vpc" "az_wu2_spoke_prod_vpc" {
  cloud_type           = 8
  account_name         = var.az_access_account
  region               = var.az_region
  name                 = var.az_spoke_prod_name
  cidr                 = var.az_spoke_prod_cidr
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = false
}

resource "aviatrix_spoke_gateway" "az_wu2_spoke_prod_gw" {
  cloud_type                        = 8
  account_name                      = var.az_access_account
  gw_name                           = var.az_spoke_prod_name
  vpc_id                            = aviatrix_vpc.az_wu2_spoke_prod_vpc.vpc_id
  vpc_reg                           = var.az_region
  gw_size                           = "Standard_B2ms"
  subnet                            = var.az_spoke_prod_gw_subnet
  single_ip_snat                    = false
  enable_active_mesh                = true
  manage_transit_gateway_attachment = false
  tags                              = var.additional_tags
}


# Azure Spoke QA VPC for West US 2
resource "aviatrix_vpc" "az_wu2_spoke_qa_vpc" {
  cloud_type           = 8
  account_name         = var.az_access_account
  region               = var.az_region
  name                 = var.az_spoke_qa_name
  cidr                 = var.az_spoke_qa_cidr
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = false
}

resource "aviatrix_spoke_gateway" "az_wu2_spoke_qa_gw" {
  cloud_type                        = 8
  account_name                      = var.az_access_account
  gw_name                           = var.az_spoke_qa_name
  vpc_id                            = aviatrix_vpc.az_wu2_spoke_qa_vpc.vpc_id
  vpc_reg                           = var.az_region
  gw_size                           = "Standard_B2ms"
  subnet                            = var.az_spoke_qa_gw_subnet
  single_ip_snat                    = false
  enable_active_mesh                = true
  manage_transit_gateway_attachment = false
  tags                              = var.additional_tags
}


resource "aviatrix_transit_external_device_conn" "transit_s2c" {
  vpc_id             = aviatrix_vpc.az_wu2_transit_firenet_vpc.vpc_id
  connection_name    = "s2c"
  gw_name            = aviatrix_transit_gateway.az_wu2_transit_firenet_gw.gw_name
  remote_gateway_ip  = aws_eip.main.public_ip
  connection_type    = "bgp"
  direct_connect     = false
  bgp_local_as_num   = var.az_transit_firenet_local_as_number
  bgp_remote_as_num  = "65128"
  ha_enabled         = false
  local_tunnel_cidr  = "169.254.225.74/30,169.254.39.26/30"
  remote_tunnel_cidr = "169.254.225.73/30,169.254.39.25/30"
  custom_algorithms  = false
  enable_ikev2       = true
}

