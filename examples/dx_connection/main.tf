provider "aws" {
  region = "eu-west-1"
}

module "dx_connection" {
  source = "../../"

  create_dx_connection = true

  connection_bandwith = "1Gbps"
  connection_location = "EqLD5"
  connection_name     = "test-connection"

  connection_tags = {
    Name  = "My-Test-Connection"
    Type  = "Primary"
    Label = "A"
  }
}
