#!/bin/bash -eux

install_devtools(){
  rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
  yum install -y vim-enhanced git hg zsh
  touch /home/vagrant/.zshrc
  wget --no-check-certificate http://install.ohmyz.sh -O - | sudo -i -u vagrant sh
  curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sudo -i -u vagrant sh
  git clone https://gist.github.com/3ab1720d332700cbf6e0.git /tmp/golang-vimrc
  sudo -i -u vagrant cp /tmp/golang-vimrc/.vimrc /home/vagrant/
  echo 'export GOPATH=$HOME' >> /home/vagrant/.zshrc
  echo 'export PATH=$PATH:$GOPATH/bin' >> /home/vagrant/.zshrc
  sudo -i -u vagrant zsh -c 'source ~/.zshrc; go get github.com/motemen/ghq'
  sudo -i -u vagrant zsh -c 'source ~/.zshrc; go get github.com/peco/peco/cmd/peco'
  cat <<EOT >> /home/vagrant/.zshrc
function peco-src () {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src
EOT
}

install_golang(){
  yum install -y golang
}

install_golang
install_devtools
