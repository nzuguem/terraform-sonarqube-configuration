resource "sonarqube_user_token" "token_team_1" {
  login_name = sonarqube_user.users["t1.tech"].login_name
  type       = "USER_TOKEN"
  name       = "Team 1 Analysis Token"
}

resource "sonarqube_user_token" "token_team_2" {
  login_name = sonarqube_user.users["t2.tech"].login_name
  type       = "USER_TOKEN"
  name       = "Team 2 Analysis Token"
}