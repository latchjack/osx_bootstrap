#!/usr/bin/env bash
set -e

if [ ! -x /usr/local/bin/brew ]
then
    echo "Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Homebrew already installed, checking for updates"
    brew update
fi

echo "Installing brew packages"
brew bundle

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

rm ~/.zshrc
cp ./.zshrc ~/.zshrc
cp ./.tetris_aliases ~/.tetris_aliases

echo "Installing NVM"
mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

"UseKeychain yes" > ~/.ssh/config

ln -s ./.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
