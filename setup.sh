#!/bin/zsh -e

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install gcc git giter8 postgresql sbt tmux

VIM_BUNDLE_PATH=${HOME}/.vim/bundle
VIM_AUTOLOAD_PATH=${HOME}/.vim/autoload

# install vim pathogen
mkdir -p ${VIM_AUTOLOAD_PATH} ${VIM_BUNDLE_PATH}
curl -LSso "${VIM_AUTOLOAD_PATH}/pathogen.vim" https://tpo.pe/pathogen.vim

# get github repos
VIM_PKGS=(
    bling/vim-airline 
    hdima/python-syntax 
    klen/python-mode 
    scrooloose/syntastic 
    scrooloose/nerdtree 
    tpope/vim-surround 
    vim-scripts/Align 
    voithos/vim-python-matchit 
    altercation/vim-colors-solarized 
)

GITHUB_URL=https://github.com
for PKG in $VIM_PKGS; do 
    PKG_NAME=${PKG##*/}
    git clone "${GITHUB_URL}/${PKG}" "${VIM_BUNDLE_PATH}/${PKG_NAME}"
done

# get oh-my-zsh
OH_MY_ZSH_REPO='robbyrussell/oh-my-zsh.git'
git clone "${GITHUB_URL}/${OH_MY_ZSH_REPO}" "${HOME}/.oh-my-zsh"

DOTFILES_PATH=/Users/ng/src/dotfiles
DOTFILES=(
    .vimrc 
    .tmux.conf 
    .zshrc
)

for DOTFILE in $DOTFILES; do
    TARGET_PATH=${HOME}/${DOTFILE}
    ln -s "${DOTFILES_PATH}/${DOTFILE}" ${TARGET_PATH}
done

# pythonz
curl -kL https://raw.github.com/saghul/pythonz/master/pythonz-install | bash
ZSHRC_PATH=${TARGET_PATH}
source ${ZSHRC_PATH}
pythonz install 2.7.10
sudo easy_install pip
sudo pip install virtualenv
sudo pip install virtualenvwrapper
