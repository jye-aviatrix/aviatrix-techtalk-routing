module "azwu2prodpub" {
  source = "./modules/azure-linux-vm-public"
  vm_name = "azwu2prodpub"
  resource_group_name = aviatrix_vpc.az_wu2_spoke_prod_vpc.resource_group
  location = aviatrix_vpc.az_wu2_spoke_prod_vpc.region
  subnet_id = aviatrix_vpc.az_wu2_spoke_prod_vpc.public_subnets[1].subnet_id
  public_key_data = var.public_key_data
  admin_username = var.admin_username
  private_ip_address = "10.64.20.20"
  tags = var.additional_tags
}

output "azwu2prodpub-public-ip" {
  value = module.azwu2prodpub.public_ip
}


module "azwu2qapub" {
  source = "./modules/azure-linux-vm-public"
  vm_name = "azwu2qapub"
  resource_group_name = aviatrix_vpc.az_wu2_spoke_qa_vpc.resource_group
  location = aviatrix_vpc.az_wu2_spoke_qa_vpc.region
  subnet_id = aviatrix_vpc.az_wu2_spoke_qa_vpc.public_subnets[1].subnet_id
  public_key_data = var.public_key_data
  admin_username = var.admin_username
  private_ip_address = "10.64.120.20"
  tags = var.additional_tags
}

output "azwu2qapub-public-ip" {
  value = module.azwu2qapub.public_ip
}


module "azwu2qapriv" {
  source = "./modules/azure-linux-vm-private"
  vm_name = "azwu2qapriv"
  resource_group_name = aviatrix_vpc.az_wu2_spoke_qa_vpc.resource_group
  location = aviatrix_vpc.az_wu2_spoke_qa_vpc.region
  subnet_id = aviatrix_vpc.az_wu2_spoke_qa_vpc.private_subnets[0].subnet_id
  public_key_data = var.public_key_data
  admin_username = var.admin_username
  private_ip_address = "10.64.120.40"
  tags = var.additional_tags
}