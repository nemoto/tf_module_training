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
variable "vpc_id" {
  type        = string
  description = "VPC_ID of created VPC."
}
variable "eip_id" {
  type        = string
  description = "EIP for NAT"
}
variable "subnet_private_cidr_for_public" {
  type        = string
  description = "private subnet CIDR for public subnet"
}
variable "subnet_private_cidr_for_private" {
  type        = string
  description = "private subnet CIDR for private subnet"
}
variable "subnet_az" {
  type        = string
  description = "subnet AZ"
}
variable "az" {
  type        = string
  description = "Avairable AZ zone of created EC2."
}
variable "igw_id" {
  type        = string
  description = "InternetGateway_ID of subnet this EC2 belonging to."
}
