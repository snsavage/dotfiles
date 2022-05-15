DOTFILES_DIR = "${HOME}/dotfiles"

# TODO:
# Split between installations, configurations, and updates?
# reload shell at the end?

.PHONY: all brewfile
all: brew fzf git link luajit macos tmux

brew-check:
	command -v brew || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

brew: brew-check
	brew update
	brew upgrade
	brew bundle --file ./Brewfile

# More Info: https://gist.github.com/ChristopherA/a579274536aab36ea9966f301ff14f3f
brewfile: brew-check
	brew bundle dump --force

fzf:
	$$(brew --prefix)/opt/fzf/install --all

git:
	./scripts/git_config_setup.sh

link:
	~/dotfiles/install --only link

luajit:
	brew install luajit --HEAD

macos:
	./scripts/macos_config.sh

tmux:
	./scripts/tmux_plugin_manager_setup.sh

