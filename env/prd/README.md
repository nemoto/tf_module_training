### 53 to add, 0 to change, 0 to destroy, 0 to replace.
- add
    - module.create_EC2_bastion.aws_eip_association.eip-association
    - module.create_EC2_bastion.aws_instance.EC2
    - module.create_EC2_bastion.aws_key_pair.pub_key
    - module.create_EC2_bastion.aws_network_interface.EC2_NIC
    - module.create_EC2_batch.aws_instance.EC2
    - module.create_EC2_batch.aws_key_pair.pub_key
    - module.create_EC2_batch.aws_network_interface.EC2_NIC
    - module.create_EIP_for_EC2_bastion.aws_eip.EIP
    - module.create_EIP_for_NAT_A.aws_eip.EIP
    - module.create_EIP_for_NAT_C.aws_eip.EIP
    - module.create_IGW.aws_internet_gateway.igw
    - module.create_SG_bastion_server.aws_ec2_tag.tag_outbound
    - module.create_SG_bastion_server.aws_ec2_tag.tag_terraform
    - module.create_SG_bastion_server.aws_security_group.sg
    - module.create_SG_bastion_server.aws_security_group_rule.egress_allow_all
    - module.create_SG_batch_server.aws_ec2_tag.tag_outbound
    - module.create_SG_batch_server.aws_ec2_tag.tag_terraform
    - module.create_SG_batch_server.aws_security_group.sg
    - module.create_SG_batch_server.aws_security_group_rule.egress_allow_all
    - module.create_SG_rules_ssh_for_bastion.aws_ec2_tag.tag_bastion_A
    - module.create_SG_rules_ssh_for_bastion.aws_ec2_tag.tag_bastion_A_terraform
    - module.create_SG_rules_ssh_for_bastion.aws_ec2_tag.tag_bastion_B
    - module.create_SG_rules_ssh_for_bastion.aws_ec2_tag.tag_bastion_B_terraform
    - module.create_SG_rules_ssh_for_bastion.aws_ec2_tag.tag_bastions_terraform
    - module.create_SG_rules_ssh_for_bastion.aws_ec2_tag.tag_office
    - module.create_SG_rules_ssh_for_bastion.aws_ec2_tag.tag_vpc
    - module.create_SG_rules_ssh_for_bastion.aws_ec2_tag.tag_vpc_terraform
    - module.create_SG_rules_ssh_for_bastion.aws_security_group_rule.ingress_ssh_bastion_A
    - module.create_SG_rules_ssh_for_bastion.aws_security_group_rule.ingress_ssh_bastion_B
    - module.create_SG_rules_ssh_for_bastion.aws_security_group_rule.ingress_ssh_office
    - module.create_SG_rules_ssh_for_bastion.aws_security_group_rule.ingress_ssh_vpc
    - module.create_SG_rules_ssh_for_batch.aws_ec2_tag.tag_vpc
    - module.create_SG_rules_ssh_for_batch.aws_ec2_tag.tag_vpc_terraform
    - module.create_SG_rules_ssh_for_batch.aws_security_group_rule.ingress_ssh_vpc
    - module.create_VPC.aws_vpc.main_vpc
    - module.create_subnet_A.aws_nat_gateway.NAT_private_subnet
    - module.create_subnet_A.aws_route.route_private
    - module.create_subnet_A.aws_route.route_public
    - module.create_subnet_A.aws_route_table.route_table_private
    - module.create_subnet_A.aws_route_table.route_table_public
    - module.create_subnet_A.aws_route_table_association.route_association_private
    - module.create_subnet_A.aws_route_table_association.route_association_public
    - module.create_subnet_A.aws_subnet.private_subnet
    - module.create_subnet_A.aws_subnet.public_subnet
    - module.create_subnet_C.aws_nat_gateway.NAT_private_subnet
    - module.create_subnet_C.aws_route.route_private
    - module.create_subnet_C.aws_route.route_public
    - module.create_subnet_C.aws_route_table.route_table_private
    - module.create_subnet_C.aws_route_table.route_table_public
    - module.create_subnet_C.aws_route_table_association.route_association_private
    - module.create_subnet_C.aws_route_table_association.route_association_public
    - module.create_subnet_C.aws_subnet.private_subnet
    - module.create_subnet_C.aws_subnet.public_subnet
<details><summary>Change details</summary>

