resource "random_password" "password" {
  for_each         = { for user in local.users : user.login => user }
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "sonarqube_user" "users" {
  for_each   = { for user in local.users : user.login => user }
  login_name = each.value.login
  name       = each.value.name
  is_local   = try(each.value.is_local, true)
  email      = each.value.email
  password   = random_password.password[each.key].result
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

resource "sonarqube_group_member" "admins" {
  for_each   = { for user in local.users_admins : user.login => user }
  name       = data.sonarqube_group.sonar_admins.name
  login_name = each.value.login
  depends_on = [sonarqube_user.users]
}

data "sonarqube_group" "sonar_users" {
  name = "sonar-users"
}

data "sonarqube_group" "sonar_admins" {
  name = "sonar-administrators"
}