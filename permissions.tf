resource "sonarqube_permissions" "sonar_users" {
  group_name    = data.sonarqube_group.sonar_users.name
  template_name = "Default template"
  permissions   = ["codeviewer"]
}

#resource "sonarqube_permissions" "sonar_users_global" {
#  group_name    = data.sonarqube_group.sonar_users.name
#  permissions   = [null]
#}

##################### Team 1 #####################
resource "sonarqube_permission_template" "team_1_template" {
  name                = "Team 1 Projects"
  description         = "Team 1 Projects"
  project_key_pattern = "me.nzuguem.team-1.*"
}

resource "sonarqube_permissions" "team_1_tech" {
  login_name    = sonarqube_user.users["t1.tech"].login_name
  template_name = sonarqube_permission_template.team_1_template.name
  permissions   = ["scan"]
}

resource "sonarqube_permissions" "team_1_tech_global" {
  login_name  = sonarqube_user.users["t1.tech"].login_name
  permissions = ["provisioning"]
}

resource "sonarqube_permissions" "admin_team_1_key" {
  login_name    = sonarqube_user.users["k.nzuguem"].login_name
  template_name = sonarqube_permission_template.team_1_template.name
  permissions   = ["admin"]
}

resource "sonarqube_permissions" "group_team_1_key" {
  group_name    = sonarqube_group.groups["team-1"].name
  template_name = sonarqube_permission_template.team_1_template.name
  permissions   = ["codeviewer", "user"]
}

##################### Team 2 #####################
resource "sonarqube_permission_template" "team_2_template" {
  name                = "Team 2 Projects"
  description         = "Team 2 Projects"
  project_key_pattern = "me.nzuguem.team-2.*"
}

resource "sonarqube_permissions" "team_2_tech" {
  login_name    = sonarqube_user.users["t2.tech"].login_name
  template_name = sonarqube_permission_template.team_2_template.name
  permissions   = ["scan"]
}

resource "sonarqube_permissions" "team_2_tech_global" {
  login_name  = sonarqube_user.users["t2.tech"].login_name
  permissions = ["provisioning"]
}

resource "sonarqube_permissions" "admin_team_2_key" {
  login_name    = sonarqube_user.users["k.nzuguem"].login_name
  template_name = sonarqube_permission_template.team_2_template.name
  permissions   = ["admin"]
}

resource "sonarqube_permissions" "group_team_2_key" {
  group_name    = sonarqube_group.groups["team-2"].name
  template_name = sonarqube_permission_template.team_2_template.name
  permissions   = ["codeviewer", "user"]
}



