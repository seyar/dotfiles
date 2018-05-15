# git aliases (based on TJ Holowaychuk's aliases)
alias gdc="git dic"
alias gbd="git branch -D"
alias gm="git merge --no-ff"
alias gpt="git push --tags"
alias gp="git push"
alias gr='cd "`git rev-parse --show-toplevel`"'

alias gs='git status -s'
alias пы='git status -s'
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gcf='git commit --fixup='
alias go='git checkout '

alias gsl='git status | less'
alias gl='git log'

alias ggom='git pull origin master'
alias gsom='git push origin master'
alias ggod='git pull origin dev'
alias gsod='git push origin dev'
alias ggo='git pull origin'
alias gso='git push origin'
alias gfo='git fetch origin'
alias gom='git checkout master'

alias grh='git reset --hard'
alias gcl='git clean -f -d'
alias gcp='git cherry-pick'
alias grm='git rm -r'
alias grsh='git reset --soft HEAD^'
alias gh='git hist'
alias пр='git hist'
alias gd='git diff'
alias пв='git diff'

alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias gmc='git merge --continue'
alias gma='git merge --abort'
alias gms='git merge --squash'
