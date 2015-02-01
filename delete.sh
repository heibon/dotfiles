#!/usr/local/bin/zsh

dotfiles=(
  "_gvimrc .gvimrc"
  "_tigrc .tigrc"
  "_tmux.conf .tmux.conf"
  "_vimrc .vimrc"
  "_zprofile .zprofile"
  "_zshenv .zshenv"
  "_zshrc .zshrc"
  "_tmux-powerlinerc .tmux-powerlinerc"
)

echo "Starting delete of dotfiles......"
for ((i=0; ${#dotfiles[*]}>$i; i++))
  do
    tmp=(${dotfiles[$i]})
    # check
    #echo "Check File exists : ${tmp[1]}"
    if [ -e $HOME/${tmp[1]} ];then
      rm $HOME/${tmp[1]}
      echo "> Delete File : $HOME/${tmp[1]}"
  fi
  done
exit

rm -rf .vim/bundle/
