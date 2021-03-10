#!/usr/bin/env bats

@test "git is supported" {
    run git --version
    [ "$status" -eq 0 ]
}

@test "firefox is supported" {
    run firefox --version
    [ "$status" -eq 0 ]
}

@test "docker is supported" {
    run docker --version
    [ "$status" -eq 0 ]
}

@test "docker-compose is supported" {
    run docker-compose --version
    [ "$status" -eq 0 ]
}