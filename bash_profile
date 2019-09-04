for prefix in /usr/local /usr/local/apache /usr/local/aws /usr/local/sphinx $HOME; do
	if [ -d $prefix/bin ]; then
		PATH=$prefix/bin:$PATH
	fi
	if [ -d $prefix/sbin ]; then
		PATH=$prefix/sbin:$PATH
	fi
	if [ -d $prefix/man ]; then
		MANPATH=$prefix/man:$MANPATH
	fi
    if [ -d $prefix/share/man ]; then
        MANPATH=$prefix/share/man:$MANPATH
    fi
done

PATH=$PATH:/sbin:/usr/sbin
export PATH MANPATH

if [ -f $HOME/.bashrc ]; then
	. $HOME/.bashrc
fi

export LYNX_CFG=~/.lynx.cfg

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

case $TERM in
xterm*)
	if [[ "`uname`" =~ Darwin ]]; then
		export PS1="\[\033[1m\]\w\$(parse_git_branch)\\\$\[\033[0m\] "
	else
		export PS1="\[\033[1m\]\u@\H:\w\\\$\[\033[0m\] "
	fi
	export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
	;;

*)
	;;
esac

if [ "$EMACS" = "t" ]; then
	unset PROMPT_COMMAND
fi

export RI="--format ansi --width 75"

[ -f $HOME/.bash_profile_local ] && . $HOME/.bash_profile_local

stty -ixon

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -d $HOME/.nvm ]; then
	export NVM_DIR="$HOME/.nvm"
	. "/usr/local/opt/nvm/nvm.sh"
fi
