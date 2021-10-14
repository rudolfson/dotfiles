# my dotfiles

To install the dotfiles you clone the repository and use ansible to setup
everything.

```bash
    ansible-playbook playbook.yml
```

## Improvements
* loop through files in `bin`
* create a template for firefox desktop files and loop them