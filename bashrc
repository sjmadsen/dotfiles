# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

for d in /opt/local/ /usr/local/ /; do
	if [  -f ${d}etc/bash_completion ]; then
		. ${d}etc/bash_completion
		break
	fi
done

if [ "$PS1" ]; then
    alias be='bundle exec'
	alias df='df -h'
	alias dir='ls -oh'
	alias du='du -h'
	alias ls='LC_COLLATE="C" ls -F'
	alias pry-rails='pry -r ./config/environment'
	alias scp='scp -p'
	alias unzip='unzip -L'

	if type joe >/dev/null 2>&1; then
		export EDITOR=joe
	fi

	case $OSTYPE in
	cygwin*)
		export EDITOR=notepad
		export TERM=xterm
		unalias ftp
		;;

	darwin*)
		alias top='top -ocpu -O+rsize'
		alias subl='subl -n'
		export EDITOR='subl -nw'
		export TM_GIT=`which git`
		export PGHOST=/tmp
		;;

	freebsd*)
		unalias grep
		export MANPATH=/usr/share/man:$MANPATH
		;;

	solaris2*)
		export MANPATH=/usr/share/man:$MANPATH
		;;
	esac

	if type zgrep >/dev/null 2>&1; then
		alias grep='zgrep'
	fi

	if type less >/dev/null 2>&1; then
		alias more=less
		export LESS="-eiMQXR"
		type -path lessfile >/dev/null && eval $(lessfile)
	fi

	export VISUAL=$EDITOR

	if type pigz >/dev/null 2>&1; then
		alias gzip=pigz
	fi
fi
