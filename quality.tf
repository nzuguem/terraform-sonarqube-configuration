resource "sonarqube_qualityprofile" "nzuguem_way_profile" {
  name       = "Nzuguem way"
  language   = "java"
  is_default = true
  parent     = "Sonar way"
}