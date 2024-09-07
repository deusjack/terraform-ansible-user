resource "ansible_playbook" "user" {
  name                    = var.hostname
  playbook                = "${path.module}/user.yaml"
  replayable              = false
  ignore_playbook_failure = false
  extra_vars = merge(
    {
      username      = var.name
      password      = var.password
      primary_group = var.primary_group
      #groups         = jsonencode(length(var.groups) > 0 ? var.groups : [var.primary_group])
      groups         = jsonencode(var.groups)
      create_home    = tostring(var.create_home)
      shell          = var.shell
      seuser         = var.seuser
      is_system_user = var.is_system_user
    },
    var.uid != null ? { uid = var.uid } : {},
    var.home_folder != null ? { home_folder = var.home_folder } : {},
    var.comment != null ? { comment = var.comment } : {}
  )
  lifecycle {
    replace_triggered_by = [
      null_resource.user,
      null_resource.external,
      null_resource.variables
    ]
  }
}
