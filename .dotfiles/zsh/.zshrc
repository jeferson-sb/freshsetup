# Use powerline
USE_POWERLINE="true"

# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi

# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# History
HISTFILE=~/.zhistory
HISTSIZE=1000000
SAVEHIST=1000000
setopt autocd
autoload -U compinit; compinit

ZSH_THEME="powerlevel10k/powerlevel10k"

# Autosuggestions with fzf
# source <(fzf --zsh)

plugins=(git)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## Add exports, aliases and functions from dotfiles
readonly DOTFILES="$HOME/.dotfiles/general"

for file in $DOTFILES/.{exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file
