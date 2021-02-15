module "gitignore" {
  source     = "container-labs/gitignore/github"
  version    = "~> 2.8"
  repository = var.repository
  ignores = [
    "osx",
    "windows",
    "flutter"
  ]
}