````````diff
# module.create_EC2_bastion.aws_eip_association.eip-association will be created
@@ -1,2 +1,4 @@
-null
+{
+  "allow_reassociation": null
+}
 
````````

````````diff
# module.create_EC2_bastion.aws_instance.EC2 will be created
@@ -1,2 +1,36 @@
-null
+{
+  "ami": "ami-09dd85e01def514cc",
+  "credit_specification": [],
+  "get_password_data": false,
+  "hibernation": null,
+  "instance_type": "t4g.nano",
+  "key_name": "REDACTED_SENSITIVE",
+  "launch_template": [],
+  "metadata_options": [
+    {
+      "http_endpoint": "enabled",
+      "http_protocol_ipv6": "disabled",
+      "http_tokens": "required"
+    }
+  ],
+  "network_interface": [
+    {
+      "delete_on_termination": false,
+      "device_index": 0,
+      "network_card_index": 0
+    }
+  ],
+  "source_dest_check": null,
+  "tags": {
+    "Name": "sample-prd-bastion-EC2_A",
+    "terraform": "true"
+  },
+  "tags_all": {
+    "Name": "sample-prd-bastion-EC2_A",
+    "terraform": "true"
+  },
+  "timeouts": null,
+  "user_data_replace_on_change": false,
+  "volume_tags": null
+}
 
````````

````````diff
# module.create_EC2_bastion.aws_key_pair.pub_key will be created
@@ -1,2 +1,6 @@
-null
+{
+  "key_name": "REDACTED_SENSITIVE",
+  "public_key": "REDACTED_SENSITIVE",
+  "tags": null
+}
 
````````q

````````diff
# module.create_EC2_bastion.aws_network_interface.EC2_NIC will be created
@@ -1,2 +1,16 @@
-null
+{
+  "description": null,
+  "ipv6_address_list_enabled": false,
+  "private_ip_list_enabled": false,
+  "private_ips": [
+    "10.0.0.10"
+  ],
+  "source_dest_check": true,
+  "tags": {
+    "Name": "sample-prd-bastion-EC2_NIC_A"
+  },
+  "tags_all": {
+    "Name": "sample-prd-bastion-EC2_NIC_A"
+  }
+}
 
````````

````````diff
# module.create_EC2_batch.aws_instance.EC2 will be created
@@ -1,2 +1,35 @@
-null
+{
+  "ami": "ami-09dd85e01def514cc",
+  "credit_specification": [],
+  "get_password_data": false,
+  "hibernation": null,
+  "instance_type": "t4g.nano",
+  "launch_template": [],
+  "metadata_options": [
+    {
+      "http_endpoint": "enabled",
+      "http_protocol_ipv6": "disabled",
+      "http_tokens": "required"
+    }
+  ],
+  "network_interface": [
+    {
+      "delete_on_termination": false,
+      "device_index": 0,
+      "network_card_index": 0
+    }
+  ],
+  "source_dest_check": null,
+  "tags": {
+    "Name": "sample-prd-batch-EC2_A",
+    "terraform": "true"
+  },
+  "tags_all": {
+    "Name": "sample-prd-batch-EC2_A",
+    "terraform": "true"
+  },
+  "timeouts": null,
+  "user_data_replace_on_change": false,
+  "volume_tags": null
+}
 
````````

````````diff
# module.create_EC2_batch.aws_key_pair.pub_key will be created
@@ -1,2 +1,6 @@
-null
+{
+  "key_name": "REDACTED_SENSITIVE",
+  "public_key": "REDACTED_SENSITIVE",
+  "tags": null
+}
 
````````

````````diff
# module.create_EC2_batch.aws_network_interface.EC2_NIC will be created
@@ -1,2 +1,16 @@
-null
+{
+  "description": null,
+  "ipv6_address_list_enabled": false,
+  "private_ip_list_enabled": false,
+  "private_ips": [
+    "10.0.1.10"
+  ],
+  "source_dest_check": true,
+  "tags": {
+    "Name": "sample-prd-batch-EC2_NIC_A"
+  },
+  "tags_all": {
+    "Name": "sample-prd-batch-EC2_NIC_A"
+  }
+}
 
````````

