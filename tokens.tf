resource "sonarqube_user_token" "team_tokens" {
  for_each   = { for group in local.groups : group.name => group }
  login_name = each.value.roles.tech
  type       = "USER_TOKEN"
  name       = "${each.value.name} Analysis Token"
  depends_on = [sonarqube_user.users]
}