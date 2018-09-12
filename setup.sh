#!/usr/local/bin/zsh

BUNDLER=~/.vim/bundle

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
  "_ideavimrc .ideavimrc"
  "_gitconfig .gitconfig"
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
    echo "> Symbolic Link : $HOME/dotfiles/setupfiles/${tmp[0]} -> $HOME/${tmp[1]}"
    rm $HOME/${tmp[1]}
    ln -s $HOME/dotfiles/setupfiles/${tmp[0]} $HOME/${tmp[1]}
  done

git clone https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim
cd ~/.vim/bundle/vimproc.vim
make
cd ~/dotfiles
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > /tmp/install.sh
sh /tmp/install.sh
rm /tmp/install.sh
~/.vim/bundle/neobundle.vim/bin/neoinstall
#mkdir -p ~/.vim/bundle
#git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
echo "The end of a setting of dotfiles."

echo "Starting setting of tmux-powerline......"
git submodule update --init
echo "The end of a cloning tmux-powerline"

echo "All setting is done. run vim and type Yes to install plugins by NeoBundle"

exit
