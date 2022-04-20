#!/bin/bash

# Make sure oh-my-zsh is installed
[ ! -d ~/.oh-my-zsh ] && sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Set dot file directory for spin or local

[[ -n $SPIN ]] && DOT_DIR="$HOME/dotfiles" || DOT_DIR="$HOME/dev-stuff/dotfiles"

# Copy dotfiles to home folder
for dot in $(ls -ap $DOT_DIR | grep -v /); do
  dot_file="$(basename "$dot")"
  target_file=$HOME/$dot_file

  [[ "$dot_file" == "install.sh" ]] && continue

  echo "Installing $dot_file..."
  [[ -f "$target_file" ]] && mv "$target_file" "$target_file.bak"
  cp $DOT_DIR/$dot_file $HOME/$dot_file
done

exec zsh
