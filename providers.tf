provider "aws" {
  alias  = "source"
  region = "${var.aws_region}"
}

provider "aws" {
  alias  = "accepter"
  region = "${var.aws_region}"
}
