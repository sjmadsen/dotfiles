export PATH="$HOME/bin:$PATH"
export LESS=-eiMQRX
export VISUAL="subl -w"

if whence -p rbenv >/dev/null; then
    eval "$(rbenv init -)"
fi
