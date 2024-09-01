# module
Terraform module to create a user on Linux with Ansible

> [!Warning]
> * This module doesn't have resources with a traditional state.
> * Make sure to set var.external_triggers for any changes that require an update other than variables.
> * This module doesn't delete the changes on the target system on destroy.

# Terraform Docs

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8 |
| <a name="requirement_ansible"></a> [ansible](#requirement\_ansible) | >= 1, < 2 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3, < 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ansible"></a> [ansible](#provider\_ansible) | 1.3.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ansible_playbook.user](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook) | resource |
| [null_resource.external](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.user](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.variables](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_comment"></a> [comment](#input\_comment) | Comment for documentation | `string` | `null` | no |
| <a name="input_create_home"></a> [create\_home](#input\_create\_home) | If the home folder should be created | `bool` | `false` | no |
| <a name="input_external_triggers"></a> [external\_triggers](#input\_external\_triggers) | Triggers for rerunning the user playbook except variables | `map(string)` | `{}` | no |
| <a name="input_groups"></a> [groups](#input\_groups) | Additional groups for the user | `list(string)` | `[]` | no |
| <a name="input_home_folder"></a> [home\_folder](#input\_home\_folder) | Path of the home folder | `string` | `null` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | The hostname of the linux machine the user will be created on | `string` | n/a | yes |
| <a name="input_is_system_user"></a> [is\_system\_user](#input\_is\_system\_user) | If the user is system user | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the user | `string` | n/a | yes |
| <a name="input_password"></a> [password](#input\_password) | Password-hash for the user. Can be created with mkpasswd --method=SHA-512 --stdin | `string` | `"!"` | no |
| <a name="input_primary_group"></a> [primary\_group](#input\_primary\_group) | Primary group of the user | `string` | n/a | yes |
| <a name="input_seuser"></a> [seuser](#input\_seuser) | The SELinux user for this user | `string` | `"user_u"` | no |
| <a name="input_shell"></a> [shell](#input\_shell) | The login shell for the user. Must be set to valid value, to be able to login. | `string` | `"/usr/sbin/nologin"` | no |
| <a name="input_uid"></a> [uid](#input\_uid) | UID of th user | `number` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_comment"></a> [comment](#output\_comment) | Comment for documentation |
| <a name="output_create_home"></a> [create\_home](#output\_create\_home) | If the home folder should be created |
| <a name="output_groups"></a> [groups](#output\_groups) | Additional groups for the user |
| <a name="output_home_folder"></a> [home\_folder](#output\_home\_folder) | Path of the home folder |
| <a name="output_hostname"></a> [hostname](#output\_hostname) | The hostname of linux machine the user was created on |
| <a name="output_is_system_user"></a> [is\_system\_user](#output\_is\_system\_user) | If the user is system user |
| <a name="output_name"></a> [name](#output\_name) | Name of the user |
| <a name="output_password"></a> [password](#output\_password) | Password-hash for the user |
| <a name="output_primary_group"></a> [primary\_group](#output\_primary\_group) | Primary group of the user |
| <a name="output_seuser"></a> [seuser](#output\_seuser) | The SELinux user for this user |
| <a name="output_shell"></a> [shell](#output\_shell) | The login shell for the user. Must be set to valid value to be able to login. |
| <a name="output_triggers"></a> [triggers](#output\_triggers) | Trigger for user changes to be used by other null\_resources/modules |
| <a name="output_uid"></a> [uid](#output\_uid) | UID of the user |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
