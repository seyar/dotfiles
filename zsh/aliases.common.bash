alias l='ls -la'
alias hgr='history | grep '

alias св='cd'
alias cdh='cd html'
alias cdw='cd www && l'
alias v='cd ..'
alias vv='cd ../..'
alias vvv='cd ../../..'
alias vvvv='cd ../../../..'
alias ve='vi .'

alias tmu='tmux attach || tmux new '
alias tmuxkill='tmux kill-server '

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
alias em='./node_modules/.bin/enb make'
alias ei18n='./node_modules/.bin/enb make i18n.get'
alias js='git_cached_files=$(git diff --cached --name-only --diff-filter=ACMR | xargs echo); ./node_modules/.bin/jscs $git_cached_files'
alias lint='git_cached_files=$(git diff --cached --name-only --diff-filter=ACMR | xargs echo); ./node_modules/.bin/jshint-groups $git_cached_files'

alias build='make release && debuild -b && debrelease'

alias convert='HandBrakeCli --audio-copy-mask=ac3,dts,dtshd --audio-fallback=ffac3 -e=x264 --quality=23 --ab=160'

alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin

alias port="sudo port"
alias portup="port -v selfupdate && port upgrade outdated"

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
