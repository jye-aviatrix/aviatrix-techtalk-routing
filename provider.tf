# Configure Aviatrix provider
provider "aviatrix" {
  controller_ip           = var.controller_ip
  username                = var.controller_username
  password                = var.controller_password
}