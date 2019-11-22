alias dir="ls -l"
alias ls="ls -ohF"
alias more="less"

if type pigz 2&>/dev/null; then
    alias gzip="pigz"
fi
