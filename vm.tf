module "azwu2prod" {
  source = "./modules/azure-linux-vm"
  vm_name = "azwu2prod"
  resource_group_name = aviatrix_vpc.az_wu2_spoke_prod_vpc.resource_group
  location = aviatrix_vpc.az_wu2_spoke_prod_vpc.region
  subnet_id = aviatrix_vpc.az_wu2_spoke_prod_vpc.public_subnets[1].subnet_id
  public_key_data = var.public_key_data
  admin_username = var.admin_username
  private_ip_address = "10.64.20.20"
}