````````diff
# module.create_EIP_for_EC2_bastion.aws_eip.EIP will be created
@@ -1,2 +1,16 @@
-null
+{
+  "address": null,
+  "associate_with_private_ip": null,
+  "customer_owned_ipv4_pool": null,
+  "domain": "vpc",
+  "tags": {
+    "Name": "sample-prd-bation_EIP-EIP",
+    "terraform": "true"
+  },
+  "tags_all": {
+    "Name": "sample-prd-bation_EIP-EIP",
+    "terraform": "true"
+  },
+  "timeouts": null
+}
 
````````

````````diff
# module.create_EIP_for_NAT_A.aws_eip.EIP will be created
@@ -1,2 +1,16 @@
-null
+{
+  "address": null,
+  "associate_with_private_ip": null,
+  "customer_owned_ipv4_pool": null,
+  "domain": "vpc",
+  "tags": {
+    "Name": "sample-prd-test_subnet_A_NAT-EIP",
+    "terraform": "true"
+  },
+  "tags_all": {
+    "Name": "sample-prd-test_subnet_A_NAT-EIP",
+    "terraform": "true"
+  },
+  "timeouts": null
+}
 
````````

````````diff
# module.create_EIP_for_NAT_C.aws_eip.EIP will be created
@@ -1,2 +1,16 @@
-null
+{
+  "address": null,
+  "associate_with_private_ip": null,
+  "customer_owned_ipv4_pool": null,
+  "domain": "vpc",
+  "tags": {
+    "Name": "sample-prd-test_subnet_NAT-EIP",
+    "terraform": "true"
+  },
+  "tags_all": {
+    "Name": "sample-prd-test_subnet_NAT-EIP",
+    "terraform": "true"
+  },
+  "timeouts": null
+}
 
````````

````````diff
# module.create_IGW.aws_internet_gateway.igw will be created
@@ -1,2 +1,12 @@
-null
+{
+  "tags": {
+    "Name": "sample-prd-test-igw",
+    "terraform": "true"
+  },
+  "tags_all": {
+    "Name": "sample-prd-test-igw",
+    "terraform": "true"
+  },
+  "timeouts": null
+}
 
````````

````````diff
# module.create_SG_bastion_server.aws_ec2_tag.tag_outbound will be created
@@ -1,2 +1,5 @@
-null
+{
+  "key": "Name",
+  "value": "Outbound All"
+}
 
````````

````````diff
# module.create_SG_bastion_server.aws_ec2_tag.tag_terraform will be created
@@ -1,2 +1,5 @@
-null
+{
+  "key": "terraform",
+  "value": "true"
+}
 
````````

````````diff
# module.create_SG_bastion_server.aws_security_group.sg will be created
@@ -1,2 +1,15 @@
-null
+{
+  "description": "Managed by Terraform",
+  "name": "sample-prd-bastion-sg",
+  "revoke_rules_on_delete": false,
+  "tags": {
+    "Name": "sample-prd-bastion-sg",
+    "terraform": "true"
+  },
+  "tags_all": {
+    "Name": "sample-prd-bastion-sg",
+    "terraform": "true"
+  },
+  "timeouts": null
+}
 
````````

````````diff
# module.create_SG_bastion_server.aws_security_group_rule.egress_allow_all will be created
@@ -1,2 +1,15 @@
-null
+{
+  "cidr_blocks": [
+    "0.0.0.0/0"
+  ],
+  "description": null,
+  "from_port": 0,
+  "ipv6_cidr_blocks": null,
+  "prefix_list_ids": null,
+  "protocol": "-1",
+  "self": false,
+  "timeouts": null,
+  "to_port": 0,
+  "type": "egress"
+}
 
````````

````````diff
# module.create_SG_batch_server.aws_ec2_tag.tag_outbound will be created
@@ -1,2 +1,5 @@
-null
+{
+  "key": "Name",
+  "value": "Outbound All"
+}
 
````````

````````diff
# module.create_SG_batch_server.aws_ec2_tag.tag_terraform will be created
@@ -1,2 +1,5 @@
-null
+{
+  "key": "terraform",
+  "value": "true"
+}
 
````````

````````diff
# module.create_SG_batch_server.aws_security_group.sg will be created
@@ -1,2 +1,15 @@
-null
+{
+  "description": "Managed by Terraform",
+  "name": "sample-prd-batch-sg",
+  "revoke_rules_on_delete": false,
+  "tags": {
+    "Name": "sample-prd-batch-sg",
+    "terraform": "true"
+  },
+  "tags_all": {
+    "Name": "sample-prd-batch-sg",
+    "terraform": "true"
+  },
+  "timeouts": null
+}
 
