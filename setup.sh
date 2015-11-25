# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install gcc git postgresql tmux

# pythonz
curl -kL https://raw.github.com/saghul/pythonz/master/pythonz-install | bash
pythonz install 2.7.10
sudo easy_install pip
sudo pip install virtualenv
sudo pip install virtualenvwrapper

VIM_BUNDLE_PATH=${HOME}/.vim/bundle
GITHUB_PATH=https://github.com

# install vim pathogen
mkdir -p "${HOME}/.vim/autoload" "${HOME}/.vim/bundle"
curl -LSso "${HOME}/.vim/autoload/pathogen.vim" https://tpo.pe/pathogen.vim

# get github repos
VIM_PKGS='
    bling/vim-airline 
    hdima/python-syntax 
    klen/python-mode 
    scrooloose/syntastic 
    scrooloose/nerdtree 
    tpope/vim-surround 
    vim-scripts/Align 
    voithos/vim-python-matchit 
    altercation/vim-colors-solarized 
'

for PKG in $VIM_PKGS; do 
    PKG_NAME=${PKG##*/}
    git clone "${GITHUB_PATH}/${PKG}" "${VIM_BUNDLE_PATH}/${PKG_NAME}"
done

# get oh-my-zsh
OH_MY_ZSH='robbyrussell/oh-my-zsh'
git clone "${GITHUB_PATH}/${OH_MY_ZSH}" "${HOME}/.oh-my-zsh"

DOTFILES_PATH=/Users/ng/src/dotfiles
ln -s "${DOTFILES_PATH}/.vimrc" "${HOME}/.vimrc"
ln -s "${DOTFILES_PATH}/.zshrc" "${HOME}/.zshrc"
ln -s "${DOTFILES_PATH}/.tmux.conf" "${HOME}/.tmux.conf"
