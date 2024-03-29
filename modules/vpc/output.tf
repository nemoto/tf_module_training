output "vpc_id" {
  value       = aws_vpc.main_vpc.id
  description = "VPC_ID of created VPC."
}
