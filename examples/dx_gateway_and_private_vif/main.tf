module "gateway" {
  source = "../../"

  create_dx_gateway = true

  dx_gateway_name    = "dx-gw-01"
  dx_gateway_bgp_asn = "65300"
}

module "private_vif_a" {
  source = "../../"

  create_dx_private_vif = true
  lookup_gateway        = true

  dx_gateway_name  = "${element(module.gateway.dx_gateway_name, 0)}"
  dx_connection_id = "dxcon-1234abcd"

  dx_private_vif_name             = "dx-private-vif-01-01-a"
  dx_private_vif_address_family   = "ipv4"
  dx_private_vif_customer_address = "169.254.254.102/30"
  dx_private_vif_amazon_address   = "169.254.254.101/30"
  dx_private_vif_bgp_asn          = "65200"
  dx_private_vif_vlan_id          = "200"

  dx_private_vif_tags = {
    Gateway    = "${element(module.gateway.dx_gateway_name, 0)}"
    Enviroment = "Development"
  }
}