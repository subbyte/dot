#!/usr/bin/env sh

if [ -f /usr/bin/vim -a -f /usr/bin/git ]
then
    echo "Info: vim and git found."
elif [ -f /usr/bin/dnf ]
then
   sudo dnf -y install git vim-enhanced
elif [ -f /usr/bin/apt-get ]
then
   sudo apt-get -y install git vim
elif [ -f /usr/bin/pacman ]
then
   sudo pacman -S --noconfirm git vim
else
   echo "Error: unknown package management, please install vim and git manually."
   exit 1
fi

TMP_DIR=$(mktemp -d)
cd $TMP_DIR

git clone https://github.com/subbyte/dot.git
cd dot

# Setup bash
echo "1. setup bash/zsh/ksh"
rm -f ~/.bashrc
cp bashrc ~/.bashrc
rm -f ~/.zshrc
cp zshrc ~/.zshrc
rm -f ~/.kshrc
cp kshrc ~/.kshrc

# Setup vim
echo "2. setup vim"
rm -f ~/.vimrc
rm -rf ~/.vim
mkdir -p ~/.vim/pack/plugins/opt
cd ~/.vim/pack/plugins/opt
git clone https://github.com/preservim/nerdtree.git
git clone https://github.com/vim-airline/vim-airline.git
git clone https://github.com/vim-airline/vim-airline-themes.git
git clone https://github.com/joshdick/onedark.vim.git

cd $TMP_DIR/dot
cp vimrc ~/.vimrc

# Setup Pythonrc
echo "3. setup pythonrc"
cp pythonrc ~/.pythonrc

echo "#### Mission Accomplished ####"
