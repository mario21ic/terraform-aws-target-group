terraform {
  required_version = ">= 0.10.0"
}

provider "aws" {
  region  = "${var.region}"
  version = ">= 1.0.0"
}

provider "template" {}

module "http" {
  source = "../../"

  region = "us-west-2"
  env = "draft"
  name = "http"
  count = 2
  type = "http"
  port = 80
  target_type = "instance"
  health_check = "/v1/health"

  vpc_id = "vpc-cd09f5b5"
}

module "tcp" {
  source = "../../"

  region = "us-west-2"
  env = "draft"
  name = "tcp"
  count = 2

  type = "tcp"
  port = 9000
  target_type = "instance"

  vpc_id = "vpc-cd09f5b5"
}
