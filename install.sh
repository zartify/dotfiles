#!/bin/bash

# Make sure oh-my-zsh is installed
[ ! -d ~/.oh-my-zsh ] && sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install pure prompt
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

# Copy dotfiles to home folder
DOT_DIR="$HOME/dotfiles"
for dot in $(ls -ap $DOT_DIR | grep -v /); do
  dot_file="$(basename "$dot")"
    if [[ "$dot_file" == "install.sh" ]]; then
    continue
  fi

  cp $DOT_DIR/$dot_file $HOME/$dot_file
done

exec zsh
