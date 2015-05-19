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
git branch feature/customer-screen
git branch feature/login-screen

#
git checkout feature/dashboard-screen

# Dashboard Feature Commit
echo "lorem ipsum" > dashboard.html
git add -A
git commit -am "Dashboard screen"

# Another Dashboard Feature Commit
echo "lorem ipsum" > dashboard.js
git add -A
git commit -am "Dashboard screen bugfix"

#
git checkout feature/customer-screen

# Customer Feature Commit
echo "lorem ipsum" > customer.html
git add -A
git commit -am "Customer screen"

# Another Customer Feature Commit
echo "lorem ipsum" > customer.js
git add -A
git commit -am "Customer screen enhancement"

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


# Merge the feature branch
git checkout release/1.0.0
git merge feature/login-screen --no-ff

