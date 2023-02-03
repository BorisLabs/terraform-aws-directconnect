
terraform {
  required_version = ">= 0.13"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      configuration_aliases = [
        aws.accepter
      ]
    }
  }
}
