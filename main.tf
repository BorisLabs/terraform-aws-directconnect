resource "aws_dx_hosted_private_virtual_interface" "private_vif" {
  count = "${var.create_dx_private_hosted_vif ? 1 : 0}"

  address_family   = "${var.address_family}"
  bgp_asn          = "${var.bgp_asn}"
  connection_id    = "${var.connection_id}"
  name             = "${var.name}"
  owner_account_id = "${var.owner_account_id}"
  vlan             = "${var.vlan_id}"
  amazon_address   = "${var.amazon_address}"
  mtu              = "${var.mtu}"
}

resource "aws_dx_hosted_private_virtual_interface_accepter" "private_vif_accepter" {
  count = "${var.create_dx_private_hosted_vif ? 1 : 0}"

  provider             = "aws.accepter"
  virtual_interface_id = "${aws_dx_hosted_private_virtual_interface.private_vif.id}"
  vpn_gateway_id       = "${concat(element(aws_vpn_gateway.this.*.id, 0), list(var.vgw_id))}"
}

resource "aws_dx_private_virtual_interface" "this" {
  count = "${var.create_private_hosted_vif ? 1 : 0}"

  address_family = "${var.address_family}"
  bgp_asn        = "${var.bgp_asn}"
  connection_id  = "${var.connection_id}"
  name           = "${var.name}"
  vlan           = "${var.vlan_id}"
  amazon_address = "${var.amazon_address}"
  mtu            = "${var.mtu}"
}

resource "aws_dx_gateway" "this" {
  count = "${var.create_dx_gateway ? 1 : 0}"

  amazon_side_asn = "${var.bgp_asn}"
  name            = "${var.gateway_name}"
}

resource "aws_dx_gateway_association" "this" {
  count = "${var.create_dx_gateway ? 1 : 0}"

  dx_gateway_id  =  "${aws_dx_gateway.this.*.id[0]}"
  vpn_gateway_id = "${concat(element(aws_vpn_gateway.this.*.id, 0), list(var.vgw_id))}"
}

resource "aws_vpn_gateway" "this" {
  count = "${var.create_dx_gateway && var.create_vgw ? 1 : 0}"

  vpc_id = "${var.vpc_id}"
  tags   = "${var.vgw_tags}"
}
