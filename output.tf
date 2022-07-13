output "PRIVATE_SUBNETS_IDS" {
  value = aws_subnet.private-subnets.*.id
}

output "PUBLIC_SUBNETS_IDS" {
  value = aws_subnet.public-subnets.*.id
}