````````

````````diff
# module.create_SG_batch_server.aws_security_group_rule.egress_allow_all will be created
@@ -1,2 +1,15 @@
-null
+{
+  "cidr_blocks": [
+    "0.0.0.0/0"
+  ],
+  "description": null,
+  "from_port": 0,
+  "ipv6_cidr_blocks": null,
+  "prefix_list_ids": null,
+  "protocol": "-1",
+  "self": false,
+  "timeouts": null,
+  "to_port": 0,
+  "type": "egress"
+}
 
````````

````````diff
# module.create_SG_rules_ssh_for_bastion.aws_ec2_tag.tag_bastion_A will be created
@@ -1,2 +1,5 @@
-null
+{
+  "key": "Name",
+  "value": "REDACTED_SENSITIVE"
+}
 
````````

````````diff
# module.create_SG_rules_ssh_for_bastion.aws_ec2_tag.tag_bastion_A_terraform will be created
@@ -1,2 +1,5 @@
-null
+{
+  "key": "terraform",
+  "value": "true"
+}
 
````````

````````diff
# module.create_SG_rules_ssh_for_bastion.aws_ec2_tag.tag_bastion_B will be created
@@ -1,2 +1,5 @@
-null
+{
+  "key": "Name",
+  "value": "REDACTED_SENSITIVE"
+}
 
````````

````````diff
# module.create_SG_rules_ssh_for_bastion.aws_ec2_tag.tag_bastion_B_terraform will be created
@@ -1,2 +1,5 @@
-null
+{
+  "key": "terraform",
+  "value": "true"
+}
 
````````

````````diff
# module.create_SG_rules_ssh_for_bastion.aws_ec2_tag.tag_bastions_terraform will be created
@@ -1,2 +1,5 @@
-null
+{
+  "key": "terraform",
+  "value": "true"
+}
 
````````

````````diff
# module.create_SG_rules_ssh_for_bastion.aws_ec2_tag.tag_office will be created
@@ -1,2 +1,5 @@
-null
+{
+  "key": "Name",
+  "value": "REDACTED_SENSITIVE"
+}
 
````````

````````diff
# module.create_SG_rules_ssh_for_bastion.aws_ec2_tag.tag_vpc will be created
@@ -1,2 +1,5 @@
-null
+{
+  "key": "Name",
+  "value": "SSH(VPC cidr)"
+}
 
````````

````````diff
# module.create_SG_rules_ssh_for_bastion.aws_ec2_tag.tag_vpc_terraform will be created
@@ -1,2 +1,5 @@
-null
+{
+  "key": "terraform",
+  "value": "true"
+}
 
````````

````````diff
# module.create_SG_rules_ssh_for_bastion.aws_security_group_rule.ingress_ssh_bastion_A will be created
@@ -1,2 +1,15 @@
-null
+{
+  "cidr_blocks": [
+    "REDACTED_SENSITIVE"
+  ],
+  "description": null,
+  "from_port": 22,
+  "ipv6_cidr_blocks": null,
+  "prefix_list_ids": null,
+  "protocol": "tcp",
+  "self": false,
+  "timeouts": null,
+  "to_port": 22,
+  "type": "ingress"
+}
 
````````

````````diff
# module.create_SG_rules_ssh_for_bastion.aws_security_group_rule.ingress_ssh_bastion_B will be created
@@ -1,2 +1,15 @@
-null
+{
+  "cidr_blocks": [
+    "REDACTED_SENSITIVE"
+  ],
+  "description": null,
+  "from_port": 22,
+  "ipv6_cidr_blocks": null,
+  "prefix_list_ids": null,
+  "protocol": "tcp",
+  "self": false,
+  "timeouts": null,
+  "to_port": 22,
+  "type": "ingress"
+}
 
````````

````````diff
# module.create_SG_rules_ssh_for_bastion.aws_security_group_rule.ingress_ssh_office will be created
@@ -1,2 +1,15 @@
-null
+{
+  "cidr_blocks": [
+    "REDACTED_SENSITIVE"
+  ],
+  "description": null,
+  "from_port": 22,
+  "ipv6_cidr_blocks": null,
+  "prefix_list_ids": null,
+  "protocol": "tcp",
+  "self": false,
+  "timeouts": null,
+  "to_port": 22,
+  "type": "ingress"
+}
 
