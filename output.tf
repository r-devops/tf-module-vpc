output "PRIVATE_SUBNET_IDS" {
  value = aws_subnet.private-subnets.*.id
}

output "PUBLIC_SUBNET_IDS" {
  value = aws_subnet.public-subnets.*.id
}
