workflow "Test on push" {
  on = "push"
  resolves = ["npm test"]
}

workflow "Release" {
  on = "release"
  resolves = ["ENV"]
}

action "npm ci" {
  uses = "docker://node:alpine"
  runs = "npm"
  args = "ci"
}

action "npm test" {
  uses = "docker://node:alpine"
  needs = ["npm ci"]
  runs = "npm"
  args = "test"
}

action "ENV" {
  uses = "docker://node:alpine"
  runs = "ENV"
  needs = ["npm ci"]
}
