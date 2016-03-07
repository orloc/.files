#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -larh'
alias godir='cd $HOME/dev/go/src/github.com'
alias steamapps='cd $HOME/.steam/steam/steamapps/common'


## wp stuff
alias wp-stage-push="ssh-add ~/.ssh/19AWS2.pem && bundle exec cap staging wpcli:db:push && bundle exec cap staging wpcli:uploads:rsync:push"
alias wp-stage-pull="ssh-add ~/.ssh/19AWS2.pem && bundle exec cap staging wpcli:db:pull && bundle exec cap staging wpcli:uploads:rsync:pull"
alias wp-live-pull="ssh-add ~/.ssh/19primaryAWS.pem && bundle exec cap production wpcli:db:pull && bundle exec cap production wpcli:uploads:rsync:pull"
alias wp-live-push="ssh-add ~/.ssh/19primaryAWS.pem && bundle exec cap production wpcli:db:push && bundle exec cap production wpcli:uploads:rsync:push"

PS1='[\u@\h \W]\$ '

EDITOR='/usr/bin/vim'
VISUAL='/usr/bin/gvim'
BROWSER='/usr/bin/chromium'
LANG=en_US.utf8

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
[[ "$PS1" ]] && echo -e "\e[00;33m$(/usr/bin/fortune)\e[00m"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

eval $(ssh-agent)
ssh-add ~/.ssh/*.pem

set +fp ~/.config/fontconfig/conf.d/ 

export LC_ALL=en_US.UTF-8
export GOPATH=$HOME/dev/go
export WINEPREFIX=$HOME/.config/wine/
export WINEARCH=win32

export ANDROID_HOME=$HOME/tools/android-sdk-linux

function search(){ 
    aura -Ss $1; aura -As $1;
}

function getGroups(){
    cut -d: -f1 /etc/group
}

function resetDhcp() { 
    sudo systemctl restart dhcpcd
}



PATH="${PATH}:/home/orloc/bin:$(ruby -e 'puts Gem.user_dir')/bin:/usr/bin/vendor_perl:/home/orloc/.composer/vendor/bin"
PATH="${PATH}:/usr/bin"
PATH="${PATH}:${GOPATH}/bin"
PATH="${PATH}:${ANDROID_HOME}/tools"
PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
if [ -f /usr/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh ]; then
    source /usr/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh
fi


