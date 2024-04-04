terraform {
  required_version = ">= 1.7.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.20.0"
    }
  }
}

terraform {
  required_version = ">= 1.7"
}

# create EIP for private subnet
resource "aws_eip" "EIP" {
  domain = "vpc"
  tags = {
    Name      = "${var.proj}-${var.env}-${var.name}-EIP"
    terraform = true
  }
}
