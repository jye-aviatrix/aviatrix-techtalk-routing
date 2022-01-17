# Create an Aviatrix Transit Gateway Peering
resource "aviatrix_transit_gateway_peering" "az_to_aws_ue2_peering" {
  transit_gateway_name1                       = aviatrix_transit_gateway.az_wu2_transit_firenet_gw.gw_name
  transit_gateway_name2                       = aviatrix_transit_gateway.aws_ue2_transit_gw.gw_name
  enable_peering_over_private_network         = false
  enable_insane_mode_encryption_over_internet = false
}

resource "aviatrix_transit_gateway_peering" "az_to_aws_ue1_peering" {
  transit_gateway_name1                       = aviatrix_transit_gateway.az_wu2_transit_firenet_gw.gw_name
  transit_gateway_name2                       = aviatrix_transit_gateway.aws_ue1_transit_gw.gw_name
  enable_peering_over_private_network         = false
  enable_insane_mode_encryption_over_internet = false
}