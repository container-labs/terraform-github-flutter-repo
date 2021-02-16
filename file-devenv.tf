module "devenv" {
  source          = "container-labs/devenv-repo/github"
  version         = "~> 0.2"
  repository      = var.repository
  workspace_image = "flutter"
}
