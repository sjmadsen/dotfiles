unsetopt autopushd

if [ -d /opt/homebrew ]; then
    PATH="/opt/homebrew/bin:$PATH"
fi

if [[ -n "$(echo /opt/homebrew/Cellar/postgresql@*)" ]]; then
    for (( pg_version = $(date +%y) - 7; pg_version > 0; pg_version -= 1 )); do
        if [[ -d /opt/homebrew/opt/postgresql@${pg_version}/bin ]]; then
            PATH="/opt/homebrew/opt/postgresql@${pg_version}/bin:$PATH"
            break
        fi
    done
fi

if [ -d "$HOME/go" ]; then
    PATH="$HOME/go/bin:$PATH"
fi

export PATH="$HOME/bin:$PATH"
export LESS=-eiMQRX
export EDITOR="code -w"
export VISUAL="$EDITOR"

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
