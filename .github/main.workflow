workflow "Push to master" {
  on = "push"
  resolves = [
    "publish-hugo-site",
  ]
}

action "master branch" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "publish-hugo-site" {
  needs = "master branch"
  uses = "tcitry/publish-hugo-site@v1.0"
  env = {
    TARGET_REPO = "hackliza/hackliza.github.io"
    CNAME = "hackliza.gal"
    HUGO_VERSION = "0.74.3"
  }
  secrets = ["TOKEN"]
  args = "gh-pages"
}
