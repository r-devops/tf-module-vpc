locals {
  TAG_Name_PREFIX = "${var.PROJECT_NAME}-${var.ENV}"
  tags_default = {
    ENV          = var.ENV
    PROJECT_NAME = var.PROJECT_NAME
  }
  VPC_MAIN_CIDR   = var.VPC_CIDR[0]
  ADDITIONAL_CIDR = slice(var.VPC_CIDR, 1, length(var.VPC_CIDR))
}


