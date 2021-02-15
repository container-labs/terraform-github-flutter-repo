module "devenv" {
  source          = "container-labs/devenv-repo/github"
  version         = "~> 0.1"
  repository      = var.repository
  workspace_image = "flutter"
}