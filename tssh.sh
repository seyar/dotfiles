#!/bin/bash -e

# Сабж запускать просто на ноутбуке как обычный ssh-клиент:
# tssh somehost
#
# Написано на коленке. Патчи приветствуются. :)

ssh "$@" -t '
set -e
command -v tmux 2>/dev/null || { bash; exit $?; }
ln -sf $SSH_AUTH_SOCK $HOME/.ssh_auth_sock
tmux h && COMD="tmux a" || COMD="tmux"
SSH_AUTH_SOCK=$HOME/.ssh_auth_sock $COMD 
'
