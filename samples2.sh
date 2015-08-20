#!/bin/bash
set -x #echo on

# Drop and recreate the workspace
rm -rf samples2
mkdir -p samples2
cd samples2

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

# Prepare the second commit
echo "lorem ipsum" > foobar.txt
git add -A
git commit -am "Third Commit"

read -p "Press [Enter] to continue..."

# Feature Branches
git branch release/2.0.0

# Dashboard Feature Commit
echo "lorem ipsum" > dashboard.html
git add -A
git commit -am "Dashboard screen"

# Another Dashboard Feature Commit
echo "lorem ipsum" > dashboard.js
git add -A
git commit -am "Dashboard screen bugfix"

sleep 2s

git checkout release/2.0.0

# Customer Feature Commit
echo "lorem ipsum" > customer.html
git add -A
git commit -am "Customer screen"

# Another Customer Feature Commit
echo "lorem ipsum" > customer.js
git add -A
git commit -am "Customer screen enhancement"


read -p "Press [Enter] to continue..."

#git checkout release/2.0.0

# Feature Branch
git merge release/1.0.0 --no-ff

# Login Feature Commit
echo "lorem ipsum" > login.html
git add -A
git commit -am "Login screen"

# Another Login Feature Commit
echo "lorem ipsum" > login.js
git add -A
git commit -am "Login screen validation"

