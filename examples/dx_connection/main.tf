provider "aws" {
  region = "eu-west-1"
}

module "dx_connection" {
  source = "../../"

  create_dx_connection = true

  dx_connection_bandwith = "1Gbps"
  dx_connection_location = "EqLD5"
  dx_connection_name     = "test-connection"
  dx_connection_provider = "Colt"

  dx_connection_tags = {
    Name  = "My-Test-Connection"
    Type  = "Primary"
    Label = "A"
  }

  providers = {
    aws.accepter = aws
  }
}
