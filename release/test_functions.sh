#! /bin/bash

. ./functions.sh

function test_inc_version() {
  assertEquals 5.7.0 "$(inc_version 5.6.0)"
}

function test_release_version() {
  assertEquals 5.7.1 "$(inc_version 5.7.1-SNAPSHOT)"
}

function test_is_snapshot() {
  assertEquals "" "$(is_snapshot 5.6.0)"
  assertEquals "1" "$(is_snapshot 5.6-SNAPSHOT)"
}

. ./shunit2/shunit2


