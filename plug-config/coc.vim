"Establezca la codificación interna de vim, no es necesario en neovim, ya que coc.nvim usa algunos
"caracteres Unicode en el archivo autoload / float.vim
set encoding=utf-8

"TextEdit puede fallar si no se establece oculto.
set hidden

"Algunos servidores tienen problemas con los archivos de respaldo, consulte el n. ° 649.
set nobackup
set nowritebackup

"Dar más espacio para mostrar mensajes.
set cmdheight=2

"Tener un tiempo de actualización más largo (el valor predeterminado es 4000 ms = 4 s) genera
"retrasos y mala experiencia del usuario.
set updatetime=300

"No pase mensajes a | ins-complete-menu |.
set shortmess+=c

"Muestre siempre la columna del letrero; de lo contrario, el texto cambiaría cada vez
"Aparecen / se resuelven los diagnósticos.
if has("patch-8.1.1564")
   "Recientemente, vim puede fusionar columna de signo y columna de número en una
   set signcolumn=number
else
   set signcolumn=yes
endif

"Use la pestaña para completar el disparador con los caracteres adelante y navegue.
"NOTA: Utilice el comando ': verbose imap <tab>' para asegurarse de que la pestaña no esté asignada por
"otro complemento antes de poner esto en su configuración.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"Utilice <c-space> para activar la finalización.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

"Haga que <CR> seleccione automáticamente el primer elemento de finalización y notifique a coc.nvim
"al ingresar, <cr> podría reasignarse mediante otro complemento de vim
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"Utilice` [g` y `] g` para navegar por los diagnósticos
"Utilice`: CocDiagnostics` para obtener todos los diagnósticos del búfer actual en la lista de ubicaciones.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"Navegación de código GoTo.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"Resalte el símbolo y sus referencias cuando mantenga presionado el cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"Cambio de nombre de símbolo.
nmap <leader>rn <Plug>(coc-rename)

"Formateando el código seleccionado.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
   autocmd!
   "Configure los tipos de archivo especificados en formatexpr.
   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
   "Actualizar la ayuda de la firma en el marcador de posición de salto.
   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

"Aplicando codeAction a la región seleccionada.
"Ejemplo:` <leader> aap` para el párrafo actual
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

"Reasignar teclas para aplicar codeAction al búfer actual.
nmap <leader>ac  <Plug>(coc-codeaction)
"Aplicar AutoFix al problema en la línea actual.
nmap <leader>qf  <Plug>(coc-fix-current)

"Asignar función y objetos de texto de clase
"NOTA: Requiere compatibilidad con 'textDocument.documentSymbol' del servidor de idiomas.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

"Vuelva a asignar <C-f> y <C-b> para las ventanas / ventanas emergentes flotantes de desplazamiento.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

"Utilice CTRL-R para los rangos de selección.
"Requiere soporte 'textDocument / selectionRange' del servidor de idiomas.
nmap <silent> <C-r> <Plug>(coc-range-select)
xmap <silent> <C-r> <Plug>(coc-range-select)

"Agregar comando`: Format` para formatear el búffer actual.
command! -nargs=0 Format :call CocAction('format')

"Agregar`: comando Doblar` para doblar el búffer actual.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

"Agregar comando`: OR` para organizar las importaciones del búffer actual.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"Agregue el soporte de línea de estado nativo de (Neo) Vim.
"NOTA: consulte`: h coc-status` para las integraciones con complementos externos que
"proporcione una línea de estado personalizada: lightline.vim, vim-airlines.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"Asignaciones para CoCList
"Mostrar todos los diagnósticos.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

"Administrar extensiones.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>

"Mostrar comandos.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>

"Buscar símbolo del documento actual.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>

"Buscar símbolos del espacio de trabajo.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

"Realizar la acción predeterminada para el siguiente elemento.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>

"Realizar la acción predeterminada para el elemento anterior.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>

""Reanudar la última lista de coc.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
