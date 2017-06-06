export LC_ALL=ru_RU.UTF-8
export LESSCHARSET=utf-8
export EDITOR=vim
export ACK_PAGER='less -FRX'

# Use local bin before
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

