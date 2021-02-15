variable "repository" {
  type = string
}

variable "dependabot_enabled" {
  type    = bool
  default = true
}
variable "dependabot_directory" {
  type    = string
  default = "."
}
