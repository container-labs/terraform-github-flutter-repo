locals {
  bot_yaml = templatefile(
    "${path.module}/files/dependabot.yml.tpl",
    {
      directory = var.dependabot_directory
    }
  )
}

resource "github_repository_file" "dependabot" {
  count               = var.dependabot_enabled ? 1 : 0
  repository          = var.repository
  branch              = "main"
  file                = ".github/dependabot.yml"
  content             = local.bot_yaml
  overwrite_on_create = true
}