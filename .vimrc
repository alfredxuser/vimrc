" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
" newbie, basing your first .vimrc on this file is a good choice.
" If you're a more advanced user, building your own .vimrc based
" on this file is still a good idea.


" Features {{{1

" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
filetype plugin on
filetype indent on
filetype on

" Enable syntax highlighting
syntax on
syntax enable

" Map leader key
let mapleader= ','


" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=3


" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>



" ==========================================
" Configurations added after the original vimrc taken from the website below
" https://vim.fandom.com/wiki/Example_vimrc

" No swapfile
set noswapfile

" Avoid <Esc> key
inoremap <leader>q <Esc>

" Relative numbers
set relativenumber

" Good scrolling
set scrolloff=10

" Syntax complete
set omnifunc=syntaxcomplete#Complete

" Support 256 colors
set t_Co=256

" Better tab
vnoremap < <gv
vnoremap > >gv

"PLACEHOLDERS
   "inoremap ;gui
   "inoremap <leader><leader> <Esc>/<++><CR>"_c4l
   "vnoremap <leader><leader> <Esc>/<++><CR>"_c4l
   "map <leader><leader> <Esc>/<++><CR>"_c4l

"AUTOCOMPLETE PARENTESIS, BRACKETS, ETC
   inoremap () ()<Esc>i
   inoremap (<CR> (<CR><Tab><CR>)<Esc>kA
   inoremap {} {}<Esc>i
   inoremap {<CR> {<CR><Tab><CR>}<Esc>kA
   inoremap [] []<Esc>i
   inoremap [<CR> [<CR><Tab><CR>]<Esc>kA
   inoremap <> <><Esc>i
   inoremap "" ""<Esc>i
   inoremap '' ''<Esc>i

  "Add placeholder after close
   inoremap <leader><leader> <Esc>/[)}"'\]>]<CR>:nohl<CR>a


" ===========================
" P L U G I N S
" ===========================

"Launch the plugins
   packloadall

"COLORSCHEME - pop punk
   "let g:terminal_ansi_colors = pop_punk#AnsiColors()
   let g:airline_section_c = '🎸 %F'
   colorscheme sky
   highlight Normal ctermbg=Black

"BROWSER RELOAD
   let g:returnAppFlag = 0

"AIRLINE FOR VIM
   let g:airline#extensions#tabline#enabled = 1
   let g:airline_powerline_fonts = 1

"ULTISNIPS - CUSTOM SNIPPET
   let g:UltiSnipsExpandTrigger="<TAB>"
   let g:UltiSnipsJumpForwardTrigger="<TAB>"
   let g:UltiSnipsJumpBackwardTrigger=",<TAB>"

"INDENT GUIDES
   let g:indentLine_char = '|'
   let g:indentLine_char_list = '|'
   let g:indentLine_first_char = '|'
   let g:indentLine_showFirstIndentLevel = 1

"VIM COMPLETES ME
   autocmd FileType vim let b:vcm_tab_complete = 'vim'
   autocmd FileType vim let g:vcm_omni_pattern = 'vim'

"PLACEHOLDERS
 "Example Placeholder Mappings
   if !has('nvim') && !has('gui_running')
       " allow M-h, M-l, and M-; to be mapped properly in term vim
       exe "set <m-p>=\<esc>p"
       exe "set <m-n>=\<esc>n"
       exe "set <m-.>=\<esc>."

       if exists(':tnoremap')
           " fix above maps in terminal mode
           tnoremap <m-p> <esc>p
           tnoremap <m-n> <esc>n
           tnoremap <m-.> <esc>.
       endif
   endif

   " M-h  =>  select prev placeholder
   imap <m-p> <c-g>u<esc>c<plug>(placeholderPrev)
   nmap <m-p> c<plug>(placeholderPrev)
   xmap <m-p> <plug>(placeholderPrev)
   omap <m-p> <plug>(placeholderPrev)

   " M-l  =>  select next placeholder
   imap <m-n> <c-g>u<esc>c<plug>(placeholderNext)
   nmap <m-n> c<plug>(placeholderNext)
   xmap <m-n> <plug>(placeholderNext)
   omap <m-n> <plug>(placeholderNext)

   " M-;  =>  insert placeholder
   imap <m-.> <plug>(placeholder)

   " Change the placeholder
   let g:placeholder#text = '~~~'
