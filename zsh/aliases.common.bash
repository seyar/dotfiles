alias dch='dch --distributor debian --distribution unstable'
alias debrelease='if [ -e dupload.conf ]; then debrelease -c --nomail; else debrelease --nomail; fi'
alias less='less -FRX'
alias ducks="du -cks * | sort -rn | head -n11"
alias vim='vim -p'
alias grep='grep --color --exclude=.git --exclude=\*.svn\*'
alias tn='$HOME/$DOTFILES_FOLDER/.bin/tm'
alias ta='$HOME/$DOTFILES_FOLDER/.bin/tm'
# alias tn='tmux new'
# alias ta='tmux attach'
alias tls='tmux ls'

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
