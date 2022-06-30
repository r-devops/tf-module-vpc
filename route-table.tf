resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    local.tags_default,
    {
      Name = "${local.TAG_Name_PREFIX}-public-rt"
    }
  )
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    local.tags_default,
    {
      Name = "${local.TAG_Name_PREFIX}-private-rt"
    }
  )
}

resource "aws_route_table_association" "private-rt-assoc" {
  count          = length(aws_subnet.private-subnets.*.id)
  subnet_id      = element(aws_subnet.private-subnets.*.id, count.index)
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "public-rt-assoc" {
  count          = length(aws_subnet.public-subnets.*.id)
  subnet_id      = element(aws_subnet.public-subnets.*.id, count.index)
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route" "internet-gateway-route-to-public-subnets" {
  count                  = var.CREATE_INTERNET_GW ? 1 : 0
  route_table_id         = aws_route_table.public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = local.INTERNET_GATEWAY_ID
}

resource "aws_route" "nat-gateway-route-to-private-subnets" {
  count                  = var.CREATE_NAT_GW ? 1 : 0
  route_table_id         = aws_route_table.private-rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = local.NAT_GATEWAY_ID
}
