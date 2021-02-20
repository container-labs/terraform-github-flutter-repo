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

variable "workspace_image_tag" {
  defualt = ""
  type    = string
}

variable "workspacce_image_digest" {
  default = ""
  type    = string
}
