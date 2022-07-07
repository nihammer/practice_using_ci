#!/bin/bash

# Set variables
PROJECT_PATH='/home'

main() {
  pwd
  # Move to the correct directory
  cd $(dirname $0)'/..'
  ls $PROJECT_PATH
}

main
