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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

# Aliases
alias df="cd ~/dotfiles && vim ."

eval "$(direnv hook zsh)"

