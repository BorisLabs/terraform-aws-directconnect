resource "aws_dx_hosted_private_virtual_interface" "private_vif" {
  provider         = "aws.source"
  address_family   = "${var.address_family}"
  bgp_asn          = "${var.bgp_asn}"
  connection_id    = "${var.connection_id}"
  name             = "${var.name}"
  owner_account_id = "${var.owner_account_id}"
  vlan             = "${var.vlan_id}"
  amazon_address   = "${var.amazonAddress}"
}

resource "aws_dx_hosted_private_virtual_interface_accepter" "private_vif_accepter" {
  provider             = "aws.accepter"
  virtual_interface_id = "${aws_dx_hosted_private_virtual_interface.private_vif.id}"
  vpn_gateway_id       = "${var.vgw_id}"
}
