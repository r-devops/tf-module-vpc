resource "aws_internet_gateway" "igw" {
  count  = var.CREATE_INTERNET_GW && length(var.PUBLIC_SUBNETS) > 0 ? 1 : 0
  vpc_id = aws_vpc.main.id

  tags = merge(
    local.tags_default,
    {
      Name = "${local.TAG_Name_PREFIX}-igw"
    }
  )
}

locals {
  INTERNET_GATEWAY_ID = length(aws_internet_gateway.igw) > 0 ? aws_internet_gateway.igw.*.id[0] : null
}
