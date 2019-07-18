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
  default     = ""
  description = "http or tcp"
}

variable "target_type" {
  default     = "instance"
  description = "instance or specified"
}

variable "health_check_path" {
  type = "string"
  default = ""
  description = "path health check, example: /v1/health"
}
variable "health_check_healthy_threshold" {}
variable "health_check_unhealthy_threshold" {}
variable "health_check_interval" {}
variable "health_check_timeout" {
  default = 5
}
variable "health_check_matcher" {
  default = "200"
}

variable "port" {
  default     = 0
  description = "Define a port"
}

variable "vpc_id" {
  description = "VPC Id"
}
