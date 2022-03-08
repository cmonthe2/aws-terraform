resource "github_repository" "github-repo-1" {
  name        = "demo-terraform"
  description = "repo created by teraform code"

  visibility = "public"
  auto_init = "true"
}
