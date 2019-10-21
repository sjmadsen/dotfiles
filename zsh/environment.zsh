export PATH="$HOME/bin:$PATH"
export LESS=-eiMQRX
export VISUAL="subl -w"

if whence -p rbenv >/dev/null; then
    eval "$(rbenv init -)"
fi

if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    source /usr/local/opt/nvm/nvm.sh
fi
