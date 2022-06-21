variable "VPC_CIDR" {
  default = "10.0.0.0/16"
}

variable "PRIVATE_SUBNETS" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "PUBLIC_SUBNETS" {
  default = ["10.1.1.0/24", "10.1.2.0/24"]
}
