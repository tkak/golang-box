Golang Box
==========

Packer template to prepare Golang development environment

## Description

You can easily setup Golang development environment by the following procedure.

Create Vagrantfile:

```
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define :node do |node|
    node.vm.box = "tkak/centos-7.0-x86_64-golang"
  end

end
```

Boot VM and SSH login:

```
$ vagrant up
$ vagrant ssh
```

Start Golang development:

```
i.g.)
$ zsh  ## If you want to use zsh
```


## Environment

|Box                     |OS               |Tools                                                       |
|------------------------|-----------------|------------------------------------------------------------|
|centos-7.0-x86_64-golang|CentOS 7.0 x86_64|golang, git, vim + vim-bootstrap, zsh + oh-my-zsh, ghq, peco|


## Requirement

* Virtual Box
* Vagrant
* Packer


## How to make a box image

Make a vagrant box image by using Packer:

```
$ git clone git@github.com:tkak/golang-box.git
$ cd packer
$ packer build centos-7.0-x86_64.json
$ vagrant box add centos-7.0-x86_64-golang ../builds/virtualbox/centos-7.0-x86_64-golang.box
$ vagrant box list
```


## References

* [Golang](https://golang.org/)
* [Packer](http://www.packer.io/)
* [Bento](https://github.com/opscode/bento)
* [vim-bootstrap](https://github.com/avelino/vim-bootstrap)
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* [ghq](https://github.com/motemen/ghq)
* [peco](https://github.com/peco/peco)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Run style checks and RSpec tests (`bundle exec rake`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request

