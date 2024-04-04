### Environment specified.
variable "aws_XX_dev_access_key" {
  type        = string
  description = "access_key: nemoto@ XX production (set in ENVIRONMENT vars)"
  sensitive   = true
}
variable "aws_XX_dev_secret_key" {
  type        = string
  description = "secret_key: nemoto@ XX production (set in ENVIRONMENT vars)"
  sensitive   = true
}
variable "aws_XX_dev_role_arn" {
  type        = string
  description = "role_arn: nemoto@ XX production (set in ENVIRONMENT vars)"
  sensitive   = true
}
variable "aws_XX_dev_region" {
  type        = string
  description = "region: nemoto@ XX production (set in ENVIRONMENT vars)"
  sensitive   = true
}
variable "aws_XX_dev_bastion_key_name" {
  type        = string
  description = "bastion host ssh publc_key: nemoto@ XX production (set in ENVIRONMENT vars)"
  sensitive   = true
}
variable "aws_XX_dev_batch_key_name" {
  type        = string
  description = "batch host ssh publc_key: nemoto@ XX production (set in ENVIRONMENT vars)"
  sensitive   = true
}

locals {
  # connection auth
  access_key       = var.aws_XX_dev_access_key
  secret_key       = var.aws_XX_dev_secret_key
  region           = var.aws_XX_dev_region
  role_arn         = var.aws_XX_dev_role_arn
  env              = "dev"
  key_name_bastion = var.aws_XX_dev_bastion_key_name
  key_name_batch   = var.aws_XX_dev_batch_key_name
}
