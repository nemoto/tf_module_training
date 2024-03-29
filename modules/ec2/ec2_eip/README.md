## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip_association.eip-association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip_association) | resource |
| [aws_instance.EC2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.pub_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_network_interface.EC2_NIC](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface) | resource |
| [aws_ami.azlinux](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az"></a> [az](#input\_az) | Avairable AZ zone of created EC2. | `string` | n/a | yes |
| <a name="input_eip_id"></a> [eip\_id](#input\_eip\_id) | EIP\_id for created public EC2. | `string` | n/a | yes |
| <a name="input_eip_public_ip"></a> [eip\_public\_ip](#input\_eip\_public\_ip) | Public IP address of EIP for created public EC2. | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | environment type{prd\|stg\|dev}. (set in ./vars.tfvar) | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | SSH public key filepath for created EC2. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | item\_name | `string` | n/a | yes |
| <a name="input_private_ip"></a> [private\_ip](#input\_private\_ip) | Private IP address for created public EC2. | `string` | n/a | yes |
| <a name="input_proj"></a> [proj](#input\_proj) | project name | `string` | n/a | yes |
| <a name="input_sg_id"></a> [sg\_id](#input\_sg\_id) | SecurityGroup\_ID this EC2 attached. | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet\_ID this EC2 belonging to. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ami_description"></a> [ami\_description](#output\_ami\_description) | AMI\_Description of created EC2. |
| <a name="output_ami_id"></a> [ami\_id](#output\_ami\_id) | AMI\_ID of created EC2. |
| <a name="output_ami_name"></a> [ami\_name](#output\_ami\_name) | AMI\_Name of created EC2. |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | Private IP address for created public EC2. |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | Public\_address of created EC2. |
