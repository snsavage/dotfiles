export STARSHIP_CONFIG=~/.starship.toml
eval "$(starship init zsh)"

export FZF_DEFAULT_COMMAND='rg --files'


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

