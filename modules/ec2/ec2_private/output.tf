output "ami_id" {
  value       = data.aws_ami.azlinux.id
  description = "AMI_ID of created EC2."
}
output "ami_description" {
  value       = data.aws_ami.azlinux.description
  description = "AMI_Description of created EC2."
}
output "ami_name" {
  value       = data.aws_ami.azlinux.name
  description = "AMI_Name of created EC2."
}
output "private_ip" {
  value       = var.private_ip
  description = "Private IP address for created public EC2."
}
