output "token_team_1" {
  value     = sonarqube_user_token.token_team_1.token
  sensitive = true
}

output "token_team_2" {
  value     = sonarqube_user_token.token_team_2.token
  sensitive = true
}