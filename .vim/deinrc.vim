if &compatible
    set nocompatible
endif
set rtp+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein')
    call dein#begin('~/.vim/dein')

    """ Plugins

    call dein#add('Shougo/dein.vim') " dein plugin manager
    call dein#add('keith/swift.vim') " Syntax and indent for Swift
    call dein#add('altercation/vim-colors-solarized') " solarized color scheme
    call dein#add('python-mode/python-mode') " python

    """"""""""""""""""""""""""""""""

    """ Plugins only support neovim 

    call dein#add('Shougo/denite.nvim', {'if': "has('nvim')"}) " Fuzzy searcher, more usages?
    call dein#add('Shougo/deoplete.nvim', {'if': "has('nvim')"}) " auto completion

    """"""""""""""""""""""""""""""""

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable
