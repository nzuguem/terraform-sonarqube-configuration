variable "sonar_token" {
  type      = string
  sensitive = true

  validation {
    condition     = length(var.sonar_token) > 0
    error_message = "Sonar token is required."
  }
}

variable "sonar_host" {
  default = "http://127.0.0.1:9000"
  type    = string
}

variable "config_file" {
  default = "config/config.yml"
  type    = string
}