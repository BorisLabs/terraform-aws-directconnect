variable "network_cidr" {
  description = "Network base address to calculate IPs"
  default     = "169.254.254.0/24"

  type = string
}

variable "create_dx_private_hosted_vif" {
  description = "Create a DX Private Hosted Virtual Interface"
  default     = false

  type = bool
}

variable "create_dx_private_vif" {
  description = "Create a DX Private Virtual Interface"
  default     = false

  type = bool
}

variable "create_dx_public_vif" {
  description = "Create a DX Public Virtual Interface"
  default     = false

  type = bool
}

variable "create_dx_gateway" {
  description = "Create a DX Gateway"
  default     = false

  type = bool
}

variable "lookup_gateway" {
  description = "Find a gateway to use when associating a VIF to a Gateway conflicts with create DX Gateway"
  default     = false

  type = bool
}

variable "associate_dx_gateway" {
  description = "Associate a DX Gateway"
  default     = false

  type = bool
}

variable "crossaccount_dx_gateway" {
  description = "Create a Cross Account DX Proposal & acceptance conflicts with associate_dx_gateway"
  default     = false

  type = bool
}

variable "create_vgw" {
  description = "Ability to create a VGW required for DX gateway"
  default     = false

  type = bool
}

variable "create_dx_connection" {
  description = "Create a DX Connection"
  default     = false

  type = bool
}

variable "create_dx_lag" {
  description = "Creates a LAG Group"
  default     = false

  type = bool
}

variable "dx_lag_name" {
  description = "Name of the Lag group"
  default     = null

  type = string
}

variable "dx_lag_tags" {
  description = "Tags to associate with a Lag Group"
  default     = {}

  type = map(string)
}

variable "dx_lag_id" {
  description = "ID of LAG Group which can be used to create a VIF on"
  default     = null

  type = string
}

variable "dx_connection_bandwith" {
  description = "DX Connection Bandwidth depends on location if all speeds are available"
  default     = "1Gbps"

  type = string
}

variable "dx_connection_location" {
  description = "AWS Direct connect location"
  default     = "EqLD5"

  type = string
}

variable "dx_connection_provider" {
  description = "The name of the service provider i.e. Colt / Equinex"
  default     = null

  type = string
}

variable "dx_connection_request_macsec" {
  description = "Optional attribute to allow the connection to support MAC Security, supported on 10 & 100Gbps connections"
  default     = false

  type = bool
}

variable "dx_connection_encryption_mode" {
  description = "The connection MAC Security (MACsec) encryption mode"
  default     = null

  type = string
}

variable "dx_connection_skip_destroy" {
  description = "Set to true if you don't want Terraform to delete the connection on destroy"
  default     = false

  type = bool
}

variable "dx_connection_name" {
  description = "Name of the DX Connection"
  default     = null

  type = string
}

variable "dx_connection_tags" {
  description = "Tags for DX Connection"
  default     = {}

  type = map(string)
}

variable "attach_vgw" {
  description = "Ability to attach an already existing VGW as appose to create one."
  default     = false
}

variable "vgw_id" {
  description = "AWS ID of the Virtual Private Gateway if attaching one use in conjunction with attach VGW"
  default     = null

  type = string
}

variable "vpc_id" {
  description = "Required if you are creating and attach DX & VGW"
  default     = null

  type = string
}

variable "vgw_tags" {
  description = "Tags for VGW Resource"
  default     = {}

  type = map(string)
}

variable "dx_gateway_bgp_asn" {
  description = "BGP ASN For DX Gateway"
  default     = 65534

  type = number
}

variable "dx_private_vif_amazon_address" {
  description = "Optional IPV4 CIDR address to use to send traffic to AWS Amazon. Required for IPV4 BGP peers"
  default     = "169.254.254.253/30"

  type = string
}

variable "dx_private_vif_customer_address" {
  description = "Optional IPV4 CIDR Address to use for customer side of the DX VIF"
  default     = "169.254.254.254/30"

  type = string
}

variable "dx_private_vif_name" {
  description = "Name of the Virtual Interface"
  default     = "this-is-a-default-name"

  type = string
}

variable "dx_private_vif_tags" {
  description = "Tags to be applied to a Private VIF !!! Not Hosted Private VIF"
  default     = {}

  type = map(string)
}

variable "dx_private_vif_vlan_id" {
  description = "The VLAN ID to use on the virtual interface"
  default     = 4094

  type = number
}

variable "dx_private_vif_bgp_asn" {
  description = "BGP ASN for Client VIF"
  default     = 65000

  type = number
}

variable "dx_private_vif_address_family" {
  description = "The Address Family for the BGP Peer ipv4 or ipv6"
  default     = "ipv4"

  type = string

  validation {
    condition     = contains(["ipv4", "ipv6"], var.dx_private_vif_address_family)
    error_message = "Supported values are either ipv4 or ipv6"
  }
}


