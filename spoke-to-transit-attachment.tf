# Create an Aviatrix Spoke Transit Attachment
resource "aviatrix_spoke_transit_attachment" "ue2_qa_to_transit" {
  spoke_gw_name   = aviatrix_spoke_gateway.aws_ue2_qa_gw.gw_name
  transit_gw_name = aviatrix_transit_gateway.aws_ue2_transit_gw.gw_name
}