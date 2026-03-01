#!/bin/sh
readonly TESTLIB="test-func"
spath="${0%/*}"
# shellcheck disable=SC1090
. "$spath/$TESTLIB" || {
    printf "Error: missing library %s\n" "$spath/$TESTLIB" 1>&2
    exit 70
}

cache_root_cred
set_threshold_trap
start_report

# shellcheck disable=SC2034
_basename="${0##*/}"
printf_msg "+++ %s\n\n" "$_basename"

run_clitest "$spath/service-warnings"

print_report
reset_threshold_trap
