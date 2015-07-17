GIT Notes
---------

| **Common Commands**                 ||
|-------------------------------------|--------------------------------------------------------------------|
| git commit -am *message*            | Adds files with *message* to the commit                            |
| git diff                            | Shows details of uncommitted changes                               |
| git status                          | Show the working tree status                                       |
| git checkout .                      | Revert all local uncommitted changes (Run from repo root)          |
| git checkout *some_dir/some_file*   | Revert uncommitted changes only to particular file or directory    |
| git reset                           | This will unstage all files you might have staged with git add     |
| git reset --hard HEAD               | Revert ALL uncommitted changes                                     |
| git clean -fdx                      | Remove all local untracked files, only git tracked files remain    |
| git log --pretty=oneline --decorate | Colorized git log                                                  |

| **Branching**                            ||
|------------------------------------------|---------------------------------|
| git branch git branch -a                 | List Branches                   |
| git checkout --track *origin/branch*     | Checkout and track remote branch|
| **Tagging**                              ||
| git tag -l                               | List tags                       |
| git checkout tags/*tag_name*             | Checkout tag                    |
| git checkout *tag_name* -b *branch_name* | Checkout tag as *branch_name*   |
