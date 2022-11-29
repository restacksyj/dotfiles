if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'bkad/CamelCaseMotion'
" Plug 'scrooloose/NERDTree'
Plug 'jiangmiao/auto-pairs'
" Plug 'sheerun/vim-polyglot'
" Plug 'neoclide/coc.nvim',{'branch':'release'}
" Plug 'ntk148v/vim-horizon'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'catppuccin/nvim', {'as': 'catppuccin'}
" Plug 'mhinz/vim-startify'
Plug 'mfussenegger/nvim-dap'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
if has("nvim")
   Plug 'kristijanhusak/defx-git'
   Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
   Plug 'kylechui/nvim-surround'
   Plug 'kristijanhusak/defx-icons'
   Plug 'nvim-lua/popup.nvim'
   Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
   Plug 'nvim-lua/plenary.nvim'
   Plug 'nvim-telescope/telescope.nvim'
   Plug 'nvim-lualine/lualine.nvim'
   Plug 'kyazdani42/nvim-web-devicons'
   Plug 'numToStr/Comment.nvim'
   Plug 'neovim/nvim-lspconfig'
endif
call plug#end()
lua require('Comment').setup()
