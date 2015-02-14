#!/bin/sh# latest
brew update

# update all
brew upgrade

# add repository
#brew tap homebrew/binary
brew tap caskroom/cask
brew tap homebrew/dupes
brew tap peco/peco
brew tap sanemat/font

# fox X
brew cask install xquartz

# install packages
brew install apple-gcc42
brew install autoconf
brew install automake
brew install boost
brew install brew-cask
brew install bsdmake
brew install cmake
brew install colordiff
brew install cscope
brew install ctags
brew install fontconfig
brew install fontforge
brew install freetype
brew install git
brew install git-flow
brew install glib
brew install gnu-tar
brew install go --cross-compike-all
brew install gobject-introspection
brew install hub
brew install less
brew install libevent
brew install libffi
brew install libmpc
brew install libpng
brew install libtiff
brew install libtool
brew install libyaml
brew install lv
brew install markdown
brew install mongodb
brew install mysql
brew install nkf
brew install nmap
brew install nginx
brew install node
brew install openssl
brew install ossp-uuid
brew install peco
brew install pkg-config
brew install postgresql
brew install pyenv
brew install python
brew install pt
brew install rbenv
brew install readline
brew install reattach-to-user-namespace
brew install ricty
brew install ruby-build
brew install sqlite
brew install s3cmd
brew install tig
brew install tmux
brew install tree
brew install vim
brew install wget
brew install zsh
brew install zsh-completions
brew install docker
brew install boot2docker
brew install zlib

# brew cask
brew cask install --caskroom=/Applications google-chrome
brew cask install --caskroom=/Applications firefox
brew cask install alfred
brew cask install dash
brew cask install dropbox
brew cask install evernote
brew cask install google-japanese-ime
brew cask install google-drive
brew cask install hyperswitch
brew cask install iterm2
brew cask install skitch
brew cask install texturepacker
brew cask install wireshark
brew cask install hipchat
brew cask install magican
brew cask install appcode
brew cask install onyx
brew cask install diskwave
brew cask install shiftit
brew cask install macvim
brew cask install transmit
brew cask install 1password
brew cask install sourcetree
brew cask install skype
brew cask install karabiner
brew cask install bettertouchtool
brew cask install xtrafinder

# media player
#brew cask install blu-ray-player

# game
#brew cask install minecraft

# cleanup
brew cleanup