````````

````````diff
# module.create_SG_rules_ssh_for_bastion.aws_security_group_rule.ingress_ssh_vpc will be created
@@ -1,2 +1,15 @@
-null
+{
+  "cidr_blocks": [
+    "10.0.0.0/16"
+  ],
+  "description": null,
+  "from_port": 22,
+  "ipv6_cidr_blocks": null,
+  "prefix_list_ids": null,
+  "protocol": "tcp",
+  "self": false,
+  "timeouts": null,
+  "to_port": 22,
+  "type": "ingress"
+}
 
````````

````````diff
# module.create_SG_rules_ssh_for_batch.aws_ec2_tag.tag_vpc will be created
@@ -1,2 +1,5 @@
-null
+{
+  "key": "Name",
+  "value": "SSH(VPC cidr)"
+}
 
````````

````````diff
# module.create_SG_rules_ssh_for_batch.aws_ec2_tag.tag_vpc_terraform will be created
@@ -1,2 +1,5 @@
-null
+{
+  "key": "terraform",
+  "value": "true"
+}
 
````````

````````diff
# module.create_SG_rules_ssh_for_batch.aws_security_group_rule.ingress_ssh_vpc will be created
@@ -1,2 +1,15 @@
-null
+{
+  "cidr_blocks": [
+    "10.0.0.0/16"
+  ],
+  "description": null,
+  "from_port": 22,
+  "ipv6_cidr_blocks": null,
+  "prefix_list_ids": null,
+  "protocol": "tcp",
+  "self": false,
+  "timeouts": null,
+  "to_port": 22,
+  "type": "ingress"
+}
 
````````

````````diff
# module.create_VPC.aws_vpc.main_vpc will be created
@@ -1,2 +1,20 @@
-null
+{
+  "assign_generated_ipv6_cidr_block": null,
+  "cidr_block": "10.0.0.0/16",
+  "enable_dns_hostnames": true,
+  "enable_dns_support": true,
+  "instance_tenancy": "default",
+  "ipv4_ipam_pool_id": null,
+  "ipv4_netmask_length": null,
+  "ipv6_ipam_pool_id": null,
+  "ipv6_netmask_length": null,
+  "tags": {
+    "Name": "sample-prd-test-vpc",
+    "terraform": "true"
+  },
+  "tags_all": {
+    "Name": "sample-prd-test-vpc",
+    "terraform": "true"
+  }
+}
 
````````

````````diff
# module.create_subnet_A.aws_nat_gateway.NAT_private_subnet will be created
@@ -1,2 +1,14 @@
-null
+{
+  "connectivity_type": "public",
+  "secondary_allocation_ids": null,
+  "tags": {
+    "Name": "sample-prd-test-NAT_private_subnet_A",
+    "terraform": "true"
+  },
+  "tags_all": {
+    "Name": "sample-prd-test-NAT_private_subnet_A",
+    "terraform": "true"
+  },
+  "timeouts": null
+}
 
````````

````````diff
# module.create_subnet_A.aws_route.route_private will be created
@@ -1,2 +1,15 @@
-null
+{
+  "carrier_gateway_id": null,
+  "core_network_arn": null,
+  "destination_cidr_block": "0.0.0.0/0",
+  "destination_ipv6_cidr_block": null,
+  "destination_prefix_list_id": null,
+  "egress_only_gateway_id": null,
+  "gateway_id": null,
+  "local_gateway_id": null,
+  "timeouts": null,
+  "transit_gateway_id": null,
+  "vpc_endpoint_id": null,
+  "vpc_peering_connection_id": null
+}
 
````````

````````diff
# module.create_subnet_A.aws_route.route_public will be created
@@ -1,2 +1,15 @@
-null
+{
+  "carrier_gateway_id": null,
+  "core_network_arn": null,
+  "destination_cidr_block": "0.0.0.0/0",
+  "destination_ipv6_cidr_block": null,
+  "destination_prefix_list_id": null,
+  "egress_only_gateway_id": null,
+  "local_gateway_id": null,
+  "nat_gateway_id": null,
+  "timeouts": null,
+  "transit_gateway_id": null,
+  "vpc_endpoint_id": null,
+  "vpc_peering_connection_id": null
+}
 
