#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ftb='java -jar /home/orloc/games/FTB/ftb.jar'

PS1='[\u@\h \W]\$ '

EDITOR='/usr/bin/vim'
VISUAL='/usr/bin/gvim'
BROWSER='/usr/bin/chromium'

JAVA_HOME='/usr/java/jdk.1.7.updateNo'

PATH="${PATH}:/home/orloc/bin:$(ruby -e 'puts Gem.user_dir')/bin:/usr/bin/vendor_perl"

source ~/.profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

export LC_ALL=en_US.UTF-8
export GOPATH=$HOME/dev/go

function search(){ 
    aura -Ss $1; aura -As $1;
}
