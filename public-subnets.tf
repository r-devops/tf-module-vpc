resource "aws_subnet" "public-subnets" {
  count      = length(var.PUBLIC_SUBNETS)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.PUBLIC_SUBNETS, count.index)
  availability_zone = element(var.AZ, count.index)

  tags = merge(
    local.tags_default,
    {
      Name = "${local.TAG_Name_PREFIX}-public-subnet"
    }
  )

}
