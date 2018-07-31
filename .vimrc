execute "set <M-J>=\ej"
execute "set <M-K>=\ek"
execute "set <M-H>=\eh"
execute "set <M-L>=\el"
execute "set <M-U>=\eu"

imap ;; <Esc>
nmap <M-J> <PageDown>
nmap <M-K> <PageUp>
nmap <M-H> 0
nmap <M-L> $
nmap <M-U> <C-R>

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
