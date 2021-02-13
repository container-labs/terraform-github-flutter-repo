locals {
  dockerfile = templatefile(
    "${path.module}/files/Dockerfile.tpl",
    {
      #   directory            = var.dependabot_directory
    }
  )
}

resource "github_repository_file" "dockerfile" {
  #   count      = var.dependabot_enabled ? 1 : 0
  repository = var.repository
  branch     = "main"
  file       = ".devcontainer/Dockerfile"
  content    = dockerfile
}