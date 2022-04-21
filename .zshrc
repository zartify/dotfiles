# Brew
[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)


if [[ -z $SPIN ]]; then
   # Dev stuff
  export PATH=/usr/local/share/npm/bin:$PATH
  export PATH="/usr/local/opt/ruby/bin:$PATH"
  export PATH="/usr/local/share/chruby:$PATH"
  export PATH="/usr/bin/rails:$PATH"

  source "/opt/dev/dev.sh"

  if [ -e /Users/jesseschroder/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/jesseschroder/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
  [[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }

  # Syntax highlighting
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  # Syntax highlighting
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

#oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
COMPLETION_WAITING_DOTS="true"
plugins=(git ruby rails gem bundler brew vscode)

source $ZSH/oh-my-zsh.sh

# Theme
source $HOME/.zshrc_theme
