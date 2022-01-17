
# AWS Transit for us-east-1
module "transit_aws_ue1" {
  source  = "terraform-aviatrix-modules/aws-transit/aviatrix"
  version = "v4.0.2"

  cidr = var.aws_transit_cidr
  region = var.aws_region
  account = var.aws_access_account
  name = var.aws_transit_name
  prefix = false
  suffix = false
}
