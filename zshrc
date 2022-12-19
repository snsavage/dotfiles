source /opt/homebrew/share/antigen/antigen.zsh
antigen init ~/.antigenrc

# Aliases
alias back=back_to_git_root
alias diff="/opt/homebrew/bin/diff --color --side-by-side"
alias dotfiles="cd ~/dotfiles && vim ."
alias lah="ls -lah"
alias oldvim="vim"
alias reload="source ~/.zshrc"
alias savage='git grep -EI "SAVAGE"'
alias todo='git grep -EI "TODO"'
alias vi="nvim"
alias vim="nvim"

# Zsh Config
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'

# Exports
export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"


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

ulimit -n 10000

# FZF Setup
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

eval "$(direnv hook zsh)"

# Enable vi mode
bindkey -v

# Kubectl Contexts
# export KUBECONFIG="$(~/dotfiles/scripts/load-k8s-configs.sh)"
export KUBECONFIG=/Users/scott.savage/.kube/config

# Tmux
_not_inside_tmux() { [[ -z "$TMUX" ]] }

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    ~/dotfiles/tmux/tat.sh
  fi
}

ensure_tmux_is_running

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/opt/gnu-getopt/bin:$PATH"
