variable "network_cidr" {
  description = "Network base address to calculate IPs"
  default     = "169.254.254.0/24"
}

variable "aws_region" {
  default = "eu-west-1"
}

variable "create_dx_private_hosted_vif" {
  description = "Create a DX Private Hosted Virtual Interface"
  default     = false
}

variable "create_dx_private_vif" {
  description = "Create a DX Private virtual Interface"
  default     = false
}

variable "create_dx_gateway" {
  description = "Create a DX Gateway"
  default     = false
}

variable "lookup_gateway" {
  description = "Find a gateway to use when associating a VIF to a Gateway conflicts with create DX Gateway"
  default     = false
}

variable "associate_dx_gateway" {
  description = "Associate a DX Gateway"
  default     = false
}

variable "crossaccount_dx_gateway" {
  description = "Create a Cross Account DX Proposal & acceptance conflicts with associate_dx_gateway"
  default     = false
}

variable "create_vgw" {
  description = "Ability to create a VGW required for DX gateway"
  default     = false
}

variable "create_dx_connection" {
  description = "Create a DX Connection"
  default     = false
}

variable "create_dx_lag" {
  description = "Creates a LAG Group"
  default     = false
}

variable "dx_lag_name" {
  description = "Name of the Lag group"
  default     = ""
}

variable "dx_lag_tags" {
  description = "Tags to associate with a Lag Group"
  default     = {}

  type = "map"
}

variable "dx_connection_bandwith" {
  description = "DX Connection Bandwidth 1Gbps or 10Gbps"
  default     = "1Gbps"
}

variable "dx_connection_location" {
  description = "AWS Direct connect location"
  default     = "EqLD5"
}

variable "dx_connection_name" {
  description = "Name of the DX Connection"
  default     = ""
}

variable "dx_connection_tags" {
  description = "Tags for DX Connection"
  default     = {}

  type = "map"
}

variable "attach_vgw" {
  description = "Ability to attach an already existing VGW as appose to create one."
  default     = false
}

variable "vgw_id" {
  description = "AWS ID of the Virtual Private Gateway if attaching one use in conjunction with attach VGW"
  default     = ""
}

variable "vpc_id" {
  description = "Required if you are creating and attach DX & VGW"
  default     = ""
}

variable "vgw_tags" {
  description = "Tags for VGW Resource"
  default     = {}

  type = "map"
}

variable "dx_gateway_bgp_asn" {
  description = "BGP ASN For DX Gateway"
  default     = "65534"
}

variable "dx_private_vif_amazon_address" {
  description = "Optional IPV4 CIDR address to use to send traffic to AWS Amazon. Required for IPV4 BGP peers"
  default     = "169.254.254.253/30"
}

variable "dx_private_vif_customer_address" {
  description = "Optional IPV4 CIDR Address to use for customer side of the DX VIF"
  default     = "169.254.254.254/30"
}

variable "dx_private_vif_name" {
  description = "Name of the Virtual Interface"
  default     = "this-is-a-default-name"
}

variable "dx_private_vif_tags" {
  description = "Tags to be applied to a Private VIF !!! Not Hosted Private VIF"
  default     = {}

  type = "map"
}

variable "dx_private_vif_vlan_id" {
  description = "The VLAN ID to use on the virtual interface"
  default     = "4094"
}

variable "dx_private_vif_bgp_asn" {
  description = "BGP ASN for Client VIF"
  default     = "65000"
}

variable "dx_private_vif_address_family" {
  description = "The Address Family for the BGP Peer ipv4 or ipv6"
  default     = "ipv4"
}

variable "dx_private_hosted_vif_name" {
  description = "The name of the Private hosted VIF"
  default     = ""
}

variable "dx_private_hosted_vif_address_family" {
  description = "The address familty for the BGP Peer ipv4 or ipv6"
  default     = "ipv4"
}

variable "dx_private_hosted_vif_bgp_asn" {
  description = "BGP ASN for client Hosted VIF"
  default     = "65001"
}

variable "dx_private_hosted_vif_vlan_id" {
  description = "The VLAN ID to use on the hosted Virtual interface"
  default     = "4093"
}

variable "dx_private_hosted_vif_amazon_address" {
  description = "Optional IPV4 CIDR address to use to send traffic to AWS Amazon. Required for IPV4 BGP peers"
  default     = "169.254.254.1/30"
}

variable "dx_private_hosted_vif_customer_address" {
  description = "Optional IPV4 CIDR address to use to which Amazon should send traffic. Required for IPV4 BGP Peers"
  default     = "169.254.254.2/30"
}

variable "dx_connection_id" {
  description = "ID Of the DX Connection to attach the VIF to"
  default     = ""
}

variable "dx_private_hosted_vif_owner_account_id" {
  description = "Owner Account who will own the VIF. This maybe another account in AWS."
  default     = ""
}

variable "mtu_size" {
  description = "MTU size for the interface supports 1500 or 9001 (Jumbo)"
  default     = "1500"
}

variable "dx_gateway_name" {
  description = "DX Gateway name"
  default     = ""
}
