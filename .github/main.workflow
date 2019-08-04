workflow "Test on push" {
  on = "push"
  resolves = ["docker://node:alpine-1"]
}

action "docker://node:alpine" {
  uses = "docker://node:alpine"
  runs = "npm"
  args = "ci"
}

action "docker://node:alpine-1" {
  uses = "docker://node:alpine"
  needs = ["docker://node:alpine"]
  runs = "npm"
  args = "test"
}
