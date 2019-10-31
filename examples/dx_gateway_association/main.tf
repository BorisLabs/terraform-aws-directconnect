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

module "gateway" {
  source = "../../"

  create_dx_gateway = true

  dx_gateway_name    = "dx-gw-test-01"
  dx_gateway_bgp_asn = "65399"

  providers = {
    aws.accepter = aws.accepter-account
    aws          = aws.owner-account
  }
}

module "associate" {
  source = "../../"

  crossaccount_dx_gateway = true
  dx_gateway_id = module.gateway.dx_gateway_id
  dx_gateway_owner_account_id = data.aws_caller_identity.owner.account_id

  vgw_id = aws_vpn_gateway.this.id

  providers = {
    aws.accepter = aws.owner-account
    aws          = aws.accepter-account
  }
}

data "aws_caller_identity" "owner" {
  provider = "aws.owner-account"
}

data "aws_vpc" "default" {
  provider = "aws.accepter-account"
  default = true
}

resource "aws_vpn_gateway" "this" {
  provider = "aws.accepter-account"
  vpc_id = data.aws_vpc.default.id
}