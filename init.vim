call plug#begin("~/.vim/plugged")
  " Plugin Section
call plug#end()
"Config Section"
Plug 'dracula/vim'
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula