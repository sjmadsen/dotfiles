alias dir="ls -o"
alias ls="ls -hF"
alias more="less"

if type pigz >/dev/null; then
    alias gzip="pigz"
fi
