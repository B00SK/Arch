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

source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.txt

eval "$(starship init zsh)"

fastfetch --logo /home/kyyneda/.config/fastfetch/assets/feitan_phone.jpg --logo-type kitty --logo-width 27 --logo-height 15
alias fastfetch="fastfetch --logo /home/kyyneda/.config/fastfetch/assets/feitan_phone.jpg --logo-type kitty --logo-width 27 --logo-height 15"

alias moosync='/usr/bin/moosync'

# SSH agent
eval $(keychain --eval --quiet ~/.ssh/id_ed25519)

wal -Rq
eval "$(starship init zsh)"
