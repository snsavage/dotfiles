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


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases
alias df="cd ~/dotfiles && vim ."
