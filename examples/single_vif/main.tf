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
  provider = "aws.accepter-account"
}

module "should_create_single_vif" {
  source           = "../../"
  amazonAddress    = "192.168.1.1/30"
  bgp_asn          = "65533"
  connection_id    = "dxcon-abc123"
  name             = "test-vif-creation"
  owner_account_id = "${data.aws_caller_identity.accepter.account_id}"
  vgw_id           = "vgw-12345678abcdef"
  vlan_id          = "101"

  providers = {
    aws.accepter = "aws.accepter-account"
    aws.source   = "aws.owner-account"
  }
}
