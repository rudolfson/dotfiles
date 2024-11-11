# my dotfiles

To install the dotfiles you clone the repository and use ansible to setup everything.

```bash
    ansible-galaxy collection install -r ansible/requirements.yml
    ansible-playbook -i ansible/inventory -K playbook.yml
```

## Improvements
* create a new play for installing software?
* create a template for firefox desktop files and loop them
* adjust swapfile

https://github.com/jothi-prasath/archlinux-playbook/tree/master is a nice playbook sample
