resource "aws_vpc" "main" {
  cidr_block           = var.VPC_CIDR[0]
  instance_tenancy     = "default"
  enable_dns_hostnames = var.ENABLE_DNS_HOSTNAMES
  enable_dns_support   = var.ENABLE_DNS_SUPPORT

  tags = merge(
    local.tags_default,
    {
      Name = "${local.TAG_Name_PREFIX}-vpc"
    }
  )
}

resource "aws_vpc_ipv4_cidr_block_association" "additional_cidr" {
  count      = length(local.ADDITIONAL_CIDR)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(local.ADDITIONAL_CIDR, count.index)
}
