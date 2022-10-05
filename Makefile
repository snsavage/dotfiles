DOTFILES_DIR = "${HOME}/dotfiles"

# TODO:
# Split between installations, configurations, and updates?
# reload shell at the end?

.PHONY: all
all: brew fzf git link luajit macos tmux asdf-plugins

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

.PHONY: link
link:
	~/dotfiles/install --only link

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
