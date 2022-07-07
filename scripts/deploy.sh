#!/bin/bash

# Set variables
PROJECT_PATH='/home/root'

main() {
  pwd
  # Move to the correct directory
  cd $(dirname $0)'/..'
  ls $PROJECT_PATH
}

main
