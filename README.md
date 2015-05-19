# A simpler Git branching model

GitFlow was great. It had nice pictures, it explained concepts like feature branches and release branches and it provided a well documented workflow for developers to collaborate around. But after using GitFlow for a while, I found it was too complicated for my needs. So in the Open Source spirit, here is my "fork" of Vincent Driessen's workflow.

## FlowGit
FlowGit is a simple workflow that can be easily understood and adopted by a team quickly. If FlowGit doesn't fit your needs, feel free to Fork It.

## Fewer Branches
GitFlow has five types of branch. FlowGit only has two: **release branches** and **feature branches**.

## No mainline
In an attempt to simplify the workflow, FlowGit has dropped both the develop and master branches. Instead, whatever release branch you're currently working on, that's your mainline.

## A Real History
The famous gitflow diagram looks great, but doesn't look like a real commit history.
Here's a real commit history, viewed in the popular open source client, TortoiseGit.

![alt text](./images/tortoise-min.png)


## Releases, Features and Tags

## A Branch is just a pointer

## Fork Me

## Semantic Versioning - SemVer