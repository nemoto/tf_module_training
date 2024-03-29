output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
  description = "Subnet_ID of created subnet(public)."
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
  description = "Subnet_ID of created subnet(private)."
}
