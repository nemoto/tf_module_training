output "bastion_ami_id" {
  value       = module.create_EC2_bastion.ami_id
  description = "AMI_ID of created bastion host."
}
output "bastion_ami_description" {
  value       = module.create_EC2_bastion.ami_description
  description = "AMI_Description of created bastion host."
}
output "bastion_ami_name" {
  value       = module.create_EC2_bastion.ami_name
  description = "AMI_Name of created bastion host."
}
output "bastion_public_ip" {
  value       = module.create_EC2_bastion.public_ip
  description = "IP address of created bastion host (Public IP)."
}
output "bastion_private_ip" {
  value       = module.create_EC2_bastion.private_ip
  description = "IP address of created bastion host (private IP)."
}
output "batch_ami_id" {
  value       = module.create_EC2_batch.ami_id
  description = "AMI_ID of created batch host."
}
output "batch_ami_description" {
  value       = module.create_EC2_batch.ami_description
  description = "AMI_Description of created batch host."
}
output "batch_ami_name" {
  value       = module.create_EC2_batch.ami_name
  description = "AMI_Name of created batch host."
}
output "batch_private_ip" {
  value       = module.create_EC2_batch.private_ip
  description = "IP address of created batch host (private IP)."
}
