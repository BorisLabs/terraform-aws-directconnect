output "dx_connection_id" {
  value = aws_dx_connection.this[0].id
}

output "dx_connection_bandwidth" {
  value = aws_dx_connection.this[0].bandwidth
}

output "dx_connection_arn" {
  value = aws_dx_connection.this[0].arn
}

output "dx_connection_name" {
  value = aws_dx_connection.this[0].name
}

output "dx_private_hosted_vif_id" {
  value = aws_dx_hosted_private_virtual_interface.private_vif[0].id
}

output "dx_private_hosted_vif_arn" {
  value = aws_dx_hosted_private_virtual_interface.private_vif[0].arn
}

output "dx_gateway_id" {
  value = aws_dx_gateway.this[0].id
}

output "dx_gateway_name" {
  value = aws_dx_gateway.this[0].name
}
