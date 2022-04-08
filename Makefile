DOTFILES_DIR = "${HOME}/dotfiles"

# TODO:
# Split between installations, configurations, and updates?
# reload shell at the end?

.PHONY: all
all: brew fzf git link luajit macos tmux

brew:
	echo "Install and update Homebrew.  Install Brewfile packages."
	./scripts/homebrew_setup.sh

fzf:
	echo "Install fzf key bindings and fuzzy completion"
	$$(brew --prefix)/opt/fzf/install --all

git:
	echo "Ensure that git user name and email are configured."
	./scripts/git_config_setup.sh

link:
	echo "Symlinking dotfiles."
	~/dotfiles/install --only link

luajit:
	echo "Installing luajit"
	brew install luajit --HEAD

macos:
	echo "Configuring macOS settings"
	./scripts/macos_config.sh

tmux:
	echo "Install TMUX plugin manager and manage plugins"
	./scripts/tmux_plugin_manager_setup.sh

