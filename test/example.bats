#!/usr/bin/env bats

@test "example script reports usage when required arguments are missing" {
  run bash scripts/example.sh
  [ "$status" -eq 2 ]
}
