" display line numbers
set number

" set colors
set t_Co=256
colors zenburn

" enable markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" enable ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

