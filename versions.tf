
terraform {
  required_version = ">= 0.14"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      configuration_aliases = [
        aws.accepter
      ]
    }
  }
}
