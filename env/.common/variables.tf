####################
# Local variables
####################
locals {
  proj     = "SampleProject"
  vpc_cidr = "10.0.0.0/16"
}

####################
# Provider
####################
#variable "proj" {
#  type        = string
#  description = "project name"
#}
#variable "
#  type        = string
#  description = "VPC CIDR"
#}
#variable "subnet_public_A_cidr" {
#  type        = string
#  description = "public subnet CIDR"
#}
#variable "subnet_private_A_cidr" {
#  type        = string
#  description = "private subnet CIDR"
#}
#variable "subnet_public_C_cidr" {
#  type        = string
#  description = "public subnet CIDR"
#}
#variable "subnet_private_C_cidr" {
#  type        = string
#  description = "private subnet CIDR"
#}
variable "ssh_office_cidr" {
  type        = string
  description = "CIDR of of ssh allowed office network for security group rule."
  sensitive = true
}
variable "ssh_bastion_A_cidr" {
  type        = string
  description = "CIDR of ssh allowed bastion host A for security group rule."
  sensitive = true
}
variable "ssh_bastion_B_cidr" {
  type        = string
  description = "CIDR of ssh allowed bastion host B for security group rule."
  sensitive = true
}
variable "ssh_office_cidr_name" {
  type        = string
  description = "Name(Tag) of ssh allowed office network for security group rule."
  sensitive = true
}
variable "ssh_bastion_A_cidr_name" {
  type        = string
  description = "Name(Tag) of ssh allowed bastion host A for security group rule."
  sensitive = true
}
variable "ssh_bastion_B_cidr_name" {
  type        = string
  description = "Name(Tag) of ssh allowed bastion host B for security group rule."
  sensitive = true
}
