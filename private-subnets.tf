resource "aws_subnet" "private-subnets" {
  count      = length(var.PRIVATE_SUBNETS)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.PRIVATE_SUBNETS, count.index)
  availability_zone = element(var.AZ, count.index)

  tags = merge(
    local.tags_default,
    {
      Name = "${local.TAG_Name_PREFIX}-private-subnet"
    }
  )

}
