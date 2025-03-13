# my dotfiles

To install the dotfiles you clone the repository and use ansible to setup
everything.

## Preparation

```sh
pacman -Su ansible-core
ansible-galaxy collection install -r ansible/requirements.yml
```

## Install / Update

The process is designed to be repeatable, so you can use it to initially
install everything or update all the stuff later on.

```sh
ansible-playbook -i ansible/inventory -v playbook.yml -t <work or private>
```

To run the swapfile setup use

```sh
    ansible-playbook -i ansible/inventory -v playbook.yml -t <work or private>,swap
```

## Improvements

* download dotfiles from github
* needs SSH keys for github to clone submodules
* oh-my-zsh needs an install first
* sdkman install
* nvm install
* install terraform 1.5.7

  ```shell
  curl -s https://releases.hashicorp.com/terraform/1.5.7/terraform_1.5.7_linux_amd64.zip | bsdtar -xf- -C $HOME/.local/bin`
  chmod u+x $HOME/.local/bin/terraform
  ```

* merge this repo and the notes for setting up a new laptop?
* create a template for firefox desktop files and loop them

<https://github.com/jothi-prasath/archlinux-playbook/tree/master> is a nice playbook sample

* add install of ducctl for work
