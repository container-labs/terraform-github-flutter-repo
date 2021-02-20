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
  default = ""
  type    = string
}

variable "workspace_image_digest" {
  default = ""
  type    = string
}
