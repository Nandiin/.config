if &compatible
	set nocompatible
endif
set rtp+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein')
	call dein#begin('~/.vim/dein')

	""" Plugins

	call dein#add('Shougo/dein.vim')
	
	""""""""""""""""""""""""""""""""

	""" Plugins only support neovim 

	call dein#add('Shougo/denite.nvim', {'if': "has('nvim')"})
	call dein#add('Shougo/deoplete.nvim', {'if': "has('nvim')"})

	""""""""""""""""""""""""""""""""

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable
