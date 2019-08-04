workflow "Test on push" {
  on = "push"
  resolves = ["Run tests"]
}

action "Install dependencies" {
  uses = "docker://node:alpine"
  runs = "npm"
  args = "ci"
}

action "Run tests" {
  uses = "docker://node:alpine"
  needs = ["Install dependencies"]
  runs = "npm"
  args = "test"
}
