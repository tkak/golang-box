#!/bin/bash -eux

install_devtools(){
  rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
  yum install -y vim-enhanced git hg zsh
  touch /home/vagrant/.zshrc
  wget --no-check-certificate http://install.ohmyz.sh -O - | sudo -i -u vagrant sh

  ## vimrc
  curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sudo -i -u vagrant sh
  git clone https://gist.github.com/3ab1720d332700cbf6e0.git /tmp/golang-vimrc
  sudo -i -u vagrant cp /tmp/golang-vimrc/.vimrc /home/vagrant/

  ## GOPATH, ghq, peco
  echo 'export GOPATH=$HOME' >> /home/vagrant/.zshrc
  echo 'export PATH=$PATH:$GOPATH/bin' >> /home/vagrant/.zshrc
  sudo -i -u vagrant zsh -c 'source ~/.zshrc; go get github.com/motemen/ghq'
  sudo -i -u vagrant zsh -c 'source ~/.zshrc; go get github.com/peco/peco/cmd/peco'
  git clone https://gist.github.com/9d00b8adb339880c432f.git /tmp/zsh-peco
  sudo -i -u vagrant cat /tmp/zsh-peco/.zshrc.peco >> /home/vagrant/.zshrc
  sudo -i -u vagrant zsh -c 'git config --global ghq.root ~/src'
}

install_golang(){
  yum install -y golang
}

install_golang
install_devtools
