provider "aws" {
  alias   = "owner-account"
  region  = "eu-west-1"
  profile = "test-account-1"
}

provider "aws" {
  alias   = "accepter-account"
  region  = "eu-west-1"
  profile = "test-account-2"
}


data "aws_caller_identity" "accepter" {
  provider = aws.accepter-account
}

module "should_create_single_vif" {
  source = "../../"

  //  create_dx_private_hosted_vif           = true
  dx_private_hosted_vif_amazon_address   = "192.168.1.1/30"
  dx_private_hosted_vif_bgp_asn          = "65533"
  dx_connection_id                       = "dxcon-abc123"
  dx_private_hosted_vif_name             = "test-vif-creation"
  dx_private_hosted_vif_owner_account_id = data.aws_caller_identity.accepter.account_id
  vgw_id                                 = "vgw-12345678abcdef"
  dx_private_hosted_vif_vlan_id          = "101"

  providers = {
    aws.accepter = aws.accepter-account
    aws          = aws.owner-account
  }
}
