# my dotfiles

To install the dotfiles you clone the repository and use ansible to setup everything.

```shell
    ansible-galaxy collection install -r ansible/requirements.yml
    ansible-playbook -i ansible/inventory -v playbook.yml
```

To skip the swapfile setup use

```shell
    ansible-playbook -i ansible/inventory -v --skip-tags swap playbook.yml
```

## Improvements
* commands to install ansible-core
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
* tag items with `work` or `private` where applicable

https://github.com/jothi-prasath/archlinux-playbook/tree/master is a nice playbook sample
