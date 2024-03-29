terraform {
  required_version = ">= 1.7.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.20.0"
    }
  }
}

resource "aws_security_group" sg {
  vpc_id = var.vpc_id
  name   = "${var.proj}-${var.env}-${var.name}-sg"
  tags = {
    Name = "${var.proj}-${var.env}-${var.name}-sg"
    terraform = true
  }
}

resource "aws_security_group_rule" egress_allow_all {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg.id
}

resource "aws_ec2_tag" tag_outbound {
  resource_id = aws_security_group_rule.egress_allow_all.security_group_rule_id
  key         = "Name"
  value       = "Outbound All"
}
resource "aws_ec2_tag" tag_terraform {
  resource_id = aws_security_group_rule.egress_allow_all.security_group_rule_id
  key         = "terraform"
  value       = true
}
