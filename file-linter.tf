locals {
  linter_yaml = templatefile(
    "${path.module}/files/linter.yml.tpl",
    {
      # directory = var.linter_directory
    }
  )
}

resource "github_repository_file" "linter" {
  repository          = var.repository
  branch              = "main"
  file                = ".github/workflows/linter.yml"
  content             = local.linter_yaml
  overwrite_on_create = true
}
