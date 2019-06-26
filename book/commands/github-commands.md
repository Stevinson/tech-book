# Github

## Notes

* There are two ways of integrating changes from one branch into another in Git. One is merge and the other is rebase.
  * merge. This is a three-way merge between the two latest branch snapshots and the ost common ancestor of the two.
  * rebase.  


* NB. If you fork then clone it will have ME as the push repo, but if you clone directly it will have the ORIGINAL repo as the push repo.

* **Personal access token** can be generated by following [these](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/) instructions. This can be used for two-factor authentication or to access protected content in an organisation that uses SSO.

## Commands

* `hub create` : Creates a remote so git can push to github

* `hub browse` : Open browser at the directory.

* `git remote -v` : Sets the origin remote.

* `git add .` : Add the path.
  * `-A` : all

* `git pull`
  * `-r` or `--rebase`: When true, rebase the current branch on top of the upstream branch after fetching. This means that instead of merging, git finds the base of your branch, finds all of the commits between  that base and HEAD, and re-plays those commits on the HEAD branch you're rebasing onto. Git creates new commits that represent what your changes look like on top of the rebased branch. See [this](https://stackoverflow.com/questions/2715085/rebasing-and-what-does-one-mean-by-rebasing-pushed-commits#28257263) for a good explanation.

* `git clone`
  * `-q`: Operate quietly. Progress is not reported to the standard error stream.

* `git remote`
  * `set-url <origin> <https://github.com/Stevinson/events-microservice.git>` : To change the upstream remote of the directory:
  * `add <origin> <https://github.com/Stevinson/tech-book.git>` : To add a remote upon creation of the repo.

### Branching

* `git branch -u origin edward-stevinson`
  Set the upstream branch tying your local branch to the GHE branch
  * `-u <upstream>`, `--set-upstream-to=<upstream>`

           Set up <branchname>'s tracking information so <upstream> is

           considered <branchname>'s upstream branch. If no <branchname> is

           specified, then it defaults to the current branch.

* `git branch -vv` - Show which upstream branch all the branches of that repo are tracking

* `git branch -f <branchName> <hash + relative move>` - reassign a branch to a specific commit

* `git branch -d feature/login` : delete a local branch

* `git push origin --delete feature/login` : delete a remote branch

* The following code brings in changes from master to your branch and then pushes your branch:

```
git pull --rebase
git checkout <branch>
git rebase master
git checkout master
git merge <branch>
```

* `git pull --rebase origin <branch name>` : update your current branch

* This removes untracked files from the working tree. The -f is short for —force and overrides the default functionality that git refuses to delete files or directories. The -x means that the standard ignore rules set by the .gitignore file.

```Git
git clean -fx <file_name>
```

* The -a, short for —all, tells the command to automatically stage files that have been modified and deleted, but new files you have not told Git about are not affected.

```Git
git commit -
```

* This removes the .git file and so stops git tracking changes in the repo.

```Git
rm -rf .git
```

* An ancilliary plumbing command primarily used for manipulation. One common usage is to print the SHA1 hashses given a revision specifier.

```Git
git rev-parse
```

* To delete a repo:

```Git
git push origin --delete <branch-name>
```

* To remove untracked files from the working tree use the `clean` command. It does this by recursively removing files that are not under version.
  * `-x` This also removes ignored files.

## Merging and rebasing

* `git mergetool` - To deal with merges

* `git rebase -i HEAD~4` - interactive rebasing. This opens up a UI. Select the number of commits you want the option of refactoring. It creates a new series of commits to represent the changes, starting from where you selected to go up to in the original command.


## Resetting changes

* Reset current HEAD to the specified state. You can think of HEAD as the current branch (when you switch branches, the HEAD revision changes to point to the tip of the new branch).

* `git reset <commit>` - reset reverts changes by moving a branch reference back to an older commit but this only works for local changes

* `git revert <branch>` - creates a new commit that contains changes to revert the previous commit


### Errors

* When unable to connect when attempting to clone a repo, then run the following commands and restart the terminal.

```
git config --global --unset http.proxy
git config --global --unset https.proxy
```

### HEAD

* `git checkout <commit hash>` - this will detach the head and attach it to a commit instead.

* `cat .git/HEAD` - look at what HEAD is pointing to

* `git log --graph --decorate --pretty=format:‘%C(auto,yellow)%h%Cred%>(13,trunc) %ad  %C(auto,green)%<(10,trunc)%aN%C(auto,reset)  %s%C(auto,red)% gD% D’ --abbrev-commit --all --date=relative` - display a coloured graph of git commits


### Other

Relative commits:

* `^` - move up one commit at a time

* `~<number>` - moves upwards a number of times

* e.g. `git checkout branchName~5` - note that this does not effect the branch you are currently pointing at

* `git cherry-pick <commit1> <commit2> <...>` - facilitates moving commits to other branches

* For a good reference of `.gitignore` patterns, look [here](https://www.atlassian.com/git/tutorials/saving-changes/gitignore).

* To turn off tags if they appear: `git config remote.origin.tagopt --no-tags`

* Delete all local tags you may have: `git tag -l | xargs git tag -d`

* To configure git to use an external compare editor:

```
$ git config --global diff.tool bc3
$ git config --global difftool.bc3.trustExitCode true
$ git config --global merge.tool bc3
$ git config --global mergetool.bc3.trustExitCode true
```

## Tags

Tags can be used to version and they just point to a commit.

* `git fetch --all --tags --prune` : Fetch all the remotes, including all the tags

* `git checkout tags/<tag_name> -b <branch_name>` : Checkout to the tag 