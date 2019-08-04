workflow "Test on push" {
  on = "push"
  resolves = ["docker://node:alpine"]
}

action "docker://node:alpine" {
  uses = "docker://node:alpine"
  runs = "npm"
  args = "test"
}
