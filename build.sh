#!/bin/sh

# Config builder
# Copyright 2012 Alexander Tarmolov <tarmolov@gmail.com>

# show program usage
show_usage() {
    echo "usage: ./build.sh [--clean] --name=<your name> --email=<your email>"
    echo "      --clean         removes all builded files (optional)"
    echo "      --name          your name for git and debian"
    echo "      --email         your email for git and debian"
    exit
}

# clean config files
# + .vim
clean() {
    for file in .zshrc .tmux.conf .vimrc .profile .gitconfig
    do
        rm -rf ~/$file
    done
}

# process command-line arguments
for OPT in "$@" ; do
    case $OPT in
        -*)  true ;
            case $OPT in
               --help)
                    show_usage;;
                --name=*)
                    NAME=${OPT##*=}
                    shift ;;
                --email=*)
                    EMAIL=${OPT##*=}
                    shift ;;
                --clean)
                    echo "Clean old config files..."
                    clean
                    exit;;
                -*)
                    echo "Illegal option"
                ;;
            esac
        ;;
    esac
done

echo "Config setup is started..."
echo

# use expect or printf for yes/no prompt
#read -p "Config builder wants to delete .bashrc .zshrc, .tmux.conf, .gitconfig, .vimrc and .vim. Do you want to continue? (y/n)? " REPLY
#[ "$REPLY" != "y" ] && exit

echo "Clean old config files..."
clean
if [ -d "$HOME/.dotfiles" ]; then
    DOTFILES_FOLDER=".dotfiles"
elif [ -d "$HOME/dotfiles" ]; then
    DOTFILES_FOLDER="dotfiles"
else
    DOTFILES_FOLDER=${PWD##*/}
fi

# create symblinks
ln -sf ~/$DOTFILES_FOLDER/bashrc ~/.bashrc
ln -sf ~/$DOTFILES_FOLDER/tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/$DOTFILES_FOLDER/vim/.vimrc ~/.vimrc
ln -sf ~/$DOTFILES_FOLDER/zsh/templates/.zshrc ~/.zshrc
ln -sf ~/$DOTFILES_FOLDER/.nvmrc ~/.nvmrc

cd ~/$DOTFILES_FOLDER
git submodule init
git submodule update

echo "Install vim plugins..."
sleep 1

vim -c ":BundleInstall" -c ":qa"
cd - >> /dev/null

echo "Generate .profile and .gitconfig"

# generate .profile if name and e-mail are set
if [ -n "$NAME" ] &&  [ -n "$EMAIL" ]; then
    echo "export DEBFULLNAME=\"$NAME\"" >> ~/.profile
    echo "export DEBEMAIL=$EMAIL" >> ~/.profile
    echo "export EMAIL=$EMAIL" >> ~/.profile

    echo "[user]" >> ~/.gitconfig
    echo "  name = $NAME" >> ~/.gitconfig
    echo "  email = $EMAIL" >> ~/.gitconfig
fi

echo "export DOTFILES_FOLDER=\"$DOTFILES_FOLDER\"" >> ~/.profile

echo ". ~/$DOTFILES_FOLDER/.profile" >> ~/.profile
echo "[include]" >> ~/.gitconfig
echo "  path = $DOTFILES_FOLDER/.gitconfig" >> ~/.gitconfig

echo "Add useful commands"
mkdir -p ~/bin
ln -sf ~/$DOTFILES_FOLDER/.bin/diffconflicts ~/bin

echo "Add vscode settings"
mkdir -p "$HOME/Library/Application\ Support/Code/User"
cd "$HOME/Library/Application\ Support/Code/User"
ln -snf $HOME/.dotfiles/vscode/snippets ./
ln -snf $HOME/.dotfiles/vscode/keybindings.json ./

# add tmux start config
#ln -sf ~/$DOTFILES_FOLDER/.bin/tm ~/bin

echo
echo "Config setup is finished..."
