#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Make Workspace
	mkdir -p ~/Workspace/bin ~/Workspace/dev ~/Workspace/git ~/Workspace/tmp ~/.config/nvim

	# Install Brew & things
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew doctor
	brew update
	brew bundle
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	# Install ZSH
	brew install zsh

	# Launch ZSH
	zsh

	# Clone prezto
	git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

	# Make Configuration files
	setopt EXTENDED_GLOB
	for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
		ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
	done

	# Change default shell
	sudo chsh -s /bin/zsh

	# Link things
	ln -s @/.zshrc ~/.zshrc
	ln -s @/.zpreztorc ~/.zpreztorc
	ln -s @/.tmux.conf ~/.tmux.conf
	ln -s @/init.vim ~/.config/nvim/init.vim

else
	# WIP
fi
