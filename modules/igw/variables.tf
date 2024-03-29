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
