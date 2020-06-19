#!/usr/bin/env bash

# prepare compilation environment
if [ -f /usr/bin/yum ]
then
   sudo yum -y install git vim-enhanced
elif [ -f /usr/bin/apt-get ]
then
   sudo apt-get -y install git vim
elif [ -f /usr/bin/pacman ]
then
   sudo apt-get -y install git vim
else
   echo "Err: package management system not supported."
fi

TMP_DIR=$(mktemp -d)
cd $TMP_DIR

git clone https://github.com/subbyte/configurations.git
cd configurations

# Setup urxvt color
echo "1. setup terminal color"
cp urxvt/Xresources ~/.Xresources

# Setup bash
echo "2. setup bash"
cp bash/bashrc ~/.bashrc
cp bash/bashrc_basic ~/.bashrc_basic
cp bash/bash_aliases_basic ~/.bash_aliases_basic

# Setup vim
echo "3. setup vim"
rm -rf ~/.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree > /dev/null 2>&1
git clone https://github.com/preservim/nerdcommenter.git ~/.vim/bundle/nerdcommenter > /dev/null 2>&1
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline > /dev/null 2>&1
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes > /dev/null 2>&1
cp -r vim/colors ~/.vim/

# Setup Pythonrc
echo "4. setup pythonrc"
cp python/pythonrc ~/.pythonrc

echo "#### Mission Accomplished ####"
