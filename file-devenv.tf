module "devenv" {
  source                 = "container-labs/devenv-repo/github"
  version                = "~> 0.8"
  repository             = var.repository
  workspace_image        = "flutter"
  workspace_image_tag    = var.workspace_image_tag
  workspace_image_digest = var.workspace_image_digest
}
