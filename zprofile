# Homebrew Setup
eval "$(/opt/homebrew/bin/brew shellenv)"

# Homebrew Completions
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
