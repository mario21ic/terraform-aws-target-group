variable "region" {
  description = "aws region"
}

variable "count" {
  default = 1
}

variable "name" {
  description = "Target group name"
}

variable "env" {
  description = "Environment name"
}

variable "type" {
  default = ""
  description = "http or tcp"
}

variable "target_type" {
  default = "instance"
  description = "instance or specified"
}

variable "health_check" {
}

variable "port" {
  default = 0
  description = "Define a port"
}

variable "vpc_id" {
  description = "VPC Id"
}

