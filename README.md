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
* oh-my-zsh needs an install first
* system monitor status
* sdkman install
* merge this repo and the notes for setting up a new laptop?
* create a template for firefox desktop files and loop them

https://github.com/jothi-prasath/archlinux-playbook/tree/master is a nice playbook sample
