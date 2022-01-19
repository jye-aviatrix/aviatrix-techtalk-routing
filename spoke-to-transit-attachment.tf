# Create an Aviatrix Spoke Transit Attachment



# # AWS us-east-1 prod to transit
# resource "aviatrix_spoke_transit_attachment" "ue1_prod_to_transit" {
#   spoke_gw_name   = aviatrix_spoke_gateway.aws_ue1_spoke_prod_gw.gw_name
#   transit_gw_name = aviatrix_transit_gateway.aws_ue1_transit_gw.gw_name
# }









# # AWS us-east-2 qa to transit
# resource "aviatrix_spoke_transit_attachment" "ue2_qa_to_transit" {
#   spoke_gw_name   = aviatrix_spoke_gateway.aws_ue2_spoke_qa_gw.gw_name
#   transit_gw_name = aviatrix_transit_gateway.aws_ue2_transit_gw.gw_name
# }








# # Azure West US 2 prod to transit
# resource "aviatrix_spoke_transit_attachment" "wu2_prod_to_transit" {
#   spoke_gw_name   = aviatrix_spoke_gateway.az_wu2_spoke_prod_gw.gw_name
#   transit_gw_name = aviatrix_transit_gateway.az_wu2_transit_firenet_gw.gw_name
# }

# # Azure West US 2 qa to transit
# resource "aviatrix_spoke_transit_attachment" "wu2_qa_to_transit" {
#   spoke_gw_name   = aviatrix_spoke_gateway.az_wu2_spoke_qa_gw.gw_name
#   transit_gw_name = aviatrix_transit_gateway.az_wu2_transit_firenet_gw.gw_name
# }



