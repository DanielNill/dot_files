#!/bin/bash

echo "installing homebrew"
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "installing homebrew packages"
brew install bash bash-completion fzf git rbenv ruby-build the_silver_searcher vim

# copy over files via symlink
echo "linking config files"
ln -s .bash_profile ~/.bash_profile
ln -s .gitconfig ~/.gitconfig
ln -s .gitignore ~/.gitignore
ln -s .vimrc ~/.vimrc

# install vim plugins
echo "installing vim plugins"
mkdir -p ~/.vim/bundle
git clone git@github.com:rking/ag.vim.git ~/.vim/bundle/ag
git clone git@github.com:junegunn/fzf.vim.git ~/.vim/bundle/fzf
git clone git@github.com:mustache/vim-mustache-handlebars.git ~/.vim/bundle/mustache
git clone git@github.com:scrooloose/nerdcommenter.git ~/.vim/bundle/nerdcommenter
git clone git@github.com:scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone git@github.com:ervandew/supertab.git ~/.vim/bundle/supertab
git clone git@github.com:godlygeek/tabular.git ~/.vim/bundle/tabular
git clone git@github.com:kchmck/vim-coffee-script.git ~/.vim/bundle/vim-coffee-script
git clone git@github.com:tpope/vim-fugitive.git ~/.vim/bundle/fugitive
git clone git@github.com:fatih/vim-go.git ~/.vim/bundle/vim-go
git clone git@github.com:tpope/vim-rhubarb.git ~/.vim/bundle/vim-rhubarb
git clone git@github.com:vim-ruby/vim-ruby.git ~/.vim/bundle/vim-ruby
git clone git@github.com:slim-template/vim-slim.git ~/.vim/bundle/vim-slim

# setup solarized
echo "setting up solarized"
git clone git@github.com:tomislav/osx-terminal.app-colors-solarized.git ~/osx-terminal.app-colors-solarized
echo "Open terminal preferences, import the solarized dark profile and set it to default"
