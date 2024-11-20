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
* add pacman color
* edit grubconfig to always show boot menu
  * edit `/etc/default/grub`
  * set `GRUB_TIMEOUT_STYLE=menu`
  * set `GROUP_TIMEOUT=3`
  * aktualisieren mit `sudo update-grub`
* docker: add user to group `docker` → `sudo usermod -aG docker $USER`
  * how to get user in ansible?
* docker: enable and start daemon
* merge this repo and the notes for setting up a new laptop?
* create a template for firefox desktop files and loop them

https://github.com/jothi-prasath/archlinux-playbook/tree/master is a nice playbook sample
