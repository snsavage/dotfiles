.PHONY: hello link brew

link:
	~/dotfiles/install --only link

brew:
	./scripts/homebrew_setup.sh

luajit:
	brew install luajit --HEAD
