#!/usr/bin/env bash
set -euo pipefail

PLACEHOLDER_URL="git@github.com:Montana/abu-musa.git"

if [ ! -d .git ]; then
  echo "Error: run this inside a git repository."
  exit 1
fi

if git remote get-url origin >/dev/null 2>&1; then
  echo "origin already exists. Repointing it to placeholder..."
  git remote set-url origin "$PLACEHOLDER_URL"
else
  echo "Adding placeholder origin..."
  git remote add origin "$PLACEHOLDER_URL"
fi

echo
echo "Current remotes:"
git remote -v
