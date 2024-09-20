#!/bin/bash

# Get the current branch name
current_branch=$(git branch --show-current)

# Check if the branch name is "develop" or "main" or "master"  (case-sensitive)
if [[ "$current_branch" == "develop" || "$current_branch" == "main" || "$current_branch" == "master" || "$current_branch" == "qat-release" ]]; then
  echo "IDIOT!! IDIOT!! IDIOT!! This is a protected branch.. Do not push here"
  say "Protected branch.. PUSH FAILED"
else
  git push --set-upstream origin $(git_current_branch)
fi

