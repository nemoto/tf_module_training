output "eip_id" {
  value       = aws_eip.EIP.id
  description = "Created EIP ID"
}
output "eip_public_ip" {
  value       = aws_eip.EIP.public_ip
  description = "Public IP the EIP have."
}
