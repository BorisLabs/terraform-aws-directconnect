variable "address_family" {
  description = "The Address Family for the BGP Peer ipv4 or ipv6"
  default = "ipv4"
}

variable "vlan_prefix" {
  description = "VLAN ID for Private interface"
  default = 1
}

variable "aws_region" {
  default = "eu-west-1"
}

variable "create_dx_private_hosted_vif" {
  description = "Create a DX Private Hosted Virtual Interface"
  default = false
}

variable "create_private_hosted_vif" {
  description = "Create a DX Private virtual Interface"
  default = false
}

variable "create_dx_gateway" {
  description = "Create a DX gateway"
  default = false
}

variable "create_vgw" {
  description = "Ability to create a VGW required for DX gateway"
  default = false
}

variable "create_dx_connection" {
  description = "Create a DX Connection"
  default = false
}

variable "create_dx_lag" {
  description = "Creates a LAG Group"
  default = false
}

variable "lag_name" {
  description = "Name of the Lag group"
  default = ""
}

variable "lag_tags" {
  description = "Tags to associate with a Lag Group"
  default = {}

  type = "map"
}

variable "connection_bandwith" {
  description = "DX Connection Bandwidth 1Gbps or 10Gbps"
  default = "1Gbps"
}

variable "connection_location" {
  description = "AWS Direct connect location"
  default = "EqLD5"
}

variable "connection_name" {
  description = "Name of the DX Connection"
  default = ""
}

variable "connection_tags" {
  description = "Tags for DX Connection"
  default = {}

  type = "map"
}

variable "attach_vgw" {
  description = "Ability to attach an already existing VGW as appose to create one."
  default = false
}

variable "vgw_id" {
  description = "AWS ID of the Virtual Private Gateway if attaching one use in conjunction with attach VGW"
  default = ""
}

variable "vpc_id" {
  description = "Required if you are creating and attach DX & VGW"
  default = ""
}

variable "vgw_tags" {
  description = "Tags for VGW Resource"
  default = {}

  type = "map"
}

variable "bgp_asn" {
  description = "BGP ASN for Client VIF"
  default = ""
}

variable "amazon_address" {
  description = "Optional IPV4 CIDR address to use to send traffic to AWS Amazon. Required for IPV4 BGP peers"
  default = ""
}

variable "name" {
  description = "Name of the Virtual Interface"
  default = "this-is-a-default-name"
}

variable "private_vif_tags" {
  description = "Tags to be applied to a Private VIF !!! Not Hosted Private VIF"
  default = {}

  type = "map"
}

variable "vlan_id" {
  description = "The VLAN ID to use on the interface"
  default = "4094"
}

variable "connection_id" {
  description = "ID Of the DX Connection to attach the VIF to"
  default = ""
}

variable "owner_account_id" {
  description = "Owner Account who will own the VIF. This maybe another account in AWS."
  default = ""
}

variable "mtu" {
  description = "MTU size for the interface supports 1500 or 9001 (Jumbo)"
  default = "1500"
}

variable "gateway_name" {
  description = "DX Gateway name"
  default = ""
}
