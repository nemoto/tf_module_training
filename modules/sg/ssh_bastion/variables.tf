variable "sg_id" {
  type        = string
  description = "SecurityGroup_ID this EC2 attached."
}
variable "vpc_cidr" {
  type        = string
  description = "VPC_CIDR_address of VPC"
}
variable "ssh_office_cidr" {
  type        = string
  description = "CIDR of ssh allowed office network for security group rule."
}
variable "ssh_bastion_A_cidr" {
  type        = string
  description = "CIDR of ssh allowed bastion host A for security group rule."
}
variable "ssh_bastion_B_cidr" {
  type        = string
  description = "CIDR of ssh allowed bastion host B for security group rule."
}
variable "ssh_office_cidr_name" {
  type        = string
  description = "Name(Tag) of ssh allowed office network for security group rule."
}
variable "ssh_bastion_A_cidr_name" {
  type        = string
  description = "Name(Tag) of ssh allowed bastion host A for security group rule."
}
variable "ssh_bastion_B_cidr_name" {
  type        = string
  description = "Name(Tag) of ssh allowed bastion host B for security group rule."
}
