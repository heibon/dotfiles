#!/usr/local/bin/zsh


# dotfiles
dotfiles=(
  "_gvimrc .gvimrc"
  "_tigrc .tigrc"
  "_tmux.conf .tmux.conf"
  "_vimrc .vimrc"
  "_zprofile .zprofile"
  "_zshenv .zshenv"
  "_zshrc .zshrc"
  "_tmux-powerlinerc .tmux-powerlinerc"
  "_vrapperrc .vrapperrc"
)

echo "Starting setting of dotfiles......"
for ((i=0; ${#dotfiles[*]}>$i; i++))
  do
    tmp=(${dotfiles[$i]})
    # check
    #echo "Check File exists : ${tmp[1]}"
    if [ -e $HOME/${tmp[1]} ];then
      rm $HOME/${tmp[1]}
      echo "> Delete File : $HOME/${tmp[1]}"
    fi
    # Symbolic Link
    echo "> Symbolic Link : $HOME/dotfiles/${tmp[0]} -> $HOME/${tmp[1]}"
    ln -s $HOME/dotfiles/${tmp[0]} $HOME/${tmp[1]}
  done

mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
echo "The end of a setting of dotfiles."

echo "The clone start XVim plugin ......."
mkdir -p ~/dev/tools
git clone git@github.com:XVimProject/XVim.git ~/dev/tools/XVim
echo "The clone end XVim plugin"

echo "Starting setting of tmux-powerline......"
git submodule update --init
echo "The end of a cloning tmux-powerline"

echo "All setting is done. run vim and type Yes to install plugins by NeoBundle"

exit
