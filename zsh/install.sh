#!/bin/sh

install -d ~/.oh-my-zsh/custom/themes
install -SC -m 0644 oh-my-zsh.sh ~/.oh-my-zsh
install -SC -m 0644 *.zsh ~/.oh-my-zsh/custom
install -SC -m 0644 *.zsh-theme ~/.oh-my-zsh/custom/themes
