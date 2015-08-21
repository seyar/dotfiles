#alias screen='screen -T linux -s /bin/bash'
#alias rgrep='grep -r --exclude=.git --exclude=\*.svn\*'
#alias surl='svn info | grep URL'
#alias svst='svn st --ignore-externals | grep -v ^X'
#alias dch='dch --distributor debian'
alias dch='dch --distributor debian --distribution unstable'
alias debrelease='if [ -e dupload.conf ]; then debrelease -c --nomail; else debrelease --nomail; fi'
alias less='less -FRX'
#alias ducks="du -cks * | sort -rn | head -n11"
alias vim='vim -p'
#alias e='vim'
alias grep='grep --color'
#alias rmn='rm -rf node_modules/'

sdiff() {
    svn diff --no-diff-deleted $@ | colordiff | less -SR
}

# Set appropriate ls alias
case $(uname -s) in
    Darwin|FreeBSD)
            alias ls="ls -hFG"
    ;;
    Linux)
            alias ls="ls --color=always -hF"
    ;;
    NetBSD|OpenBSD)
            alias ls="ls -hF"
    ;;
esac
