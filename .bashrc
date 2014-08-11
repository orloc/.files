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
