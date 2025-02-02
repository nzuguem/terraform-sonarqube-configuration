resource "sonarqube_permissions" "sonar_users" {
  group_name    = data.sonarqube_group.sonar_users.name
  template_name = "Default template"
  permissions   = ["codeviewer"]
}

resource "null_resource" "remove_default_permissions_sonars_users" {
  provisioner "local-exec" {
    command = <<-EOT
      curl -X POST -u "${var.sonar_token}:" \
        ${var.sonar_host}/api/permissions/remove_group \
        -d "permission=scan&groupName=${data.sonarqube_group.sonar_users.name}"
      
      curl -X POST -u "${var.sonar_token}:" \
        ${var.sonar_host}/api/permissions/remove_group \
        -d "permission=provisioning&groupName=${data.sonarqube_group.sonar_users.name}"
    EOT
  }
}

resource "sonarqube_permission_template" "team_templates" {
  for_each            = { for group in local.groups : group.template.name => group }
  name                = each.value.template.name
  description         = each.value.template.description
  project_key_pattern = each.value.template.project_key_pattern
}

resource "sonarqube_permissions" "team_tech_user_permissions" {
  for_each      = { for group in local.groups : group.name => group }
  login_name    = each.value.roles.tech
  template_name = each.value.template.name
  permissions   = ["scan"]
  depends_on    = [sonarqube_user.users, sonarqube_permission_template.team_templates]
}

resource "sonarqube_permissions" "team_tech_user_global_permissions" {
  for_each    = { for group in local.groups : group.name => group }
  login_name  = each.value.roles.tech
  permissions = ["provisioning"]
  depends_on  = [sonarqube_user.users]
}

resource "sonarqube_permissions" "team_admin_user_permissions" {
  for_each      = { for group in local.groups_admins : "${group.name}/${group.admin}" => group }
  login_name    = each.value.admin
  template_name = each.value.template
  permissions   = ["admin"]
  depends_on    = [sonarqube_user.users, sonarqube_permission_template.team_templates]
}

resource "sonarqube_permissions" "team_group_permission" {
  for_each      = { for group in local.groups : group.name => group }
  group_name    = each.value.name
  template_name = each.value.template.name
  permissions   = ["codeviewer", "user"]
  depends_on    = [sonarqube_group.groups, sonarqube_permission_template.team_templates]
}



