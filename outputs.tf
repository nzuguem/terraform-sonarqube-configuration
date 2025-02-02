output "team_tokens" {
  value     = { for group_name, user_token in sonarqube_user_token.team_tokens : group_name => user_token.token }
  sensitive = true
}

output "user_passwords" {
  value     = { for login, user in sonarqube_user.users : login => user.password }
  sensitive = true
}