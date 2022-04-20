# Brew
[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

# Dev stuff
if [[ -z $SPIN ]]; then
   
  export PATH=/usr/local/share/npm/bin:$PATH
  export PATH="/usr/local/opt/ruby/bin:$PATH"
  export PATH="/usr/local/share/chruby:$PATH"
  export PATH="/usr/bin/rails:$PATH"

  source "/opt/dev/dev.sh"

  if [ -e /Users/jesseschroder/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/jesseschroder/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
  [[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }

  # Syntax highlighting
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

#oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
# export ZSH_THEME="gentoo"
COMPLETION_WAITING_DOTS="true"
plugins=(git ruby rails gem bundler brew vscode)

source $ZSH/oh-my-zsh.sh

# Theme
source $HOME/.zshrc_theme



# Load Shopify zshrc defaults
# if [ -n "$SPIN" ]; then
# 	source /etc/zsh/zshrc.default.inc.zsh
# else
# 	# This properly initializes a cached gpg key for gpg-agent on Spin
# 	echo "GPG gunna GPG" | /opt/dev/bin/gpg-auto-pin --clearsign > /dev/null
# fi