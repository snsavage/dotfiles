source /opt/homebrew/share/antigen/antigen.zsh
antigen init ~/.antigenrc

# Aliases
alias back="cd $(git rev-parse --show-toplevel)"
alias diff="/opt/homebrew/bin/diff --color --side-by-side"
alias dotfiles="cd ~/dotfiles && vim ."
alias lah="ls -lah"
alias oldvim="vim"
alias reload="source ~/.zshrc"
alias vi="nvim"
alias vim="nvim"

# Zsh Config
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'

# Exports
export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

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
