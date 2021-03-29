" Establecer tecla líder
let g:mapleader="\<space>"                " Tecla lider => espacio

" habilitar configuraciones básicas de NVim
syntax enable											        " Habilitar el resaltado de sintaxis.
set hidden												        " Requerido para mantener múltiples búferes abiertos.
"set wrap!													        " Mostrar líneas largas en varias líneas.
set encoding=utf-8							          " La codificación de texto en UTF-8.
set pumheight=10								          " Hace que el menú emergente sea más pequeño.
set fileencoding=utf-8					          " La codificación de texto en el archivo.
set ruler													        " Cómo se posiciona el cursor todo el tiempo
set cmdheight=2									          " Más espacio para mostrar mensajes
set iskeyword+=-									        " tratar las palabras separadas por guiones como un objeto de texto de palabra.
set mouse=a											          " Habilita el mouse.
set splitbelow										        " Las divisiones horizontales estarán automáticamente debajo.
set splitright										        " Las divisiones verticales estarán automáticamente a la derecha.
set t_Co=256										          " Soporta 256 colores.
set conceallevel=0							          " Para que pueda ver `` en archivos Markdown.
set tabstop=3									            " Insertar 3 espacios para una pestaña.
set shiftwidth=3								          " Cambiar el número de caracteres de espacio insertados para la sangría.
set smarttab											        " Hace que la tabulación sea más inteligente y se dará cuenta de que tiene 2 contra 4.
set expandtab											        " Convierte pestañas en espacios.
set smartindent										        " Hace que la sangría sea inteligente.
set autoindent										        " Sangría automática.
set laststatus=0								          " Mostrar siempre la línea de estado.
set number												        " Enumeración de las líneas de código.
set relativenumber                        " Enumeración relativa de las líneas.
set cursorline										        " Habilitar el resaltado de la línea actual.
set background=dark							          " Dile a vim cómo se ve el color de fondo.
set showtabline=2								          " Mostrar siempre las pestañas.
"set noshowmmode									        " Ya no necesitamos ver cosas como - INSERTAR -.
set nobackup											        " Esto es recomendado por coc.
set nowritebackup									        " Esto es recomendado por coc.
set updatetime=700							          " Finalización más rápida.
set timeoutlen=800							          " Por defecto, el tiempo de espera es 1000 ms.
set formatoptions-=cro						        " Detener la continuación de comentarios en la nueva línea.
set clipboard=unnamedplus				          " Copiar y pegar entre vim y todo lo demás.
"set autochdir										        " Su directorio de trabajo siempre será el mismo que su directorio de trabajo.
set inccommand=split                          " Mostrar en una ventana (split) solamente la parte de las palabras seleccionada.
au! BufWritePost $MYVIMRC source %        " fuente automática al escribir en init.vm alternativamente puede ejecutar: fuente $ MYVIMRC.

