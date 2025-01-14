locals {
  users  = yamldecode(file("${path.module}/${var.config_file}"))["users"]
  groups = yamldecode(file("${path.module}/${var.config_file}"))["groups"]
  groups_members = flatten([
    for group in local.groups : [
      for member in group.members : {
        name        = group.name
        member      = member
        description = group.description
      }
    ]
  ])
}