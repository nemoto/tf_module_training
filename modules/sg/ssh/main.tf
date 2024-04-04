terraform {
  required_version = ">= 1.7.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.20.0"
    }
  }
}

resource "aws_security_group_rule" "ingress_ssh_vpc" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.vpc_cidr] # VPC belonging to.
  security_group_id = var.sg_id
}

###

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
