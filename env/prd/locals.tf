### Environment specified.
variable "aws_XX_prd_access_key" {
  type        = string
  description = "access_key: nemoto@ XX production (set in ENVIRONMENT vars)"
  sensitive   = true
}
variable "aws_XX_prd_secret_key" {
  type        = string
  description = "secret_key: nemoto@ XX production (set in ENVIRONMENT vars)"
  sensitive   = true
}
variable "aws_XX_prd_role_arn" {
  type        = string
  description = "role_arn: nemoto@ XX production (set in ENVIRONMENT vars)"
  sensitive   = true
}
variable "aws_XX_prd_region" {
  type        = string
  description = "region: nemoto@ XX production (set in ENVIRONMENT vars)"
  sensitive   = true
}

variable "aws_XX_prd_key_name_bastion" {
  type        = string
  description = "ssh key pair name for bastion host"
  sensitive   = true
}
variable "aws_XX_prd_public_key_file_bastion" {
  type        = string
  description = "public key file for bastion host"
  sensitive   = true
}

variable "aws_XX_prd_key_name_batch" {
  type        = string
  description = "ssh key pair name for batch host"
  sensitive   = true
}
variable "aws_XX_prd_public_key_file_batch" {
  type        = string
  description = "public key file for batch host"
  sensitive   = true
}


locals {
  # connection auth
  access_key              = var.aws_XX_prd_access_key
  secret_key              = var.aws_XX_prd_secret_key
  region                  = var.aws_XX_prd_region
  role_arn                = var.aws_XX_prd_role_arn
  env                     = "prd"
  key_name_bastion        = var.aws_XX_prd_key_name_bastion
  public_key_file_bastion = var.aws_XX_prd_public_key_file_bastion
  key_name_batch          = var.aws_XX_prd_key_name_batch
  public_key_file_batch   = var.aws_XX_prd_public_key_file_batch
}
