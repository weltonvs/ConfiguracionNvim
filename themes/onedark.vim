" onedark.vim override: No establezca un color de fondo cuando se ejecuta en una terminal;
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " No se aplicará estilo a` bg` ya que no hay una configuración de `bg`
  augroup END
endif

hi Comment cterm=italic
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256

syntax on
colorscheme onedark


" comprueba si su terminal tiene soporte de color de 24 bits
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
