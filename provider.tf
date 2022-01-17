terraform {
  required_providers {
    aviatrix = {
      source  = "AviatrixSystems/aviatrix"
      version = "~> 2.20"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.91.0"
    }
  }
  required_version = ">= 1.0"
}


# Configure Aviatrix provider
provider "aviatrix" {
  controller_ip           = var.controller_ip
  username                = var.controller_username
  password                = var.controller_password
}