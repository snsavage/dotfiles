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
alias back=back_to_git_root
alias dotfiles="cd ~/dotfiles && vim ."
alias lah="ls -lah"

back_to_git_root() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        cd $(git rev-parse --show-toplevel)
    fi
}

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