variable "dx_public_vif_amazon_address" {
  description = "Optional IPV4 CIDR address to use to send traffic to AWS Amazon. Required for IPV4 BGP peers"
  default     = "169.254.254.253/30"

  type = string
}

variable "dx_public_vif_customer_address" {
  description = "Optional IPV4 CIDR Address to use for customer side of the DX VIF"
  default     = "169.254.254.254/30"

  type = string
}

variable "dx_public_vif_name" {
  description = "Name of the Virtual Interface"
  default     = "this-is-a-default-name"

  type = string
}

variable "dx_public_vif_tags" {
  description = "Tags to be applied to a Private VIF !!! Not Hosted Private VIF"
  default     = {}

  type = map(string)
}

variable "dx_public_vif_vlan_id" {
  description = "The VLAN ID to use on the virtual interface"
  default     = 4094

  type = number
}

variable "dx_public_vif_bgp_asn" {
  description = "BGP ASN for Client VIF"
  default     = 65000

  type = number
}

variable "dx_public_vif_address_family" {
  description = "The Address Family for the BGP Peer ipv4 or ipv6"
  default     = "ipv4"

  type = string

  validation {
    condition     = contains(["ipv4", "ipv6"], var.dx_public_vif_address_family)
    error_message = "Supported values are either ipv4 or ipv6"
  }
}

variable "dx_public_vif_bgp_auth_key" {
  description = "Auth key for BGP Configuration"
  default     = null
  sensitive   = true

  type = string
}

variable "dx_public_vif_route_filter_prefixes" {
  description = "A List of routes to be advertised to the AWS Network in this Region"
  default     = []

  type = list(string)
}

variable "dx_private_hosted_vif_name" {
  description = "The name of the Private hosted VIF"
  default     = null

  type = string
}

variable "dx_private_hosted_vif_address_family" {
  description = "The address familty for the BGP Peer ipv4 or ipv6"
  default     = "ipv4"

  validation {
    condition     = contains(["ipv4", "ipv6"], var.dx_private_hosted_vif_address_family)
    error_message = "Supported values are either ipv4 or ipv6"
  }

  type = string
}

variable "dx_private_hosted_vif_bgp_asn" {
  description = "BGP ASN for client Hosted VIF"
  default     = 65001

  type = number
}

variable "dx_private_hosted_vif_vlan_id" {
  description = "The VLAN ID to use on the hosted Virtual interface"
  default     = 4093

  type = number
}

variable "dx_private_hosted_vif_amazon_address" {
  description = "Optional IPV4 CIDR address to use to send traffic to AWS Amazon. Required for IPV4 BGP peers"
  default     = "169.254.254.1/30"

  type = string
}

variable "dx_private_hosted_vif_customer_address" {
  description = "Optional IPV4 CIDR address to use to which Amazon should send traffic. Required for IPV4 BGP Peers"
  default     = "169.254.254.2/30"

  type = string
}

variable "dx_connection_id" {
  description = "ID Of the DX Connection"
  default     = null

  type = string
}

variable "dx_private_hosted_vif_owner_account_id" {
  description = "The AWS account that will own the new virtual interface."
  default     = null

  type = string
}

variable "mtu_size" {
  description = "MTU size for the interface supports 1500 or 9001 (Jumbo)"
  default     = 1500

  type = number

  validation {
    condition     = contains([1500, 9001], var.mtu_size)
    error_message = "MTU Size can only be 1500 or 9001"
  }
}

variable "dx_gateway_name" {
  description = "DX Gateway name"
  default     = "dx-gateway-default-name"

  type = string
}

variable "dx_gateway_owner_account_id" {
  description = "The owning account of the AWS Direct connect Gateway"
  default     = null

  type = string
}

variable "dx_gateway_id" {
  description = "A direct gateway Id"
  default     = null

  type = string
}

variable "create_bgp_peer" {
  description = "Creates a BGP Peer resource"
  default     = false

  type = bool
}

variable "dx_bgp_peer_addess_family" {
  description = "Address family for BGP Peer IPV4 / IPV6"
  default     = "ipv4"

  validation {
    condition     = contains(["ipv4", "ipv6"], var.dx_bgp_peer_addess_family)
    error_message = "Supported values are either ipv4 or ipv6"
  }

  type = string
}

variable "dx_bgp_peer_asn" {
  description = "BGP ASN Number"
  default     = 65535

  type = number
}

variable "dx_bgp_virtual_interface_id" {
  description = "Virutal interface to attach the peer to"
  default     = null

  type = string
}

variable "dx_bgp_auth_key" {
  description = "Auth key for BGP configuration"
  default     = null

  type = string
}

variable "dx_bgp_customer_address" {
  description = "Customer BGP Address, required for Public VIF"
  default     = null

  type = string
}

variable "allowed_prefixes" {
  description = "List of allowed prefixes to advertise to the Direct Connect Gateway"
  default     = null

  type = set(string)
}
