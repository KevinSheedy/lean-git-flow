#!/bin/bash
set -x #echo on

# Drop and recreate the workspace
rm -rf samples
mkdir -p samples
cd samples

# New git repo
git init

# Create a Release Branch
git checkout -b release/1.0.0

# Delete the Master Branch
git branch -d master

# Prepare the first commit
echo "lorem ipsum" > foo.txt
git add -A
git commit -am "Initial Commit"

# Prepare the second commit
echo "lorem ipsum" > bar.txt
git add -A
git commit -am "Second Commit"

# Feature Branches
git branch feature/dashboard-screen
git branch feature/login-screen

# Feature Branch
git checkout feature/login-screen

# Login Feature Commit
echo "lorem ipsum" > login.html
git add -A
git commit -am "Login screen"

# Another Login Feature Commit
echo "lorem ipsum" > login.js
git add -A
git commit -am "Login screen validation"


#
git checkout feature/dashboard-screen

# Dashboard Feature Commit
echo "lorem ipsum" > Dashboard.html
git add -A
git commit -am "Dashboard screen"

# Another Dashboard Feature Commit
echo "lorem ipsum" > Dashboard.js
git add -A
git commit -am "Dashboard screen validation"


# Merge the feature branch
git checkout release/1.0.0
#git merge feature/login-screen --no-ff

git status
git status
git status
git status
git status
git status
git status
git status
git status
git status
git status
git status
git status

# Prepare the third commit
echo "lorem ipsum" > foobar.txt
git add -A
git commit -am "Third Commit"
