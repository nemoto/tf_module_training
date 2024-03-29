# Terraform Module sample

## Course Description
### Target person
- Must have IAM/role with network/EC2 related permissions in AWS.
- Must have a level of knowledge to create VPC, Subnet, Gateway, EC2, etc. in AWS console.
- Must know basic usage of Terraform.

### Course Objectives
- Know how to use Module, Output, etc.
- Learn one of the ways to build a system with the same configuration for each environment.
- Develop a habit of writing highly readable and maintainable code using peripheral tools such as tflint, terraform-docs, etc.

### Required environment
- terraform
    - terraform itself
        - required_version = ">= 1.7.0"
        - Note: use asdf for version management.
    - terraform provider plugins
        - aws
            - source  = "hashicorp/aws"
            - version = ">= 5.20.0"
    ```shell
    $ terraform providers -version
    Terraform v1.7.5
    on darwin_arm64
    + provider registry.terraform.io/hashicorp/aws v5.40.0
    ```
- tflint
    - terraform files linter
- terraform-docs
    - module documenter.
        - useded in doc.py (module documenter sample)
- python
    - required_version = ">= 3.11"
    - Note: use asdf for version management. (or pyenv)
- poetry :
    - A tool for dependency management and packaging in Python.
    - required_version = ">= 1.8"
- asdf
    - The Multiple Runtime Version Manager. In this case, used for terraform, python.
        ```shell
        $ asdf current
        python          3.11.8          /{somewhere}/.tool-versions
        terraform       1.7.5           /{somewhere}/.tool-versions

        ````

## Souce Description

### Target System
<img width="612" alt="target_system" src="https://github.com/nemoto/tf_module_training/assets/204263/a20e072e-3924-4ae9-98eb-d6fc4aeb3bbb">

### Usage
1. move to env/{prd|dev}
2. terraform init
    - first time only.
3. terraform {plan|apply...}
    ```shell
    $ cd env/prd
    env/prd$ terraform plan
       :
    Plan: 62 to add, 0 to change, 0 to destroy.
       :

    ```

### Description
- The external information required for each environment design is described as aws_env_sample. At runtime, this file is executed with the source command, and the configuration values are read into the environment variables.
- Overall design to build a nearly identical system in production and development environments
    - In env/.common, main.tf for system configuration, variables.tf for general variable configuration, and output.tf for output configuration.
    - In env/{prd|dev|, locals.tf is placed to describe environment-dependent information, and main.tf/variables.tf/output.tf are symbolic links from .common, so that the configuration contents for each environment are common.
    - For execution, move to env/{prd|dev} and execute various Terrafrom commands.

- Using Module for common processing contents and improved readability
    - Each module is divided by directory.
    - ec2 module
        - The ec2 module is divided into "./modules/ec2/ec2_eip" which creates a public EC2 with a public IP, and "./modules/ec2/ec2_private" which creates an EC2 with only a private IP, and can be used separately in env/*/main.tf.
        - Naturally, it is also possible to design a module that completes EIP generation, etc. within the ec2 module without making it a separate module, and this should be considered according to the overall design policy.
        - The two modules are placed as subdirectories, but the parent directory is placed to group the two modules for simplicity in understanding the overall module structure.
    - eip module / igw module
        - Modules for building Elastic IP and Internet Gateway. These modules are created as "bad examples" that perform only one RESOURCE process.
    - sg module
        - A module that builds SecurityGroup and a child module that creates rules and ties them to the built Security Group (". /modules/sg/ssh", ". /modules/sg/ssh_bastion").
        - Hierarchical modules should be avoided because of the complexity. However, in this case, the child modules are purely dependent only on the parent module, and are set up this way for the convenience of setting rules.
        - This module consists of two rule settings: one to allow only the specified ports from the network in the VPC, and another to allow this via the stepping-stone server.
    - subnet module
        - This sample is an example of a poorly named example. This module creates two subnets together, one public and one private, but its behavior cannot be assumed from the module name.
    - vpc module
        - The VPC module is configured for the sole purpose of creating a VPC.
        - This module is cut out as a first exercise in splitting a terraform file which is described in a single main.tf into modules. In this sample code, it may be better to write directly in ". /env/{prd|dev|}/main.tf".

## Notes on the actual project
- This time, we created a simple module to learn how Module works (including variables/locals), but if there is no particular reason, you should use a module published in the Terraform Registry (https://registry.terraform.io/ ).

## Other tools
### tflint
- Be sure to run the linter through every time you create or modify a Terraform file. If a modification is noted, please make a habit of applying it and checking the behavior before committing.
    ```shell
    $ tflint --recursive  (at root directory of this repogitory)
    1 issue(s) found:

    Warning: Missing version constraint for provider "aws" in `required_providers` (terraform_required_providers)

      on env/dev/main.tf line 1:
       1: provider "aws" {

    Reference: https://github.com/terraform-linters/tflint-ruleset-terraform/blob/v0.5.0/docs/rules/terraform_required_providers.md
    ```

### doc.py : Module documents creater.
- Create Module interface document as README.md for each modules.
- Preparation
    1. setup python 3.11 or higher.
        - user asdf (or pyenv)
    2. setup poetry environment
        ```shell
        $ poetry install --no-root
        Creating virtualenv tf-training-module-sample in /{somewhere}/tf_module_training/.venv
        Updating dependencies
        Resolving dependencies... (0.1s)

        Package operations: 1 install, 0 updates, 0 removals

          - Installing ruff (0.3.4)

        Writing lock file

        ```
- Usage (to create module docs)
    - Use following command for every change of modules.
        ```shell
        $ poetry run python doc.py  (at root directory of this repogitory)
        Create: /{somewhere}/tf_module_training/modules/igw/README.md
          :
        Create: /{somewhere}/tf_module_training/modules/ec2/ec2_private/README.md

        ```

### role.py : AWS role action extructor.
- AWS role action extructor for tf_module_sample(Terraform sample).

- Preparation
    1. setup pike
       - use Homebrew (see. [Official Site](https://github.com/JamesWoolfenden/pike?tab=readme-ov-file#macos))
    2. setup python
       - see. Above section

- Usage : Add shown actions to AWS policy.
    ```shell
    $ poetry run python role.py dev
    "ec2:AttachInternetGateway",
       :
    "ec2:RevokeSecurityGroupIngress",

    ```