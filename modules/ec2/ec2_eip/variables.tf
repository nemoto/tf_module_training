variable "env" {
  type        = string
  description = "environment type{prd|stg|dev}. (set in ./vars.tfvar)"
}
variable "proj" {
  type        = string
  description = "project name"
}
variable "name" {
  type        = string
  description = "item_name"
}
variable "key_name" {
  type        = string
  description = "SSH public key name for created EC2."
}
variable "key_file" {
  type        = string
  description = "SSH public key filepath for created EC2."
}
variable "az" {
  type        = string
  description = "Avairable AZ zone of created EC2."
}
variable "eip_id" {
  type        = string
  description = "EIP_id for created public EC2."
}
variable "eip_public_ip" {
  type        = string
  description = "Public IP address of EIP for created public EC2."
}
variable "subnet_id" {
  type        = string
  description = "Subnet_ID this EC2 belonging to."
}
variable "sg_id" {
  type        = string
  description = "SecurityGroup_ID this EC2 attached."
}
variable "private_ip" {
  type        = string
  description = "Private IP address for created public EC2."
}
