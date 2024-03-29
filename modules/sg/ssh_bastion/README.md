## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.20.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ec2_tag.tag_bastion_A](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_tag) | resource |
| [aws_ec2_tag.tag_bastion_A_terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_tag) | resource |
| [aws_ec2_tag.tag_bastion_B](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_tag) | resource |
| [aws_ec2_tag.tag_bastion_B_terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_tag) | resource |
| [aws_ec2_tag.tag_bastions_terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_tag) | resource |
| [aws_ec2_tag.tag_office](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_tag) | resource |
| [aws_ec2_tag.tag_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_tag) | resource |
| [aws_ec2_tag.tag_vpc_terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_tag) | resource |
| [aws_security_group_rule.ingress_ssh_bastion_A](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress_ssh_bastion_B](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress_ssh_office](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress_ssh_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_sg_id"></a> [sg\_id](#input\_sg\_id) | SecurityGroup\_ID this EC2 attached. | `string` | n/a | yes |
| <a name="input_ssh_bastion_A_cidr"></a> [ssh\_bastion\_A\_cidr](#input\_ssh\_bastion\_A\_cidr) | CIDR of ssh allowed bastion host A for security group rule. | `string` | n/a | yes |
| <a name="input_ssh_bastion_A_cidr_name"></a> [ssh\_bastion\_A\_cidr\_name](#input\_ssh\_bastion\_A\_cidr\_name) | Name(Tag) of ssh allowed bastion host A for security group rule. | `string` | n/a | yes |
| <a name="input_ssh_bastion_B_cidr"></a> [ssh\_bastion\_B\_cidr](#input\_ssh\_bastion\_B\_cidr) | CIDR of ssh allowed bastion host B for security group rule. | `string` | n/a | yes |
| <a name="input_ssh_bastion_B_cidr_name"></a> [ssh\_bastion\_B\_cidr\_name](#input\_ssh\_bastion\_B\_cidr\_name) | Name(Tag) of ssh allowed bastion host B for security group rule. | `string` | n/a | yes |
| <a name="input_ssh_office_cidr"></a> [ssh\_office\_cidr](#input\_ssh\_office\_cidr) | CIDR of ssh allowed office network for security group rule. | `string` | n/a | yes |
| <a name="input_ssh_office_cidr_name"></a> [ssh\_office\_cidr\_name](#input\_ssh\_office\_cidr\_name) | Name(Tag) of ssh allowed office network for security group rule. | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | VPC\_CIDR\_address of VPC | `string` | n/a | yes |

## Outputs

No outputs.
