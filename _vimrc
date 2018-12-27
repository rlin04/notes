source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

cd C:\Users\richa\Dropbox\[vim]
:se autochdir

silent execute '!mkdir "'.$VIMRUNTIME.'/temp"'
silent execute '!del "'.$VIMRUNTIME.'/temp/*~"'
set backupdir=$VIMRUNTIME/temp//
set directory=$VIMRUNTIME/temp//

imap ;; <Esc>
nmap <C-J> <PageDown>
nmap <C-K> <PageUp>
nmap <C-H> 0
nmap <C-L> $
nmap <C-U> <C-R>

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

colorscheme torte

set number
set belloff=all

set nobackup
set nowritebackup
set noundofile
