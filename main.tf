resource "aws_dx_connection" "this" {
  count = "${var.create_dx_connection ? 1 : 0}"

  name      = "${var.dx_connection_name}"
  bandwidth = "${var.dx_connection_bandwith}"
  location  = "${var.dx_connection_location}"

  tags = "${var.dx_connection_tags}"
}

resource "aws_dx_connection_association" "this" {
  count = "${var.create_dx_lag && var.create_dx_connection ? 1 : 0}"

  connection_id = "${element(aws_dx_connection.this.*.id, 0)}"
  lag_id        = "${element(aws_dx_lag.this.*.id, 0)}"
}

resource "aws_dx_lag" "this" {
  count = "${var.create_dx_lag ? 1 : 0}"

  connections_bandwidth = "${var.dx_connection_bandwith}"
  location              = "${var.dx_connection_location}"
  name                  = "${var.dx_lag_name}"

  tags = "${var.dx_lag_tags}"
}

resource "aws_dx_hosted_private_virtual_interface" "private_vif" {
  count = "${var.create_dx_private_hosted_vif ? 1 : 0}"

  name          = "${var.dx_private_hosted_vif_name}"
  connection_id = "${var.dx_connection_id}"

  address_family   = "${var.dx_private_hosted_vif_address_family}"
  bgp_asn          = "${var.dx_private_hosted_vif_bgp_asn}"
  owner_account_id = "${var.dx_private_hosted_vif_owner_account_id}"
  vlan             = "${var.dx_private_hosted_vif_vlan_id}"
  customer_address = "${var.dx_private_hosted_vif_customer_address}"
  amazon_address   = "${var.dx_private_hosted_vif_amazon_address}"
  mtu              = "${var.mtu_size}"
}

resource "aws_dx_hosted_private_virtual_interface_accepter" "private_vif_accepter" {
  count = "${var.create_dx_private_hosted_vif ? 1 : 0}"

  provider             = "aws.accepter"
  virtual_interface_id = "${aws_dx_hosted_private_virtual_interface.private_vif.id}"
  vpn_gateway_id       = "${concat(element(aws_vpn_gateway.this.*.id, 0), list(var.vgw_id))}"
}

resource "aws_dx_private_virtual_interface" "this" {
  count = "${var.create_dx_private_vif ? 1 : 0}"

  name          = "${var.dx_private_vif_name}"
  connection_id = "${var.dx_connection_id}"

  address_family   = "${var.dx_private_vif_address_family}"
  bgp_asn          = "${var.dx_private_vif_bgp_asn}"
  vlan             = "${var.dx_private_vif_vlan_id}"
  amazon_address   = "${var.dx_private_vif_amazon_address}"
  customer_address = "${var.dx_private_vif_customer_address}"

  mtu = "${var.mtu_size}"

  dx_gateway_id = "${element(concat(aws_dx_gateway.this.*.id, data.aws_dx_gateway.this.*.id), 0)}"

  tags = "${var.dx_private_vif_tags}"
}

resource "aws_dx_gateway" "this" {
  count = "${var.create_dx_gateway ? 1 : 0}"

  name            = "${var.dx_gateway_name}"
  amazon_side_asn = "${var.dx_gateway_bgp_asn}"
}

resource "aws_dx_gateway_association" "this" {
  count = "${var.create_dx_gateway && var.associate_dx_gateway ? 1 : 0}"

  dx_gateway_id  = "${aws_dx_gateway.this.*.id[0]}"
  vpn_gateway_id = "${element(concat(element(aws_vpn_gateway.this.*.id, 0), list(var.vgw_id)), 0)}"
}

resource "aws_dx_gateway_association_proposal" "this" {
  count = "${var.create_dx_gateway && var.crossaccount_dx_gateway ? 1 : 0}"

  dx_gateway_id  = "${aws_dx_gateway.this.id}"
  vpn_gateway_id = "${var.vgw_id}"

  dx_gateway_owner_account_id = "${aws_dx_gateway.this.owner_account_id}"
}

resource "aws_vpn_gateway" "this" {
  count = "${var.create_dx_gateway && var.create_vgw ? 1 : 0}"

  vpc_id = "${var.vpc_id}"
  tags   = "${var.vgw_tags}"
}
