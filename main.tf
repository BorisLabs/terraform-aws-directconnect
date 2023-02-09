resource "aws_dx_connection" "this" {
  count = var.create_dx_connection ? 1 : 0

  name          = var.dx_connection_name
  bandwidth     = var.dx_connection_bandwith
  location      = var.dx_connection_location
  provider_name = var.dx_connection_provider

  request_macsec  = var.dx_connection_request_macsec
  encryption_mode = var.dx_connection_encryption_mode

  skip_destroy = var.dx_connection_skip_destroy

  tags = var.dx_connection_tags
}

resource "aws_dx_connection_association" "this" {
  count = var.create_dx_lag && var.create_dx_connection ? 1 : 0

  connection_id = aws_dx_connection.this.*.id[0]
  lag_id        = aws_dx_lag.this.*.id[0]
}

resource "aws_dx_lag" "this" {
  count = var.create_dx_lag ? 1 : 0

  connections_bandwidth = var.dx_connection_bandwith
  location              = var.dx_connection_location
  name                  = var.dx_lag_name

  tags = var.dx_lag_tags
}

resource "aws_dx_hosted_private_virtual_interface" "private_vif" {
  count = var.create_dx_private_hosted_vif ? 1 : 0

  name          = var.dx_private_hosted_vif_name
  connection_id = var.dx_connection_id

  address_family   = var.dx_private_hosted_vif_address_family
  bgp_asn          = var.dx_private_hosted_vif_bgp_asn
  owner_account_id = var.dx_private_hosted_vif_owner_account_id
  vlan             = var.dx_private_hosted_vif_vlan_id
  customer_address = var.dx_private_hosted_vif_customer_address
  amazon_address   = var.dx_private_hosted_vif_amazon_address
  mtu              = var.mtu_size
}

resource "aws_dx_hosted_private_virtual_interface_accepter" "private_vif_accepter" {
  count = var.create_dx_private_hosted_vif ? 1 : 0

  provider             = aws.accepter
  virtual_interface_id = aws_dx_hosted_private_virtual_interface.private_vif[0].id
  vpn_gateway_id       = concat(aws_vpn_gateway.this.*.id, [var.vgw_id])[0]
}

resource "aws_dx_private_virtual_interface" "this" {
  count = var.create_dx_private_vif ? 1 : 0

  name          = var.dx_private_vif_name
  connection_id = var.dx_connection_id

  address_family   = var.dx_private_vif_address_family
  bgp_asn          = var.dx_private_vif_bgp_asn
  vlan             = var.dx_private_vif_vlan_id
  amazon_address   = var.dx_private_vif_amazon_address
  customer_address = var.dx_private_vif_customer_address
  mtu              = var.mtu_size

  dx_gateway_id = concat(aws_dx_gateway.this.*.id, data.aws_dx_gateway.this.*.id)[0]

  tags = var.dx_private_vif_tags
}

resource "aws_dx_public_virtual_interface" "this" {
  count = var.create_dx_public_vif ? 1 : 0

  name          = var.dx_public_vif_name
  connection_id = var.dx_connection_id

  address_family   = var.dx_public_vif_address_family
  bgp_asn          = var.dx_public_vif_bgp_asn
  vlan             = var.dx_public_vif_vlan_id
  amazon_address   = var.dx_public_vif_amazon_address
  customer_address = var.dx_public_vif_customer_address
  bgp_auth_key     = var.dx_public_vif_bgp_auth_key

  tags                  = var.dx_public_vif_tags
  route_filter_prefixes = var.dx_public_vif_route_filter_prefixes

}

resource "aws_dx_gateway" "this" {
  count = var.create_dx_gateway ? 1 : 0

  name            = var.dx_gateway_name
  amazon_side_asn = var.dx_gateway_bgp_asn
}

resource "aws_dx_gateway_association" "this" {
  count = var.create_dx_gateway && var.associate_dx_gateway ? 1 : 0

  dx_gateway_id         = aws_dx_gateway.this[0].id
  associated_gateway_id = concat(aws_vpn_gateway.this.*.id[0], [var.vgw_id])[0]
}

resource "aws_dx_gateway_association" "cross_account" {
  count    = var.crossaccount_dx_gateway ? 1 : 0
  provider = aws.accepter

  dx_gateway_id                       = var.dx_gateway_id
  proposal_id                         = aws_dx_gateway_association_proposal.this.*.id[0]
  associated_gateway_owner_account_id = data.aws_caller_identity.this.account_id
}

resource "aws_dx_gateway_association_proposal" "this" {
  count = var.crossaccount_dx_gateway ? 1 : 0

  dx_gateway_id               = var.dx_gateway_id
  associated_gateway_id       = var.vgw_id
  dx_gateway_owner_account_id = var.dx_gateway_owner_account_id
}

resource "aws_vpn_gateway" "this" {
  count = var.create_dx_gateway && var.create_vgw ? 1 : 0

  vpc_id = var.vpc_id
  tags   = var.vgw_tags
}

resource "aws_dx_bgp_peer" "this" {
  count = var.create_bgp_peer ? 1 : 0

  address_family       = var.dx_bgp_peer_addess_family
  bgp_asn              = var.dx_bgp_peer_asn
  virtual_interface_id = var.dx_bgp_virtual_interface_id

  bgp_auth_key     = var.dx_bgp_auth_key
  customer_address = var.dx_bgp_customer_address
}
