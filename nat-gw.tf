resource "aws_eip" "ngw" {
  vpc = true
  tags = merge(
    local.tags_default,
    {
      Name = "${local.TAG_Name_PREFIX}-ngw-eip"
    }
  )
}

resource "aws_nat_gateway" "ngw" {
  count         = var.CREATE_NAT_GW && length(var.PUBLIC_SUBNETS) > 0 ? 1 : 0
  allocation_id = aws_eip.ngw.id
  subnet_id     = element(aws_subnet.public-subnets.*.id, 0)

  tags = merge(
    local.tags_default,
    {
      Name = "${local.TAG_Name_PREFIX}-ngw"
    }
  )
}

locals {
  NAT_GATEWAY_ID = length(aws_nat_gateway.ngw) > 0 ? aws_nat_gateway.ngw.*.id[0] : null
}
