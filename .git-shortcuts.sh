#straight up git status alias
alias gs='git status'
#status, but displayed in a more friendly/clean way
alias gss='git status -s'

#add all files
alias gaa='git add -A'

#git pull and push aliases
alias gp='git pull'
alias gph='git push'

#pull a specific branch/remote
function gp {
	gp "$1" "$2"
}

#pull a specific branch/remote
function gph {
	gph "$1" "$2"
}

#commit all files with message, and then display status
function gc {
	gaa
	git commit -m "$1"
	gs
}

#show local and current branch
alias gb='git branch'
#show remote branches
alias gbr='git branch -r'
#create new branch
alias gbn='git checkout -b'

#checkout branch
alias gck='git checkout'

#remove local branch
function gbdel {
	git branch -D "$1"
}
#delete remote branch
function gbrdel {
	git push origin :"$1"
}

#pull a specific branch/remote
function gt {
	git tag -m "" $1
	git push origin --tags
}

#diff in color
alias gdiff='git diff --color-words'

#get a list of conflicts
alias conflicts='git diff --name-only --diff-filter=U'

#remove any files after adding to gitignore
alias gri='git ls-files --ignored --exclude-standard | xargs git rm'


alias gclean='git gc --prune=now && git remote prune origin'

#log of commits
alias glog='git log --graph --oneline --all --decorate'

#reset to head
alias greset='git reset --hard'
# reset to head and remove all untracked files (including npm installs)
alias greseteverything='git clean -d -x -f; git reset --hard'



if type git-up -t > /dev/null 2>&1; then
	alias gup='git-up'
	alias gupp='git-up && git push'
else
	alias gpr='git pull --rebase'
	alias gprp='gup && git push'
fi


#amend a commit by adding more files or changing the commit messge
function goops {
	git commit -a --amend -C HEAD
	gs
}


function ghelp {
	echo "
- - - - - - - - - - - - - -
Git Convenience Shortcuts:
- - - - - - - - - - - - - -
ghelp - List all Git Convenience commands and prompt symbols
gp - Git Pull
gup - Pull (via rebase)
gph - Git Push
gaa - Add all changes (including untracted files) to staging
gc "Message" - Commit all new files & changes with message
goops - Add changes to previous commit & edit comessage
- - - - - - - - - - - - - -
gt v0.0.0 - Tag and push tag to remote
gb - Show local branches
gbn - Create new branch
gbr – Show remote branches
gbdel - Delete local branch
gbrdel - Delete remote branch
- - - - - - - - - - - - - -
gs - git status
gss - Visually better git status
glog - Decorated & graphed log
gdiff - A word-diff of changes
gclean - Compress & garbage collect data store
greset - Hard branch reset
greseteverything - Hard reset and remove all untracked files
conflicts - Display list of conflicts

- - - - - - - - - - - - - -
Prompt Symbols:
- - - - - - - - - - - - - -
The prompt shows the current branch & among other helpful things:

*  - Uncommitted changes
+  - Staged changes
%  - Untracked files
<  - You're behind the origin
>  - You're ahead of the origin
<> - You've diverged from the origin
=  - You're up-to-date with the origin

- - - - - - - - - - - - - -
"
}
