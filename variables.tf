variable "external_triggers" {
  type        = map(string)
  description = "Triggers for rerunning the user playbook except variables"
  default     = {}
}

# Doesn't need a trigger. On change the playbooks is automatically replaced.
variable "hostname" {
  type        = string
  description = "The hostname of the linux machine the user will be created on"
}

variable "name" {
  type        = string
  description = "Name of the user"
}

variable "uid" {
  type        = number
  description = "UID of th user"
  default     = null
}

variable "password" {
  type        = string
  description = "Password-hash for the user. Can be created with mkpasswd --method=SHA-512 --stdin"
  default     = "!"
}

variable "primary_group" {
  type        = string
  description = "Primary group of the user"
}

variable "groups" {
  type        = list(string)
  description = "Additional groups for the user"
  default     = []
}

variable "create_home" {
  type        = bool
  description = "If the home folder should be created"
  default     = false
}

variable "home_folder" {
  type        = string
  description = "Path of the home folder"
  default     = null
}

variable "shell" {
  type        = string
  description = "The login shell for the user. Must be set to valid value, to be able to login."
  default     = "/usr/sbin/nologin"
}

variable "comment" {
  type        = string
  description = "Comment for documentation"
  default     = null
}

variable "seuser" {
  type        = string
  description = "The SELinux user for this user"
  default     = "user_u"
}

variable "is_system_user" {
  type        = bool
  description = "If the user is system user"
  default     = false
}
