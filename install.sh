if [[ `whoami` = "root" ]]; then
  echo "Do not run as root"
  exit 1
fi

# oh-my-zsh
zsh --version
if [ "$?" -eq "0" ]; then
    echo "Installing oh-my-zsh"
    if [ -d ~/.oh-my-zsh ]; then
        echo "oh-my-zsh already installed"
    else
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi

    if [ -f ~/.zshrc ]; then
      echo .zshrc exists, moving to .zshrc.old
      mv ~/.zshrc ~/.zshrc.old 
    fi

    cp .zshrc ~/.zshrc
    cp louis.zsh-theme ~/.oh-my-zsh/themes/
else
    echo "ZSH is not installed, skipping oh-my-zsh installation"
fi

# VIM
echo Downloading colorschemes
git clone https://github.com/flazz/vim-colorschemes.git vim
echo Downloading Plug
curl -fLo vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir ~/.vim
cp -R vim/*  ~/.vim

if [ -f ~/.vimrc ]; then
  echo .vimrc exists, moving to .vimrc.old
  mv ~/.vimrc ~/.vimrc.old 
fi

cp .vimrc ~/.vimrc

echo Installing Plug plugins
vim +PlugInstall +qall

if [ -f ~/.tmux.conf ]; then
  echo .tmux.conf exists, moving to .tmux.conf.old
  mv ~/.tmux.conf ~/.tmux.conf.old 
fi

cp tmux.conf ~/.tmux.conf

echo Done
