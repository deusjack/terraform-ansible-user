locals {
  bug_string = <<EOT
/usr/lib/python3.11/site-packages/paramiko/pkey.py:100: CryptographyDeprecationWarning: TripleDES has been moved to cryptography.hazmat.decrepit.ciphers.algorithms.TripleDES and will be removed from this module in 48.0.0.
  "cipher": algorithms.TripleDES,
/usr/lib/python3.11/site-packages/paramiko/transport.py:259: CryptographyDeprecationWarning: TripleDES has been moved to cryptography.hazmat.decrepit.ciphers.algorithms.TripleDES and will be removed from this module in 48.0.0.
  "class": algorithms.TripleDES,
EOT

  output = one(jsondecode(replace(ansible_playbook.user.ansible_playbook_stdout, local.bug_string, "")).plays).tasks[0].hosts[var.hostname]
}

output "triggers" {
  value = {
    playbook = ansible_playbook.user.id
  }
  description = "Trigger for user changes to be used by other null_resources/modules"
}

output "hostname" {
  value       = var.hostname
  description = "The hostname of linux machine the user was created on"
}

output "name" {
  value       = var.name
  description = "Name of the user"
}

output "uid" {
  value       = local.output.uid
  description = "UID of the user"
}

output "password" {
  value       = var.password
  description = "Password-hash for the user"
}

output "primary_group" {
  value       = var.primary_group
  description = "Primary group of the user"
}

output "groups" {
  value       = var.groups
  description = "Additional groups for the user"
}

output "create_home" {
  value       = var.create_home
  description = "If the home folder should be created"
}

output "home_folder" {
  value       = local.output.home
  description = "Path of the home folder"
}

output "shell" {
  value       = var.shell
  description = "The login shell for the user. Must be set to valid value to be able to login."
}

output "comment" {
  value       = var.comment != null ? var.comment : ""
  description = "Comment for documentation"
}

output "seuser" {
  value       = var.seuser
  description = "The SELinux user for this user"
}

output "is_system_user" {
  value       = var.is_system_user
  description = "If the user is system user"
}
