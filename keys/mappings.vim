" Insertar punto y coma al final de cada línea
nnoremap <leader>; A;<esc>

" Mejor navegación para omnicompleto
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl para cambiar el tamaño de las ventanas
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Odio escapar más que cualquier otra cosa
inoremap jk <Esc>
inoremap kj <Esc>

" MAYÚSCULAS fáciles
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB en el modo general se moverá al búfer de texto
nnoremap <TAB> :bnext<CR>

"SHIFT-TAB volverá
nnoremap <S-TAB> :bprevious<CR>

"Forma alternativa de guardar (CTRL+s)
nnoremap <C-s> :w<CR>

" Forma alternativa de salir (CTRL+Q)
nnoremap <C-Q> :wq!<CR>

" Use (CTRL+c) en lugar de escape
nnoremap <C-c> <Esc>

" Use (TAB) para completar
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

"Mejor tabulación (<) hacia atrás y (>) hacia adelante
vnoremap < <gv
vnoremap > >gv

" Mejor navegación por la ventana
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>o o<Esc>^Da
nnoremap <leader>O O<Esc>^Da

" Resetear el Vim despues de instalar algo
nnoremap <leader>r :source ~/.config/nvim/init.vim<cr>
