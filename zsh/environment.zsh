unsetopt autopushd

if whence -p rbenv >/dev/null; then
    eval "$(rbenv init -)"
    if whence -p brew >/dev/null; then
        export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
    fi
fi

if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    source /usr/local/opt/nvm/nvm.sh
fi

if [ -d /opt/homebrew ]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

export PATH="$HOME/bin:$PATH"
export LESS=-eiMQRX
export EDITOR="code -w"
export VISUAL="$EDITOR"
