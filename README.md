# AWS Direct Connect Terraform Module
Terraform module which creates [Direct Connect resources](https://docs.aws.amazon.com/directconnect/latest/UserGuide/Welcome.html) on AWS.

This module aims to provide all connotations of a Direct Connect setup for AWS.

## Usage
```HCL
module "gateway_and_attached_vif" {
  source  = "BorisLabs/directconnect/aws"
  version = "0.0.1"

  create_dx_gateway = true

  dx_gateway_name    = "dx-gw-01"
  dx_gateway_bgp_asn = "65300"

  create_dx_private_vif = true

  dx_connection_id = "dxcon-1234abcd"

  dx_private_vif_name             = "dx-private-vif-01-01-a"
  dx_private_vif_address_family   = "ipv4"
  dx_private_vif_customer_address = "169.254.254.102/30"
  dx_private_vif_amazon_address   = "169.254.254.101/30"
  dx_private_vif_bgp_asn          = "65200"
  dx_private_vif_vlan_id          = "200"

  dx_private_vif_tags = {
    Gateway    = "dx-gw-01"
    Enviroment = "Development"
  }
}
```

# Examples
- [Single VIF](https://github.com/BorisLabs/terraform-aws-directconnect/tree/master/examples/single_vif)
- [DX Connection](https://github.com/BorisLabs/terraform-aws-directconnect/tree/master/examples/dx_connection)
- [VIF attached to pre-existing DX Gateway](https://github.com/BorisLabs/terraform-aws-directconnect/tree/master/examples/dx_gateway_and_private_vif)
- [Complete Terragrunt for DX Conn, GW, VIF -- COMING SOON]()

## Terraform Versions
This module supports Terraform v0.12 starting at version v0.1.0.  
For Terraform v0.11 support please use v0.0.2

## Authors
Module managed by  
[Rob Houghton](https://github.com/ALLFIVE)  
[Josh Sinfield](https://github.com/JoshiiSinfield)  
[Ben Arundel](https://github.com/barundel)

## Notes

<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 0.13)

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws)

- <a name="provider_aws.accepter"></a> [aws.accepter](#provider\_aws.accepter)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_dx_bgp_peer.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dx_bgp_peer) (resource)
- [aws_dx_connection.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dx_connection) (resource)
- [aws_dx_connection_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dx_connection_association) (resource)
- [aws_dx_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dx_gateway) (resource)
- [aws_dx_gateway_association.cross_account](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dx_gateway_association) (resource)
- [aws_dx_gateway_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dx_gateway_association) (resource)
- [aws_dx_gateway_association_proposal.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dx_gateway_association_proposal) (resource)
- [aws_dx_hosted_private_virtual_interface.private_vif](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dx_hosted_private_virtual_interface) (resource)
- [aws_dx_hosted_private_virtual_interface_accepter.private_vif_accepter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dx_hosted_private_virtual_interface_accepter) (resource)
- [aws_dx_lag.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dx_lag) (resource)
- [aws_dx_private_virtual_interface.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dx_private_virtual_interface) (resource)
- [aws_dx_public_virtual_interface.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dx_public_virtual_interface) (resource)
- [aws_vpn_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway) (resource)
- [aws_caller_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) (data source)
- [aws_dx_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/dx_gateway) (data source)

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_associate_dx_gateway"></a> [associate\_dx\_gateway](#input\_associate\_dx\_gateway)

Description: Associate a DX Gateway

Type: `bool`

Default: `false`

### <a name="input_attach_vgw"></a> [attach\_vgw](#input\_attach\_vgw)

Description: Ability to attach an already existing VGW as appose to create one.

Type: `bool`

Default: `false`

### <a name="input_create_bgp_peer"></a> [create\_bgp\_peer](#input\_create\_bgp\_peer)

Description: Creates a BGP Peer resource

Type: `bool`

Default: `false`

### <a name="input_create_dx_connection"></a> [create\_dx\_connection](#input\_create\_dx\_connection)

Description: Create a DX Connection

Type: `bool`

Default: `false`

### <a name="input_create_dx_gateway"></a> [create\_dx\_gateway](#input\_create\_dx\_gateway)

Description: Create a DX Gateway

Type: `bool`

Default: `false`

### <a name="input_create_dx_lag"></a> [create\_dx\_lag](#input\_create\_dx\_lag)

Description: Creates a LAG Group

Type: `bool`

Default: `false`

### <a name="input_create_dx_private_hosted_vif"></a> [create\_dx\_private\_hosted\_vif](#input\_create\_dx\_private\_hosted\_vif)

Description: Create a DX Private Hosted Virtual Interface

Type: `bool`

Default: `false`

### <a name="input_create_dx_private_vif"></a> [create\_dx\_private\_vif](#input\_create\_dx\_private\_vif)

Description: Create a DX Private Virtual Interface

Type: `bool`

Default: `false`

### <a name="input_create_dx_public_vif"></a> [create\_dx\_public\_vif](#input\_create\_dx\_public\_vif)

Description: Create a DX Public Virtual Interface

Type: `bool`

Default: `false`

### <a name="input_create_vgw"></a> [create\_vgw](#input\_create\_vgw)

Description: Ability to create a VGW required for DX gateway

Type: `bool`

Default: `false`

### <a name="input_crossaccount_dx_gateway"></a> [crossaccount\_dx\_gateway](#input\_crossaccount\_dx\_gateway)

Description: Create a Cross Account DX Proposal & acceptance conflicts with associate\_dx\_gateway

Type: `bool`

Default: `false`

### <a name="input_dx_bgp_auth_key"></a> [dx\_bgp\_auth\_key](#input\_dx\_bgp\_auth\_key)

Description: Auth key for BGP configuration

Type: `string`

Default: `null`

### <a name="input_dx_bgp_customer_address"></a> [dx\_bgp\_customer\_address](#input\_dx\_bgp\_customer\_address)

Description: Customer BGP Address, required for Public VIF

Type: `string`

Default: `null`

### <a name="input_dx_bgp_peer_addess_family"></a> [dx\_bgp\_peer\_addess\_family](#input\_dx\_bgp\_peer\_addess\_family)

Description: Address family for BGP Peer IPV4 / IPV6

Type: `string`

Default: `"ipv4"`

### <a name="input_dx_bgp_peer_asn"></a> [dx\_bgp\_peer\_asn](#input\_dx\_bgp\_peer\_asn)

Description: BGP ASN Number

Type: `number`

Default: `65535`

### <a name="input_dx_bgp_virtual_interface_id"></a> [dx\_bgp\_virtual\_interface\_id](#input\_dx\_bgp\_virtual\_interface\_id)

Description: Virutal interface to attach the peer to

Type: `string`

Default: `null`

### <a name="input_dx_connection_bandwith"></a> [dx\_connection\_bandwith](#input\_dx\_connection\_bandwith)

Description: DX Connection Bandwidth depends on location if all speeds are available

Type: `string`

Default: `"1Gbps"`

### <a name="input_dx_connection_encryption_mode"></a> [dx\_connection\_encryption\_mode](#input\_dx\_connection\_encryption\_mode)

Description: The connection MAC Security (MACsec) encryption mode

Type: `string`

Default: `null`

### <a name="input_dx_connection_id"></a> [dx\_connection\_id](#input\_dx\_connection\_id)

Description: ID Of the DX Connection

Type: `string`

Default: `null`

### <a name="input_dx_connection_location"></a> [dx\_connection\_location](#input\_dx\_connection\_location)

Description: AWS Direct connect location

Type: `string`

Default: `"EqLD5"`

### <a name="input_dx_connection_name"></a> [dx\_connection\_name](#input\_dx\_connection\_name)

Description: Name of the DX Connection

Type: `string`

Default: `null`

### <a name="input_dx_connection_provider"></a> [dx\_connection\_provider](#input\_dx\_connection\_provider)

Description: The name of the service provider i.e. Colt / Equinex

Type: `string`

Default: `null`

### <a name="input_dx_connection_request_macsec"></a> [dx\_connection\_request\_macsec](#input\_dx\_connection\_request\_macsec)

Description: Optional attribute to allow the connection to support MAC Security, supported on 10 & 100Gbps connections

Type: `bool`

Default: `false`

### <a name="input_dx_connection_skip_destroy"></a> [dx\_connection\_skip\_destroy](#input\_dx\_connection\_skip\_destroy)

Description: Set to true if you don't want Terraform to delete the connection on destroy

Type: `bool`

Default: `false`

### <a name="input_dx_connection_tags"></a> [dx\_connection\_tags](#input\_dx\_connection\_tags)

Description: Tags for DX Connection

Type: `map(string)`

Default: `{}`

### <a name="input_dx_gateway_bgp_asn"></a> [dx\_gateway\_bgp\_asn](#input\_dx\_gateway\_bgp\_asn)

Description: BGP ASN For DX Gateway

Type: `number`

Default: `65534`

### <a name="input_dx_gateway_id"></a> [dx\_gateway\_id](#input\_dx\_gateway\_id)

Description: A direct gateway Id

Type: `string`

Default: `null`

### <a name="input_dx_gateway_name"></a> [dx\_gateway\_name](#input\_dx\_gateway\_name)

Description: DX Gateway name

Type: `string`

Default: `"dx-gateway-default-name"`

### <a name="input_dx_gateway_owner_account_id"></a> [dx\_gateway\_owner\_account\_id](#input\_dx\_gateway\_owner\_account\_id)

Description: The owning account of the AWS Direct connect Gateway

Type: `string`

Default: `null`

### <a name="input_dx_lag_id"></a> [dx\_lag\_id](#input\_dx\_lag\_id)

Description: ID of LAG Group which can be used to create a VIF on

Type: `string`

Default: `null`

### <a name="input_dx_lag_name"></a> [dx\_lag\_name](#input\_dx\_lag\_name)

Description: Name of the Lag group

Type: `string`

Default: `null`

### <a name="input_dx_lag_tags"></a> [dx\_lag\_tags](#input\_dx\_lag\_tags)

Description: Tags to associate with a Lag Group

Type: `map(string)`

Default: `{}`

### <a name="input_dx_private_hosted_vif_address_family"></a> [dx\_private\_hosted\_vif\_address\_family](#input\_dx\_private\_hosted\_vif\_address\_family)

Description: The address familty for the BGP Peer ipv4 or ipv6

Type: `string`

Default: `"ipv4"`

### <a name="input_dx_private_hosted_vif_amazon_address"></a> [dx\_private\_hosted\_vif\_amazon\_address](#input\_dx\_private\_hosted\_vif\_amazon\_address)

Description: Optional IPV4 CIDR address to use to send traffic to AWS Amazon. Required for IPV4 BGP peers

Type: `string`

Default: `"169.254.254.1/30"`

### <a name="input_dx_private_hosted_vif_bgp_asn"></a> [dx\_private\_hosted\_vif\_bgp\_asn](#input\_dx\_private\_hosted\_vif\_bgp\_asn)

Description: BGP ASN for client Hosted VIF

Type: `number`

Default: `65001`

### <a name="input_dx_private_hosted_vif_customer_address"></a> [dx\_private\_hosted\_vif\_customer\_address](#input\_dx\_private\_hosted\_vif\_customer\_address)

Description: Optional IPV4 CIDR address to use to which Amazon should send traffic. Required for IPV4 BGP Peers

Type: `string`

Default: `"169.254.254.2/30"`

### <a name="input_dx_private_hosted_vif_name"></a> [dx\_private\_hosted\_vif\_name](#input\_dx\_private\_hosted\_vif\_name)

Description: The name of the Private hosted VIF

Type: `string`

Default: `null`

### <a name="input_dx_private_hosted_vif_owner_account_id"></a> [dx\_private\_hosted\_vif\_owner\_account\_id](#input\_dx\_private\_hosted\_vif\_owner\_account\_id)

Description: The AWS account that will own the new virtual interface.

Type: `string`

Default: `null`

### <a name="input_dx_private_hosted_vif_vlan_id"></a> [dx\_private\_hosted\_vif\_vlan\_id](#input\_dx\_private\_hosted\_vif\_vlan\_id)

Description: The VLAN ID to use on the hosted Virtual interface

Type: `number`

Default: `4093`

### <a name="input_dx_private_vif_address_family"></a> [dx\_private\_vif\_address\_family](#input\_dx\_private\_vif\_address\_family)

Description: The Address Family for the BGP Peer ipv4 or ipv6

Type: `string`

Default: `"ipv4"`

### <a name="input_dx_private_vif_amazon_address"></a> [dx\_private\_vif\_amazon\_address](#input\_dx\_private\_vif\_amazon\_address)

Description: Optional IPV4 CIDR address to use to send traffic to AWS Amazon. Required for IPV4 BGP peers

Type: `string`

Default: `"169.254.254.253/30"`

### <a name="input_dx_private_vif_bgp_asn"></a> [dx\_private\_vif\_bgp\_asn](#input\_dx\_private\_vif\_bgp\_asn)

Description: BGP ASN for Client VIF

Type: `number`

Default: `65000`

### <a name="input_dx_private_vif_customer_address"></a> [dx\_private\_vif\_customer\_address](#input\_dx\_private\_vif\_customer\_address)

Description: Optional IPV4 CIDR Address to use for customer side of the DX VIF

Type: `string`

Default: `"169.254.254.254/30"`

### <a name="input_dx_private_vif_name"></a> [dx\_private\_vif\_name](#input\_dx\_private\_vif\_name)

Description: Name of the Virtual Interface

Type: `string`

Default: `"this-is-a-default-name"`

### <a name="input_dx_private_vif_tags"></a> [dx\_private\_vif\_tags](#input\_dx\_private\_vif\_tags)

Description: Tags to be applied to a Private VIF !!! Not Hosted Private VIF

Type: `map(string)`

Default: `{}`

### <a name="input_dx_private_vif_vlan_id"></a> [dx\_private\_vif\_vlan\_id](#input\_dx\_private\_vif\_vlan\_id)

Description: The VLAN ID to use on the virtual interface

Type: `number`

Default: `4094`

### <a name="input_dx_public_vif_address_family"></a> [dx\_public\_vif\_address\_family](#input\_dx\_public\_vif\_address\_family)

Description: The Address Family for the BGP Peer ipv4 or ipv6

Type: `string`

Default: `"ipv4"`

### <a name="input_dx_public_vif_amazon_address"></a> [dx\_public\_vif\_amazon\_address](#input\_dx\_public\_vif\_amazon\_address)

Description: Optional IPV4 CIDR address to use to send traffic to AWS Amazon. Required for IPV4 BGP peers

Type: `string`

Default: `"169.254.254.253/30"`

### <a name="input_dx_public_vif_bgp_asn"></a> [dx\_public\_vif\_bgp\_asn](#input\_dx\_public\_vif\_bgp\_asn)

Description: BGP ASN for Client VIF

Type: `number`

Default: `65000`

### <a name="input_dx_public_vif_bgp_auth_key"></a> [dx\_public\_vif\_bgp\_auth\_key](#input\_dx\_public\_vif\_bgp\_auth\_key)

Description: Auth key for BGP Configuration

Type: `string`

Default: `null`

### <a name="input_dx_public_vif_customer_address"></a> [dx\_public\_vif\_customer\_address](#input\_dx\_public\_vif\_customer\_address)

Description: Optional IPV4 CIDR Address to use for customer side of the DX VIF

Type: `string`

Default: `"169.254.254.254/30"`

### <a name="input_dx_public_vif_name"></a> [dx\_public\_vif\_name](#input\_dx\_public\_vif\_name)

Description: Name of the Virtual Interface

Type: `string`

Default: `"this-is-a-default-name"`

### <a name="input_dx_public_vif_route_filter_prefixes"></a> [dx\_public\_vif\_route\_filter\_prefixes](#input\_dx\_public\_vif\_route\_filter\_prefixes)

Description: A List of routes to be advertised to the AWS Network in this Region

Type: `list(string)`

Default: `[]`

### <a name="input_dx_public_vif_tags"></a> [dx\_public\_vif\_tags](#input\_dx\_public\_vif\_tags)

Description: Tags to be applied to a Private VIF !!! Not Hosted Private VIF

Type: `map(string)`

Default: `{}`

### <a name="input_dx_public_vif_vlan_id"></a> [dx\_public\_vif\_vlan\_id](#input\_dx\_public\_vif\_vlan\_id)

Description: The VLAN ID to use on the virtual interface

Type: `number`

Default: `4094`

### <a name="input_lookup_gateway"></a> [lookup\_gateway](#input\_lookup\_gateway)

Description: Find a gateway to use when associating a VIF to a Gateway conflicts with create DX Gateway

Type: `bool`

Default: `false`

### <a name="input_mtu_size"></a> [mtu\_size](#input\_mtu\_size)

Description: MTU size for the interface supports 1500 or 9001 (Jumbo)

Type: `number`

Default: `1500`

### <a name="input_network_cidr"></a> [network\_cidr](#input\_network\_cidr)

Description: Network base address to calculate IPs

Type: `string`

Default: `"169.254.254.0/24"`

### <a name="input_vgw_id"></a> [vgw\_id](#input\_vgw\_id)

Description: AWS ID of the Virtual Private Gateway if attaching one use in conjunction with attach VGW

Type: `string`

Default: `null`

### <a name="input_vgw_tags"></a> [vgw\_tags](#input\_vgw\_tags)

Description: Tags for VGW Resource

Type: `map(string)`

Default: `{}`

### <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id)

Description: Required if you are creating and attach DX & VGW

Type: `string`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_dx_connection_arn"></a> [dx\_connection\_arn](#output\_dx\_connection\_arn)

Description: The ARN of the connection

### <a name="output_dx_connection_bandwidth"></a> [dx\_connection\_bandwidth](#output\_dx\_connection\_bandwidth)

Description: Bandwidth of the connection

### <a name="output_dx_connection_id"></a> [dx\_connection\_id](#output\_dx\_connection\_id)

Description: The ID of the connection

### <a name="output_dx_connection_name"></a> [dx\_connection\_name](#output\_dx\_connection\_name)

Description: The connection name

### <a name="output_dx_gateway_id"></a> [dx\_gateway\_id](#output\_dx\_gateway\_id)

Description: The ID of the gateway

### <a name="output_dx_gateway_name"></a> [dx\_gateway\_name](#output\_dx\_gateway\_name)

Description: The name of the gateway

### <a name="output_dx_private_hosted_vif_arn"></a> [dx\_private\_hosted\_vif\_arn](#output\_dx\_private\_hosted\_vif\_arn)

Description: The ARN of the virtual interface

### <a name="output_dx_private_hosted_vif_id"></a> [dx\_private\_hosted\_vif\_id](#output\_dx\_private\_hosted\_vif\_id)

Description: The ID of the virtual interface.

### <a name="output_dx_private_vif_arn"></a> [dx\_private\_vif\_arn](#output\_dx\_private\_vif\_arn)

Description: The ARN of the public virtual interface.

### <a name="output_dx_private_vif_id"></a> [dx\_private\_vif\_id](#output\_dx\_private\_vif\_id)

Description: The ID of the public virtual interface.

### <a name="output_dx_public_vif_arn"></a> [dx\_public\_vif\_arn](#output\_dx\_public\_vif\_arn)

Description: The ARN of the public virtual interface.

### <a name="output_dx_public_vif_id"></a> [dx\_public\_vif\_id](#output\_dx\_public\_vif\_id)

Description: The ID of the public virtual interface.

### <a name="output_vgw_id"></a> [vgw\_id](#output\_vgw\_id)

Description: The ID of the VPN Gateway
<!-- END_TF_DOCS -->