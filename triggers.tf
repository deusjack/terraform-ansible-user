#################
# ansible files #
#################

resource "null_resource" "user" {
  triggers = {
    user = filemd5("${path.module}/user.yaml")
  }
}

#####################
# external triggers #
#####################

resource "null_resource" "external" {
  triggers = var.external_triggers
}

#############
# variables #
#############

resource "null_resource" "variables" {
  triggers = {
    name           = var.name
    uid            = var.uid != null ? tostring(var.uid) : ""
    password       = var.password
    primary_group  = var.primary_group
    groups         = join(", ", var.groups)
    create_home    = var.create_home
    home_folder    = var.home_folder != null ? var.home_folder : ""
    shell          = var.shell
    comment        = var.comment
    seuser         = var.seuser
    is_system_user = tostring(var.is_system_user)
  }
}
