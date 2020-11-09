#!/usr/bin/env bash
# deploy.sh: Script to deploy website to GitHub Pages
# Author: Nanda H Krishna (https://github.com/nandahkrishna)

# Get user confirmation to deploy
read -r -p "Deploy website? [y/N]: " choice
if [ "$choice" != "y" ]
then
  echo "Aborted!"
  exit 1
fi

# Check if there are uncommitted changes
if [ -n "$(git status --porcelain=v1 2>/dev/null)" ]
then
  echo "Aborted: There are uncommitted changes!"
  exit 1
fi

# Create or reset gh-pages
git checkout -B gh-pages

# Build site, delete and move files
bundle exec jekyll build
find . -maxdepth 1 ! -name "_site" ! -name "CNAME" ! -name ".gitignore" ! -name ".git" ! -name "." ! -name ".." -exec rm -rf {} \;
mv _site/* .
rm -rf _site/

# Show tree
read -r -p "Show tree? [y/N]: " choice
if [ "$choice" = "y" ]
then
  tree
fi

# Add, commit and push to gh-pages
git add -fA
git commit --allow-empty -m "Deploy website ($(git log -1 --pretty=format:'%cd: %B' --date=short))"
git push -f -q origin gh-pages

# Checkout to master
git checkout master

# Display message and exit
echo "Deployed successfully!"
exit 0
