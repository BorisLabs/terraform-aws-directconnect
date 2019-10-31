data "aws_dx_gateway" "this" {
  count = var.lookup_gateway ? 1 : 0
  name  = var.dx_gateway_name
}

data "aws_caller_identity" "this" {}