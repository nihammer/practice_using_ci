#!/bin/bash

echo "Hello $1"
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
# cat /etc/os-release
echo -e "The second arg: $2\n"
echo -e "The third arg: $3\n"

echo -e "pwd:\n"
pwd
echo -e "ls -la\n"
ls -la
echo -e "ls -la ./ci\n"
ls -la ./ci
echo -e "List environment variables:\n"
env