````````

````````diff
# module.create_subnet_A.aws_route_table.route_table_private will be created
@@ -1,2 +1,12 @@
-null
+{
+  "tags": {
+    "Name": "sample-prd-test-route_table_private_A",
+    "terraform": "true"
+  },
+  "tags_all": {
+    "Name": "sample-prd-test-route_table_private_A",
+    "terraform": "true"
+  },
+  "timeouts": null
+}
 
````````

````````diff
# module.create_subnet_A.aws_route_table.route_table_public will be created
@@ -1,2 +1,12 @@
-null
+{
+  "tags": {
+    "Name": "sample-prd-test-route_table_public_A",
+    "terraform": "true"
+  },
+  "tags_all": {
+    "Name": "sample-prd-test-route_table_public_A",
+    "terraform": "true"
+  },
+  "timeouts": null
+}
 
````````

````````diff
# module.create_subnet_A.aws_route_table_association.route_association_private will be created
@@ -1,2 +1,5 @@
-null
+{
+  "gateway_id": null,
+  "timeouts": null
+}
 
````````

````````diff
# module.create_subnet_A.aws_route_table_association.route_association_public will be created
@@ -1,2 +1,5 @@
-null
+{
+  "gateway_id": null,
+  "timeouts": null
+}
 
````````

````````diff
# module.create_subnet_A.aws_subnet.private_subnet will be created
@@ -1,2 +1,25 @@
-null
+{
+  "assign_ipv6_address_on_creation": false,
+  "availability_zone": "ap-northeast-1a",
+  "cidr_block": "10.0.1.0/24",
+  "customer_owned_ipv4_pool": null,
+  "enable_dns64": false,
+  "enable_lni_at_device_index": null,
+  "enable_resource_name_dns_a_record_on_launch": false,
+  "enable_resource_name_dns_aaaa_record_on_launch": false,
+  "ipv6_cidr_block": null,
+  "ipv6_native": false,
+  "map_customer_owned_ip_on_launch": null,
+  "map_public_ip_on_launch": false,
+  "outpost_arn": null,
+  "tags": {
+    "Name": "sample-prd-test-private_subnet_A",
+    "terraform": "true"
+  },
+  "tags_all": {
+    "Name": "sample-prd-test-private_subnet_A",
+    "terraform": "true"
+  },
+  "timeouts": null
+}
 
````````

````````diff
# module.create_subnet_A.aws_subnet.public_subnet will be created
@@ -1,2 +1,25 @@
-null
+{
+  "assign_ipv6_address_on_creation": false,
+  "availability_zone": "ap-northeast-1a",
+  "cidr_block": "10.0.0.0/24",
+  "customer_owned_ipv4_pool": null,
+  "enable_dns64": false,
+  "enable_lni_at_device_index": null,
+  "enable_resource_name_dns_a_record_on_launch": false,
+  "enable_resource_name_dns_aaaa_record_on_launch": false,
+  "ipv6_cidr_block": null,
+  "ipv6_native": false,
+  "map_customer_owned_ip_on_launch": null,
+  "map_public_ip_on_launch": false,
+  "outpost_arn": null,
+  "tags": {
+    "Name": "sample-prd-test-public_subnet_A",
+    "terraform": "true"
+  },
+  "tags_all": {
+    "Name": "sample-prd-test-public_subnet_A",
+    "terraform": "true"
+  },
+  "timeouts": null
+}
 
````````

````````diff
# module.create_subnet_C.aws_nat_gateway.NAT_private_subnet will be created
@@ -1,2 +1,14 @@
-null
+{
+  "connectivity_type": "public",
+  "secondary_allocation_ids": null,
+  "tags": {
+    "Name": "sample-prd-test-NAT_private_subnet_C",
+    "terraform": "true"
+  },
+  "tags_all": {
+    "Name": "sample-prd-test-NAT_private_subnet_C",
+    "terraform": "true"
+  },
+  "timeouts": null
+}
 
````````

````````diff
# module.create_subnet_C.aws_route.route_private will be created
@@ -1,2 +1,15 @@
-null
+{
+  "carrier_gateway_id": null,
+  "core_network_arn": null,
+  "destination_cidr_block": "0.0.0.0/0",
+  "destination_ipv6_cidr_block": null,
+  "destination_prefix_list_id": null,
+  "egress_only_gateway_id": null,
+  "gateway_id": null,
+  "local_gateway_id": null,
+  "timeouts": null,
+  "transit_gateway_id": null,
+  "vpc_endpoint_id": null,
+  "vpc_peering_connection_id": null
+}
 
