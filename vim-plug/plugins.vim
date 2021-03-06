" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
   " Better Syntax Support
   Plug 'sheerun/vim-polyglot'
   " File Explorer
   Plug 'scrooloose/NERDTree'
   " Auto pairs for '(' '[' '{'
   Plug 'jiangmiao/auto-pairs'
   " Thema onedark
   Plug 'joshdick/onedark.vim'
   " Multicursor
   Plug 'terryma/vim-multiple-cursors'   
   " Intellicense
   Plug 'neoclide/coc.nvim', {'branch': 'release'}
   " Barra de indicación vim-airliner
   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'
   " Ranger dentro de VIM
   Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
