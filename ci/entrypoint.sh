#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
# cat /etc/os-release
echo "The second arg: $2"

env
