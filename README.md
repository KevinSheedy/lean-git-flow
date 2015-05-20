# A simpler Git branching model

**SimplerGitFlow** is a git workflow similar to [GitFlow](http://nvie.com/posts/a-successful-git-branching-model/) but simpler. It has only two types of branches, **feature branches** and **release branches**. Need to customise the workflow for your team? Feel free to [Fork It](https://help.github.com/articles/fork-a-repo/).

## Release Branch
Start by creating a branch for your upcoming release:

    git checkout -b release/1.0.0

Release branches are named using [Semantic Versioning](http://semver.org/) i.e. MAJOR.MINOR.PATCH.

## Delete the master branch
**SimplerGitFlow** advocates meaningful names. The **master** branch has many different meanings, depending on the project. With SimplerGitFlow, we delete the master branch.

    git branch -d master

To delete the remote master branch use:

    git push origin --delete master

Remember, git branches are just pointers. By deleting master, we don't lose any code or commits, as long as we have already created a release branch.

## Feature Branch
A feature branch provides an isolated sandbox to do some work. That work could be a **bugfix**, a new **feature** or just an **experiment**. If you commit your work to a feature branch, it stays completely isolated from all other branches. This is very useful if you need to save your work and switch to working on a different task before the feature is complete.

    git checkout -b feature/login-screen

## Commit to your Feature Branch

    git commit -m "This is my new feature"

## Merge to the release branch
Once you decide your feature is ready to target a particular release, merge it:

    git checkout release/1.0.0

    git merge feature/login-screen --no-ff

The **--no-ff** flag forces git to create a merge commit. This preserves the history that the feature branch existed.

## Example
This example shows 3 feature branches and one release branch. Only one of the feature branches has been merged back into the release branch.

![alt text](./images/tortoise-min.png)

This is a screenshot of a git repo viewed using the popular open source [TortoiseGit](https://code.google.com/p/tortoisegit/) client. It is important to be comfortable looking at real git histories like this, as conceptual flowcharts can be misleading.

## Commit directly to the release branch
If your change is small or your team is small, you may choose to commit directly to the release branch. It's your choice. Use your best judgement when to use a feature branch and when to commit directly to the release branch. This is useful when you need to make a very small change like a spelling correction.

## Parallel Release Branches
It is normal to have multiple release branches in parallel. If you are developing a webapp, you may only ever have one or two release branches at a time. For example, one release branch may be for the final few bugfixes for an imminent release while a 2nd release branch is for new features that will be released further in the future. However, if your project is a library, you may have many versions in production and may have many release branches. Release branches are created off other release branches (or sometimes from tags).

    git checkout release/1.0.0
    git branch release/2.0.0
    git checkout release/2.0.0

## Tag Production Ready Code
When your code is deemed production ready, tag it. SimplerGitFlow advocates [Semantic Versioning](http://semver.org/). Any commit with a tag in the form **1.0.0** is deemed a released version. Once the code is tagged/released, there should be no more commits on that release branch.

    git tag 1.0.0 release/1.0.0

If the code gets tagged in error, git allows you to delete the tag and to re-tag it. However, this should only be done if a tag was genuinely created in error.

## Merge Release Branches Forward
Once a release has shipped, it should be merged forward into any numerically higher release branches.

    git checkout release/2.0.0
    git merge release/1.0.0 --no-ff

## Lock or Delete Released Branches
Once a release has shipped and is is tagged, there is no more need for the release branch. At this point, the release branch should be deleted, or if your git server supports it, you may choose to lock it. Either way, it is important for the team to know that once the release is tagged, there are no more commits on that branch.

## Example
In this example, a 2nd release branch has been created and the two remaining features have been merged into it. We have also tagged release **1.0.0** and deleted the **release/1.0.0** branch.

![alt text](./images/tortoise-multi-branch.png)

## Branch from a tag
Release branches can be branched off other release branches or from a tag. This is useful for patch releases:

    git checkout -b release/1.0.1 <tagname>

## Default Branch
Many Git Servers (GitHub, GitLab, GitStash) allow you to specify a default branch. This branch gets displayed when you browse to the repo via the web interface and gets checked out when you clone the repo. By default, it's usually master. With SimplerGitFlow, it's up to you to set the default branch to whatever release branch you see fit.

## Not sure what to name your branch?
If you're not certain what version your next release will be, that's not a problem. Give it a provisional version number and you can change it later. For example, if your last release was **2.2.1** then you could provisionally create a **release/2.3.0** branch. Later, you may decide that the next release will actually be **3.0.0**. In that case, simply create a **release/3.0.0** branch and delete **release/2.3.0**.

## Other Workflows
Check out these other git workflows and pick the one that suits you:

- [GitFlow](http://nvie.com/posts/a-successful-git-branching-model/)
- [GitHub Flow](https://guides.github.com/introduction/flow/)
- [GitLab Flow](https://about.gitlab.com/2014/09/29/gitlab-flow/)
- [Atlassian Workflows](https://www.atlassian.com/git/tutorials/comparing-workflows/)