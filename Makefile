SHELL := /bin/bash

# TODO: Remove these.
HOME := "${HOME}"

.PHONY: all
all: brew fzf git link luajit macos tmux asdf-plugins

.PHONY: test-config
test-config:
	xdg-ninja

.PHONY: list-config
list-config:
	@eza -lah --icons --group-directories-first $(HOME)/.config/

.PHONY: stow
stow:
	stow alacritty
	stow antigen
	stow asdf
	stow bat
	stow direnv
	stow dlv
	stow editorconfig
	stow git
	stow lazygit
	stow nvim
	stow tmux
	stow vim

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

.PHONY: macos
macos:
	./scripts/macos_config.sh

.PHONY: tmux
tmux:
	./scripts/tmux_plugin_manager_setup.sh

.PHONY: asdf-plugins
asdf-plugins:
	cut -d ' ' -f1 tool-versions | xargs -i asdf plugin add {}

.PHONY: gobin
gobin:
	mkdir -p ~/go/bin

.PHONY: golang
golang: gobin
	go install golang.org/x/tools/gopls@latest          # LSP
	go install github.com/go-delve/delve/cmd/dlv@latest # Debugger
	go install golang.org/x/tools/cmd/goimports@latest  # Formatter
