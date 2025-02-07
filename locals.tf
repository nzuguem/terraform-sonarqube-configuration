locals {
  config = yamldecode(file("${path.module}/${var.config_file}"))

  users = local.config.users
  users_admins = [
    for user in local.users : {
      login = user.login
    } if try(user.is_admin, false) == true
  ]
  groups = local.config.groups
  groups_members = flatten([
    for group in local.groups : [
      for member in group.members : {
        name        = group.name
        member      = member
        description = group.description
      }
    ]
  ])
  groups_admins = flatten([
    for group in local.groups : [
      for admin in group.roles.admins : {
        name     = group.name
        admin    = admin
        template = group.template.name
      }
    ]
  ])
}