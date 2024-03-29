terraform {
  required_version = ">= 1.7.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.20.0"
    }
  }
}

# Create internate Gateway
resource "aws_internet_gateway" igw {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.proj}-${var.env}-${var.name}-igw"
    terraform = true
  }
}
