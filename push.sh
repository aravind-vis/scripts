#!/bin/bash

# Avoid pushing to specified branches by mistake.

# Get the current branch name
current_branch=$(git branch --show-current)

# Define an array of protected branch names
protected_branches=("develop" "main" "master" "qat-release" "staging" "production")

# Check if the current branch is in the protected branches array
if [[ " ${protected_branches[@]} " =~ " ${current_branch} " ]]; then
  echo "IDIOT!! IDIOT!! IDIOT!! This is a protected branch.. Do not push here"
  say "Protected branch.. PUSH FAILED"
else
  if [[ "$0" == *"gpsup"* ]]; then
    git push --set-upstream origin "$current_branch"
  else
    git push
  fi
fi
