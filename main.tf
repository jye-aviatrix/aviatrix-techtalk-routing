
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
  cloud_type         = 8
  account_name       = var.az_access_account
  gw_name            = var.az_transit_firenet_name
  vpc_id             = aviatrix_vpc.az_wu2_transit_firenet_vpc.vpc_id
  vpc_reg            = var.az_region
  gw_size            = "Standard_B2ms"
  subnet             = var.az_transit_firenet_gw_subnet
  zone               = "az-1"
  ha_subnet          = var.az_transit_firenet_gw_ha_subnet
  ha_zone            = "az-2"
  ha_gw_size         = "Standard_B2ms"
  connected_transit  = true
  enable_active_mesh = true
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
}