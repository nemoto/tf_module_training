terraform {
  required_version = ">= 1.7.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.20.0"
    }
  }
}

resource "aws_security_group_rule" "ingress_ssh_office" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.ssh_office_cidr]
  security_group_id = var.sg_id
}

resource "aws_security_group_rule" "ingress_ssh_bastion_A" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.ssh_bastion_A_cidr]
  security_group_id = var.sg_id
}

resource "aws_security_group_rule" "ingress_ssh_bastion_B" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.ssh_bastion_B_cidr]
  security_group_id = var.sg_id
}

resource "aws_security_group_rule" "ingress_ssh_vpc" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.vpc_cidr] # VPC belonging to.
  security_group_id = var.sg_id
}

####

resource "aws_ec2_tag" "tag_office" {
  resource_id = aws_security_group_rule.ingress_ssh_office.security_group_rule_id
  key         = "Name"
  value       = var.ssh_office_cidr_name
}
resource "aws_ec2_tag" "tag_bastions_terraform" {
  resource_id = aws_security_group_rule.ingress_ssh_office.security_group_rule_id
  key         = "terraform"
  value       = true
}
resource "aws_ec2_tag" "tag_bastion_A" {
  resource_id = aws_security_group_rule.ingress_ssh_bastion_A.security_group_rule_id
  key         = "Name"
  value       = var.ssh_bastion_A_cidr_name
}
resource "aws_ec2_tag" "tag_bastion_A_terraform" {
  resource_id = aws_security_group_rule.ingress_ssh_bastion_A.security_group_rule_id
  key         = "terraform"
  value       = true
}
resource "aws_ec2_tag" "tag_bastion_B" {
  resource_id = aws_security_group_rule.ingress_ssh_bastion_B.security_group_rule_id
  key         = "Name"
  value       = var.ssh_bastion_B_cidr_name
}
resource "aws_ec2_tag" "tag_bastion_B_terraform" {
  resource_id = aws_security_group_rule.ingress_ssh_bastion_B.security_group_rule_id
  key         = "terraform"
  value       = true
}

resource "aws_ec2_tag" "tag_vpc" {
  resource_id = aws_security_group_rule.ingress_ssh_vpc.security_group_rule_id
  key         = "Name"
  value       = "SSH(VPC cidr)"
}
resource "aws_ec2_tag" "tag_vpc_terraform" {
  resource_id = aws_security_group_rule.ingress_ssh_vpc.security_group_rule_id
  key         = "terraform"
  value       = true
}
