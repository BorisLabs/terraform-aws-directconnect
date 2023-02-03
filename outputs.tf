output "dx_connection_id" {
  value       = concat(aws_dx_connection.this.*.id, [""])[0]
  description = "The ID of the connection"
}

output "dx_connection_bandwidth" {
  value       = concat(aws_dx_connection.this.*.bandwidth, [""])[0]
  description = "Bandwidth of the connection"
}

output "dx_connection_arn" {
  value       = concat(aws_dx_connection.this.*.arn, [""])[0]
  description = "The ARN of the connection"
}

output "dx_connection_name" {
  value       = concat(aws_dx_connection.this.*.name, [""])[0]
  description = "The connection name"
}

output "dx_private_hosted_vif_id" {
  value       = concat(aws_dx_hosted_private_virtual_interface.private_vif.*.id, [""])[0]
  description = "The ID of the virtual interface."
}

output "dx_private_hosted_vif_arn" {
  value       = concat(aws_dx_hosted_private_virtual_interface.private_vif.*.arn, [""])[0]
  description = "The ARN of the virtual interface"
}

output "dx_public_vif_arn" {
  value       = concat(aws_dx_public_virtual_interface.this.*.arn, [""])[0]
  description = "The ARN of the public virtual interface."
}

output "dx_public_vif_id" {
  value       = concat(aws_dx_public_virtual_interface.this.*.id, [""])[0]
  description = "The ID of the public virtual interface."
}

output "dx_private_vif_arn" {
  value       = concat(aws_dx_public_virtual_interface.this.*.arn, [""])[0]
  description = "The ARN of the public virtual interface."
}

output "dx_private_vif_id" {
  value       = concat(aws_dx_public_virtual_interface.this.*.id, [""])[0]
  description = "The ID of the public virtual interface."
}

output "dx_gateway_id" {
  value       = concat(aws_dx_gateway.this.*.id, [""])[0]
  description = "The ID of the gateway"
}

output "dx_gateway_name" {
  value       = concat(aws_dx_gateway.this.*.name, [""])[0]
  description = "The name of the gateway"
}

output "vgw_id" {
  value       = concat(aws_vpn_gateway.this.*.id, [""])[0]
  description = "The ID of the VPN Gateway"
}


