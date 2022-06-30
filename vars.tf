variable "VPC_CIDR" {
  default = ["10.0.0.0/16"]
}

variable "PRIVATE_SUBNETS" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "PUBLIC_SUBNETS" {
  default = ["10.0.100.0/24", "10.0.101.0/24"]
}

variable "PROJECT_NAME" {
  default = "test"
}

variable "ENV" {
  default = "test"
}

variable "ENABLE_DNS_HOSTNAMES" {
  default = true
}

variable "ENABLE_DNS_SUPPORT" {
  default = true
}

variable "CREATE_INTERNET_GW" {
  default = false
}

variable "CREATE_NAT_GW" {
  default = false
}
