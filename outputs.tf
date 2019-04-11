output "dx_connection_id" {
  value = "${aws_dx_connection.this.*.id}"
}

output "dx_connection_bandwidth" {
  value = "${aws_dx_connection.this.*.bandwidth}"
}

output "dx_connection_arn" {
  value = "${aws_dx_connection.this.*.arn}"
}

output "dx_connection_name" {
  value = "${aws_dx_connection.this.*.name}"
}

output "dx_private_hosted_vif_id" {
  value = "${aws_dx_hosted_private_virtual_interface.private_vif.*.id}"
}

output "dx_private_hosted_vif_arn" {
  value = "${aws_dx_hosted_private_virtual_interface.private_vif.*.arn}"
}

output "dx_gateway_id" {
  value = "${aws_dx_gateway.this.*.id}"
}

output "dx_gateway_name" {
  value = "${aws_dx_gateway.this.*.name}"
}