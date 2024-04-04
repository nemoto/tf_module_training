terraform {
  required_version = ">= 1.7.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.20.0"
    }
  }
}

data "aws_ami" "azlinux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-*"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["arm64"]
  }
  filter {
    name   = "block-device-mapping.volume-type"
    values = ["gp2"]
  }
}

## simple version
# resource "aws_instance" "main" {
#   ami           = data.aws_ami.azlinux.id
#   instance_type = "t2.micro"
# }
#

resource "aws_key_pair" "pub_key" {
  key_name   = var.key_name
  public_key = file(var.key_file)
}

resource "aws_network_interface" "EC2_NIC" {
  subnet_id       = var.subnet_id
  private_ips     = [var.private_ip]
  security_groups = [var.sg_id]

  tags = {
    Name = "${var.proj}-${var.env}-${var.name}-EC2_NIC_${var.az}"
  }
}


resource "aws_instance" "EC2" {
  ami           = data.aws_ami.azlinux.id
  instance_type = "t4g.nano"
  key_name      = aws_key_pair.pub_key.key_name
  network_interface {
    network_interface_id = aws_network_interface.EC2_NIC.id
    device_index         = 0
  }
  lifecycle {
    ignore_changes = [ami]
  }
  metadata_options {
    http_tokens = "required"
  }

  tags = {
    Name      = "${var.proj}-${var.env}-${var.name}-EC2_${var.az}"
    terraform = true
  }
}

### Taks afrer creation
#  user_data = <<EOF
# #! /bin/bash
# sudo yum install -y httpd
# sudo systemctl start httpd
# sudo systemctl enable httpd
# EOF
# }
#
