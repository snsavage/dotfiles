# Path to your oh-my-zsh installation.
export ZSH="$HOME/dotfiles/oh-my-zsh"

plugins=(
    asdf
    colored-man-pages
    git
    helm
    kubectl
    terraform
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias dotfiles="cd ~/dotfiles && vim ."
alias back="cd $(git rev-parse --show-toplevel)"

# Starship.rs Setup
export STARSHIP_CONFIG=~/.starship.toml
eval "$(starship init zsh)"

if [ -f ~/.zshrc_local ]; then
    echo "Sourcing local zshrc"
    source ~/.zshrc_local
else
    echo "No local zshrc found."
fi

# FZF Setup
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

# Aliases
alias df="cd ~/dotfiles && vim ."
alias diff="/opt/homebrew/bin/diff --color --side-by-side"
alias lah="ls -lah"
alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"

eval "$(direnv hook zsh)"

# Enable vi mode
bindkey -v

# Tmux
_not_inside_tmux() { [[ -z "$TMUX" ]] }

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    ~/dotfiles/tmux/tat.sh
  fi
}

ensure_tmux_is_running

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
