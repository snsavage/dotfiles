SHELL := /bin/bash

.PHONY: all
all: brew fzf git link luajit macos tmux install-asdf

.PHONY: test-config
test-config:
	xdg-ninja

.PHONY: stow
stow:
	stow alacritty
	stow antigen
	stow asdf
	stow bat
	stow cursor
	stow direnv
	stow dlv
	stow editorconfig
	stow gh
	stow git
	stow herdr
	stow lazygit
	stow nvim
	stow kickstart-nvim
	stow process-compose
	stow rectangle
	stow ripgrep
	stow starship
	stow tmux
	stow vim
	stow zsh

.PHONY: brew-check
brew-check:
	command -v brew || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

.PHONY: brew
brew: brew-check
	brew update
	brew upgrade
	brew bundle --file ./Brewfile

# More Info: https://gist.github.com/ChristopherA/a579274536aab36ea9966f301ff14f3f
.PHONY: brewfile
brewfile: brew-check
	brew bundle dump --force

.PHONY: fzf
fzf:
	$$(brew --prefix)/opt/fzf/install --all

.PHONY: git
git:
	./scripts/git_config_setup.sh

.PHONY: luajit
luajit:
	brew install luajit --HEAD

.PHONY: defaults
defaults:
	./scripts/defaults_config.sh

.PHONY: tmux
tmux:
	./scripts/tmux_plugin_manager_setup.sh

.PHONY: install-asdf
install-asdf:
	command -v asdf || brew install asdf

# vim-herdr-navigation: ctrl+h/j/k/l across nvim splits and herdr panes.
# Pinned to a reviewed commit rather than a branch — `--ref` needs the full
# 40-char SHA, an abbreviated one fails with "couldn't find remote ref".
# Bump the SHA deliberately after reviewing the diff; the keybindings live in
# herdr/.config/herdr/config.toml.
.PHONY: herdr
herdr:
	herdr plugin install paulbkim-dev/vim-herdr-navigation \
		--ref 79679dacc791f70fc34de8b29a3cf9706c0f5b2f -y

.PHONY: gobin
gobin:
	mkdir -p ~/go/bin

.PHONY: golang
golang: gobin
	go install golang.org/x/tools/gopls@latest          # LSP
	go install github.com/go-delve/delve/cmd/dlv@latest # Debugger
	go install golang.org/x/tools/cmd/goimports@latest  # Formatter
