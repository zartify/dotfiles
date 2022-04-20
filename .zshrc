# Brew
[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

#oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
COMPLETION_WAITING_DOTS="true"
plugins=(git ruby rails gem bundler brew vscode)
source $ZSH/oh-my-zsh.sh

#pure prompt
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

# Load Shopify zshrc defaults
if [ -n "$SPIN" ]; then
	source /etc/zsh/zshrc.default.inc.zsh
else
	# This properly initializes a cached gpg key for gpg-agent on Spin
	echo "GPG gunna GPG" | /opt/dev/bin/gpg-auto-pin --clearsign > /dev/null
fi