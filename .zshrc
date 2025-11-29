autoload -Uz compinit
compinit

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt append_history
setopt share_history
setopt inc_append_history
setopt hist_ignore_dups
setopt hist_ignore_space


if [ -f ~/.cache/wal/sequences ]; then
	cat ~/.cache/wal/sequences
fi

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.txt

eval "$(starship init zsh)"

fastfetch --kitty-direct /home/kyyneda/Pictures/suguru_geto.png

alias moosync='/usr/bin/moosync'

wal -R
