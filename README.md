# AWS Direct Connect Terraform Module
Terraform module which creates [Direct Connect resources][https://docs.aws.amazon.com/directconnect/latest/UserGuide/Welcome.html] on AWS.

The following resources are supported:
- [DX Connection][https://www.terraform.io/docs/providers/aws/r/dx_connection.html]
- [DX Connection Association][https://www.terraform.io/docs/providers/aws/r/dx_connection_association.html]
- [DX Gateway][https://www.terraform.io/docs/providers/aws/r/dx_gateway.html]
- [DX Gateway Association][https://www.terraform.io/docs/providers/aws/r/dx_gateway_association.html]
- [DX Hosted Public Virtual Interface][https://www.terraform.io/docs/providers/aws/r/dx_hosted_public_virtual_interface.html]
- [DX Hosted Public Virtual Interface Accepter][https://www.terraform.io/docs/providers/aws/r/dx_hosted_public_virtual_interface_accepter.html]
- [DX Link Aggregation Group][https://www.terraform.io/docs/providers/aws/r/dx_lag.html]
- [DX Private Virtual Interface][https://www.terraform.io/docs/providers/aws/r/dx_private_virtual_interface.html]

This module aims to provide all connotations of Direct Connect setup for AWS.

##Usage
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
    Gateway    = "${dx-gw-01}"
    Enviroment = "Development"
  }
}
```

#Examples
- [Single VIF][https://github.com/BorisLabs/terraform-aws-directconnect/tree/master/examples/single_vif]
- [DX Connection][https://github.com/BorisLabs/terraform-aws-directconnect/tree/master/examples/dx_connection]
- [VIF attached to pre-existing DX Gateway][https://github.com/BorisLabs/terraform-aws-directconnect/tree/master/examples/dx_gateway_and_private_vif]
- [Complete Terragrunt for DX Conn, GW, VIF -- COMING SOON][]

##Terraform Versions
This module currently only supports Terraform v0.11.
Terraform 0.12 support is expected soon. Please follow [#3][https://github.com/BorisLabs/terraform-aws-directconnect/issues/3] for updates

##Authors
Module managed by 
[Rob Houghton][https://github.com/ALLFIVE]
[Josh Sinfield][https://github.com/JoshiiSinfield]
[Ben Arundel][https://github.com/barundel]

##Notes
1. All Outputs are lists due to conditional creations of all resources.
   Only one of each resource is currently created therefore the following use of element should suffice.
   ```${element(module.gateway_and_attached_vif.dx_private_hosted_vif_id, 0)}```  
   Please check code confirm this is still true.
   