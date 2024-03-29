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
| [aws_nat_gateway.NAT_private_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route.route_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.route_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.route_table_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.route_table_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.route_association_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.route_association_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.private_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az"></a> [az](#input\_az) | Avairable AZ zone of created EC2. | `string` | n/a | yes |
| <a name="input_eip_id"></a> [eip\_id](#input\_eip\_id) | EIP for NAT | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | environment type{prd\|stg\|dev}. (set in ./vars.tfvar) | `string` | n/a | yes |
| <a name="input_igw_id"></a> [igw\_id](#input\_igw\_id) | InternetGateway\_ID of subnet this EC2 belonging to. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | item\_name | `string` | n/a | yes |
| <a name="input_proj"></a> [proj](#input\_proj) | project name | `string` | n/a | yes |
| <a name="input_subnet_az"></a> [subnet\_az](#input\_subnet\_az) | subnet AZ | `string` | n/a | yes |
| <a name="input_subnet_private_cidr_for_private"></a> [subnet\_private\_cidr\_for\_private](#input\_subnet\_private\_cidr\_for\_private) | private subnet CIDR for private subnet | `string` | n/a | yes |
| <a name="input_subnet_private_cidr_for_public"></a> [subnet\_private\_cidr\_for\_public](#input\_subnet\_private\_cidr\_for\_public) | private subnet CIDR for public subnet | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC\_ID of created VPC. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_id"></a> [private\_subnet\_id](#output\_private\_subnet\_id) | Subnet\_ID of created subnet(private). |
| <a name="output_public_subnet_id"></a> [public\_subnet\_id](#output\_public\_subnet\_id) | Subnet\_ID of created subnet(public). |
