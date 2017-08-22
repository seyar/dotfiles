if [ -d "$HOME/.dotfiles" ]; then
    DOTFILES_FOLDER=".dotfiles"
elif [ -d "$HOME/dotfiles" ]; then
    DOTFILES_FOLDER="dotfiles"
elif [ -d "$HOME/configs" ]; then
    DOTFILES_FOLDER="configs"
else
    DOTFILES_FOLDER=${PWD##*/}
fi

export DOTFILES_FOLDER=$DOTFILES_FOLDER
export LC_ALL=ru_RU.UTF-8
export LESSCHARSET=utf-8
export EDITOR=vim
export ACK_PAGER='less -FRX'
export GIT_PS1_SHOWDIRTYSTATE=1

# Path to your oh-my-zsh installation.
export ZSH=$HOME/$DOTFILES_FOLDER/oh-my-zsh

export N_PREFIX="$HOME/n"
# If you installed the SDK via Homebrew, otherwise ~/Library/Android/sdk
export ANDROID_HOME=/Users/seyar/Library/Android/sdk
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"

export PATH=${PATH}:$N_PREFIX/bin
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:/Library/Frameworks/Mono.framework/Versions/Current/bin/

export SELENIUM_GRID_LOGIN='geo'
export SELENIUM_GRID_PASSWORD='9a847400b43b75f6852363207b09aa0d'

# Use local bin before
if [ -d ${HOME}/bin ] ; then
    PATH=${HOME}/bin:${PATH}
fi
