variable "az_region" {
  description = "region to use for AWS resources"
  type        = string
  default     = "us-east-1a"
}

variable "cidr" {
  description = "CIDR range for created VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "private_cidr" {
  description = "CIDR range for created VPC"
  type        = string
  default     = "10.10.1.0/24"
}

