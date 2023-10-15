#!/bin/bash



file_path="package.json"
before_commit=$(git rev-parse --verify HEAD) # Verify the current commit

# Ensure you're on the correct branch and synchronize with remote
# git checkout main || exit 1
# git pull origin main --rebase || exit 1

# Add and commit the file with the specified date
git add .
GIT_AUTHOR_DATE='Mon Oct 16 00:00:00 2023 +0530' GIT_COMMITTER_DATE='Mon Oct 16 00:00:00 2023 +0530' git commit -m "vercel deployment changes" --date='Mon Oct 16 00:00:00 2023 +0530'

new_commit=$(git rev-parse --verify HEAD)
file_blob=$(git rev-parse --verify HEAD:"$file_path")

# Return to the previous branch safely
# git checkout - || exit 1

# Use git filter-repo correctly for renaming paths or any other task you need
git filter-repo --path-rename refs/original/:refs/backup/ -f

# Final reset to the new state
git reset --hard
