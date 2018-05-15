alias l='ls -la'
alias hgr='history | grep '

alias св='cd'
alias cdh='cd html'
alias cdw='cd www && l'

alias tmu='tmux attach || tmux new '
alias tmuxkill='tmux kill-server '
alias tn='$HOME/$DOTFILES_FOLDER/.bin/tm'
alias ta='$HOME/$DOTFILES_FOLDER/.bin/tm'
alias tls='tmux ls'

alias dch='dch --distributor debian --distribution unstable'
alias debrelease='if [ -e dupload.conf ]; then debrelease -c --nomail; else debrelease --nomail; fi'
alias less='less -FRX'
alias ducks="du -cks * | sort -rn | head -n11"
alias vim='vim -p'
alias grep='grep --color --exclude=.git --exclude=\*.svn\*'
alias js='git_cached_files=$(git diff --cached --name-only --diff-filter=ACMR | xargs echo); ./node_modules/.bin/jscs $git_cached_files'
alias lint='git_cached_files=$(git diff --cached --name-only --diff-filter=ACMR | xargs echo); ./node_modules/.bin/jshint-groups $git_cached_files'

alias port="sudo port"
alias portup="port -v selfupdate && port upgrade outdated"

function convert() {
    HandBrakeCLI -e x264 -q 22 -r 25 -B 64 -X 480 -O -i $1 -o ${1%.*}_converted.mp4
}
function convert-fast() {
    HandBrakeCLI --preset="Very Fast 720p30" -i $1 -o ${1%.*}_converted.mp4
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
