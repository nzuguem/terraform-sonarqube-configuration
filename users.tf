resource "sonarqube_user" "users" {
  for_each   = { for user in local.users : user.login => user }
  login_name = each.value.login
  name       = each.value.name
  is_local   = each.value.is_local
  email      = each.value.email
  password   = each.value.password
}

resource "sonarqube_group" "groups" {
  for_each    = { for group in local.groups : group.name => group }
  name        = each.value.name
  description = each.value.description
}

resource "sonarqube_group_member" "members" {
  for_each   = { for group in local.groups_members : "${group.name}/${group.member}" => group }
  name       = each.value.name
  login_name = each.value.member
  depends_on = [sonarqube_user.users, sonarqube_group.groups]
}

data "sonarqube_group" "sonar_users" {
  name = "sonar-users"
}