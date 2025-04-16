#!/bin/bash

# Configuration
REPO_PATH="/root/Manage"
REPO_NAME="Yumeko"
GITHUB_USERNAME="Team-infamous"
GITHUB_TOKEN="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"

# Step 1: Go to your repo
cd "$REPO_PATH" || { echo "Repo path not found!"; exit 1; }

# Step 2: Remove old origin
git remote remove origin 2>/dev/null

# Step 3: Create new repo on GitHub
curl -s -H "Authorization: token $GITHUB_TOKEN" \
     -d "{\"name\":\"$REPO_NAME\"}" \
     https://api.github.com/user/repos \
     && echo "GitHub repo created: $REPO_NAME"

# Step 4: Add new origin
git remote add origin https://github.com/$GITHUB_USERNAME/$REPO_NAME.git

# Step 5: Push code
git push -u origin master  # Replace 'master' with 'main' if needed
