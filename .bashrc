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

SCREENCONFDIR='/home/orloc/.screenlayout'
HOMETMPDIR='/home/orloc/tmp'

lsusb > "$HOMETMPDIR/tmp.screen"
ISDOCKED=`grep "root hub" $HOMETMPDIR/tmp.screen | wc -l`

if [[  $ISDOCKED > 0 ]]; then
    echo 'yay'
else
    echo 'nah'
fi

# prompt command stuff
set_prompt () {
	Last_Command=$? 
	Blue='\[\e[01;34m\]'
	White='\[\e[01;37m\]'
	Red='\[\e[01;31m\]'
	Green='\[\e[01;32m\]'
	Reset='\[\e[00m\]'
	FancyX='\342\234\227'
	Checkmark='\342\234\223'

	# Add a bright white exit status for the last command
	PS1="$White\$? "
	# If it was successful, print a green check mark. Otherwise, print
	# a red X.
	if [[ $Last_Command == 0 ]]; then
		PS1+="$Green$Checkmark "
	else
		PS1+="$Red$FancyX "
	fi
	# If root, just print the host in red. Otherwise, print the current user
	# and host in green.
	if [[ $EUID == 0 ]]; then
		PS1+="$Red\\h "
	else
		PS1+="$Green\\u@\\h "
	fi
	# Print the working directory and prompt marker in blue, and reset
	# the text color to the default.
	PS1+="$Blue\\w \\\$$Reset "
}

PROMPT_COMMAND='set_prompt'

function search(){ 
    aura -Ss $1; aura -As $1;
}

function getGroups(){
    cut -d: -f1 /etc/group
}

function resetDhcp() { 
    sudo systemctl restart dhcpcd
}


 PATH="${PATH}:/home/orloc/bin:$(ruby -e 'puts Gem.user_dir')/bin:/usr/bin/vendor_perl:"
 PATH="${PATH}:/usr/bin"
 PATH="${PATH}:${GOPATH}/bin"
 PATH="${PATH}:${ANDROID_HOME}/tools"
 PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

source ~/.profile