````````

````````diff
# module.create_subnet_C.aws_route.route_public will be created
@@ -1,2 +1,15 @@
-null
+{
+  "carrier_gateway_id": null,
+  "core_network_arn": null,
+  "destination_cidr_block": "0.0.0.0/0",
+  "destination_ipv6_cidr_block": null,
+  "destination_prefix_list_id": null,
+  "egress_only_gateway_id": null,
+  "local_gateway_id": null,
+  "nat_gateway_id": null,
+  "timeouts": null,
+  "transit_gateway_id": null,
+  "vpc_endpoint_id": null,
+  "vpc_peering_connection_id": null
+}
 
````````

````````diff
# module.create_subnet_C.aws_route_table.route_table_private will be created
@@ -1,2 +1,12 @@
-null
+{
+  "tags": {
+    "Name": "sample-prd-test-route_table_private_C",
+    "terraform": "true"
+  },
+  "tags_all": {
+    "Name": "sample-prd-test-route_table_private_C",
+    "terraform": "true"
+  },
+  "timeouts": null
+}
 
````````

````````diff
# module.create_subnet_C.aws_route_table.route_table_public will be created
@@ -1,2 +1,12 @@
-null
+{
+  "tags": {
+    "Name": "sample-prd-test-route_table_public_C",
+    "terraform": "true"
+  },
+  "tags_all": {
+    "Name": "sample-prd-test-route_table_public_C",
+    "terraform": "true"
+  },
+  "timeouts": null
+}
 
````````

````````diff
# module.create_subnet_C.aws_route_table_association.route_association_private will be created
@@ -1,2 +1,5 @@
-null
+{
+  "gateway_id": null,
+  "timeouts": null
+}
 
````````

````````diff
# module.create_subnet_C.aws_route_table_association.route_association_public will be created
@@ -1,2 +1,5 @@
-null
+{
+  "gateway_id": null,
+  "timeouts": null
+}
 
````````

````````diff
# module.create_subnet_C.aws_subnet.private_subnet will be created
@@ -1,2 +1,25 @@
-null
+{
+  "assign_ipv6_address_on_creation": false,
+  "availability_zone": "ap-northeast-1c",
+  "cidr_block": "10.0.3.0/24",
+  "customer_owned_ipv4_pool": null,
+  "enable_dns64": false,
+  "enable_lni_at_device_index": null,
+  "enable_resource_name_dns_a_record_on_launch": false,
+  "enable_resource_name_dns_aaaa_record_on_launch": false,
+  "ipv6_cidr_block": null,
+  "ipv6_native": false,
+  "map_customer_owned_ip_on_launch": null,
+  "map_public_ip_on_launch": false,
+  "outpost_arn": null,
+  "tags": {
+    "Name": "sample-prd-test-private_subnet_C",
+    "terraform": "true"
+  },
+  "tags_all": {
+    "Name": "sample-prd-test-private_subnet_C",
+    "terraform": "true"
+  },
+  "timeouts": null
+}
 
````````

````````diff
# module.create_subnet_C.aws_subnet.public_subnet will be created
@@ -1,2 +1,25 @@
-null
+{
+  "assign_ipv6_address_on_creation": false,
+  "availability_zone": "ap-northeast-1c",
+  "cidr_block": "10.0.2.0/24",
+  "customer_owned_ipv4_pool": null,
+  "enable_dns64": false,
+  "enable_lni_at_device_index": null,
+  "enable_resource_name_dns_a_record_on_launch": false,
+  "enable_resource_name_dns_aaaa_record_on_launch": false,
+  "ipv6_cidr_block": null,
+  "ipv6_native": false,
+  "map_customer_owned_ip_on_launch": null,
+  "map_public_ip_on_launch": false,
+  "outpost_arn": null,
+  "tags": {
+    "Name": "sample-prd-test-public_subnet_C",
+    "terraform": "true"
+  },
+  "tags_all": {
+    "Name": "sample-prd-test-public_subnet_C",
+    "terraform": "true"
+  },
+  "timeouts": null
+}
 
````````

</details>
