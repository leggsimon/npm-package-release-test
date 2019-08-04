workflow "Test on push" {
  on       = "push"

  resolves = [
    "npm test"
  ]
}

workflow "Release" {
  on       = "release"

  resolves = [
    "printenv"
  ]
}

action "npm ci" {
  uses = "docker://node:alpine"
  runs = "npm"
  args = "ci"
}

action "printenv" {
  uses = "docker://node:alpine"
  runs = "printenv"
}

action "npm test" {
  uses  = "docker://node:alpine"
  runs  = "npm"
  args  = "test"

  needs = [
    "npm ci",
    "printenv"
  ]
}

action "ENV" {
  uses  = "docker://node:alpine"
  runs  = "ENV"

  needs = [
    "npm test"
  ]
}
