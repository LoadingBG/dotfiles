"""" Setup for: WSL - Ubuntu 20.04

""" Vim-plug plug-ins
call plug#begin('~/.vim/bundle') " Initialize Vim-plug

" Vim-plug plug-ins below
"Plug 'loadingbg/vimcord', { 'branch': 'testings' } " Discord rich presence

Plug 'neoclide/coc.nvim', { 'branch': 'release' } " Plugin manager and LSP
" coc extensions: coc-marketplace, coc-pairs, coc-snippets, coc-vimlsp,
" coc-clangd, coc-java, coc-json, coc-xml
Plug 'nathanaelkane/vim-indent-guides' " Indentation guides
Plug 'luochen1990/rainbow' " Rainbow parentheses
Plug 'preservim/nerdtree' " File explorer

Plug 'rakr/vim-one' " Color scheme
Plug 'vim-airline/vim-airline' " Custom status bar

Plug 'octol/vim-cpp-enhanced-highlight' " C++ highlighting
Plug 'vim-crystal/vim-crystal' " Crystal support
Plug 'neovimhaskell/haskell-vim' " Haskell highlighting
Plug 'udalov/kotlin-vim' " Kotlin support
Plug 'dart-lang/dart-vim-plugin' " Dart support
Plug 'elixir-editors/vim-elixir' " Elixir support
Plug 'kchmck/vim-coffee-script' " Coffeescript support
Plug 'JuliaEditorSupport/julia-vim' " Julia support
Plug 'zah/nim.vim' " Nim support
Plug 'jdonaldson/vaxe' " Haxe support
Plug 'hylang/vim-hy' " Hy support
Plug 'zigford/vim-powershell' " Powershell support
" Vim-plug plug-ins above

call plug#end() " End Vim-plug






""" Vundle plugins configuration

"" vimcord
"let g:vimcord_filepath = '~/.vim/bundle' " Set the filepath to the plugin
"let g:vimcord_python_executable = '/mnt/c/Users/troya/AppData/Local/Programs/Python/Python38-32/python.exe' " Set the python executabe to the one in Windows

"" coc.nvim coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)
inoremap <silent><expr> <C-Space>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<Tab>'

"" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1 " Start indentation guides on startup
let g:indent_guides_guide_size = 1 " The guide size is 1

"" rainbow
autocmd VimEnter,BufNewFile *.clj RainbowToggleOn " Toggle the parentheses on Clojure files
autocmd VimEnter,BufNewFile *.lisp RainbowToggleOn " Toggle the parentheses on Lisp files
autocmd VimEnter,BufNewFile *.hy RainbowToggleOn " Toggle the parentheses on Hy files
autocmd VimEnter,BufNewFile *.java RainbowToggleOn " Toggle the parentheses on Java files
" Configuration:
" Java -> Color '{' and '}'
" Lisps -> Color '(', ')', '[', ']', '{', '}' and ','
let s:colors = ['red', 'yellow', 'lightgreen', 'cyan', 'blue', 'magenta'] " The colors for the parentheses
let g:rainbow_conf = {
    \'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \'guis': [''],
    \'cterms': [''],
    \'operators': '_,_',
    \'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \'separately': {
        \'*': {},
        \'java': {
            \'operators': '',
            \'parentheses': ['start=/{/ end=/}/ fold'],
            \'ctermfgs': s:colors
        \},
        \'clojure': {
            \'ctermfgs': s:colors
        \},
        \'lisp': {
            \'ctermfgs': s:colors
        \},
        \'hy': {
            \'ctermfgs': s:colors
        \}
    \}
\}

"" NERDTree
autocmd VimEnter * NERDTree | wincmd p " Enable NERDTree when entering Vim
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif " Exit if NERDTree is the only window left
autocmd BufWinEnter * silent NERDTreeMirror " Copy NERDTree in other tabs

"" vim-one
colorscheme one " Set the color scheme
let g:one_allow_italics = 1 " Use italics

"" vim-airline
let g:airline_powerline_fonts = 1 " Use powerline
let g:airline_theme = 'one' " Use vim-one theme for status bar

"" vim-crystal
" Highlight variables and methods as identifiers
highlight! link crystalLocalVariableOrMethod Identifier

"" haskell-vim
let g:haskell_enable_quantification = 1   " Enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " Enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " Enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " Enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " Enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " Enable highlighting of `static`
let g:haskell_backpack = 1                " Enable highlighting of backpack keywords

let g:haskell_indent_if = 3 " Indent 'then' and 'else' by 3 spaces from the corresponding 'if'
let g:haskell_indent_case = 2 " Indent cases of 'case' by 2 spaces
let g:haskell_indent_before_where = 2 " Indent 'where' by 2 spaces
let g:haskell_indent_after_bare_where = 2 " Indent bindings by 2 spaces after corresponding base 'where'
let g:haskell_indent_where = 6 " Indent bindings by 6 spaces after corresponding not bare 'where'
let g:haskell_indent_guard = 2 " Indent guard clauses by 2 spaces

"" dart-vim-plugin
let g:dart_html_in_string = v:true " Enable highlighting for HTML in strings
let g:dart_style_guide = 4 " Set the indentation to 4 spaces

"" vim-coffee-script
" Don't highlight trailing spaces
highlight! link coffeeSpaceError NONE









""" Neovim settings

"" Editor Settings
set autoread " Automatically re-read files modified outside of Vim
set backspace=indent,eol,start " Allow backspacing over indentation, line breaks and insertion starts
set mouse=a " Cursor goes wherever clicked with mouse
autocmd VimEnter,BufNewFile *.xml set shiftwidth=2 " Set the indentation to two spaces for XML files
autocmd VimEnter,BufNewFile *.xml set tabstop=2 " Set the tabulation stop to two spaces for XML files
autocmd VimEnter,BufNewFile *.hs set shiftwidth=2 " Set the indentation to two spaces for Haskell files
autocmd VimEnter,BufNewFile *.rb set shiftwidth=4 " Set the indentation to four spaces for Ruby files
autocmd VimEnter,BufNewFile *.ex set shiftwidth=4 " Set the indentation to four spaces for Elixir files
let g:asmsyntax = 'nasm' " Set the syntax for Assembly files to NASM
let g:python_host_prog = '/usr/bin/python2' " Set the executable for Python 2 host to be '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3' " Set the executable for Python 3 host to be '/usr/bin/python3'

"" UI Settings
syntax on " Syntax highlighting
set number " Line numbers
set ruler " Show position of cursor
set title " Show name of file and the path to it
set background=dark " Use colors suitable for dark background
set termguicolors " Set terminal's GUI colors the ones from the color scheme

"" Text Settings
set enc=utf-8 " UTF-8 encoding
set linebreak " Line breaks on whitespaces
set scrolloff=5 " 5 Lines above/below the cursor while scrolling

"" Tabulation Settings
set tabstop=4 " Tabulations are in the proper place
set shiftwidth=4 " Tabulation size if 4
set expandtab " Tabulations are expanded
set smartindent " Smart indentation
set autoindent " New line indentation based on the previous line
set pastetoggle=<F2> " Set the paste toggle to be (<F2>)

"" Search Settings
set hlsearch " Highlight words found using the search

"" Clipboard settings
set clipboard=unnamedplus " Use "+ register for clipboard




""" Custom functions

" Commands:
" haxe: sudo add-apt-repository ppa:haxe/releases -y
"       sudo apt-get update
"       sudo apt-get install haxe -y
" dart: sudo apt-get update
"       sudo apt-get install apt-transport-https
"       sudo sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
"       sudo sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
"       sudo apt-get update
"       sudo apt-get install dart
" java: sudo apt install openjdk-11-jdk-headless
" kotlin: sdk install kotlin
" scala: sudo apt install scala
" groovy: sdk install groovy
" clojure: sudo apt install clojure
" lisp: sudo apt install clisp
" hy: pip install hy
" python: (preinstalled)
" r: sudo apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common
"    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
"    sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
"    sudo apt install r-base
" julia: sudo apt install julia
" nim: sudo apt-get install nim
" c: (preinstalled)
" cpp: (preinstalled)
" cs: sudo apt install gnupg ca-certificates
"     sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
"     echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
"     sudo apt update
"     sudo apt install mono-devel
" d: sudo wget https://netcologne.dl.sourceforge.net/project/d-apt/files/d-apt.list -O /etc/apt/sources.list.d/d-apt.list
"    sudo apt-get update --allow-insecure-repositories
"    sudo apt-get -y --allow-unauthenticated install --reinstall d-apt-keyring
"    sudo apt-get update && sudo apt-get install dmd-compiler dub
" rust: curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
"       sudo cargo install cargo-script
" go: sudo add-apt-repository ppa:longsleep/golang-backports
"     sudo apt update
"     sudo add-apt-repository ppa:longsleep/golang-backports
" fortran: (preinstalled)
" pascal: (preinstalled)
" haskell: sudo add-apt-repository -y ppa:hvr/ghc
"          sudo apt-get update
"          sudo apt-get install -y cabal-install-XXX ghc-YYY
" ocaml: sudo apt install ocaml
" lua: sudo apt install lua5.3
" dosbatch: (preinstalled for WSL)
" powershell: (preinstalled for WSL)
" sh: (preinstalled)
" perl: (preinstalled)
" php: sudo apt update
"      sudo apt install php php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath
" javascript: sudo apt install nodejs
"             sudo apt install npm
" typescript: sudo npm install typescript
"             sudo npm install ts-node
" coffee: sudo apt install coffeescript
" ruby: sudo apt-get install ruby-full
" crystal: curl -sSL https://dist.crystal-lang.org/apt/setup.sh | sudo bash
"          curl -sL "https://keybase.io/crystal/pgp_keys.asc" | sudo apt-key add -
"          echo "deb https://dist.crystal-lang.org/apt crystal main" | sudo tee /etc/apt/sources.list.d/crystal.list
"          sudo apt-get update
"          sudo apt install crystal libssl-dev libxml2-dev libyaml-dev libgmp-dev libz-dev
" elixir: sudo apt-get install elixir (requires Erlang)
" erlang: wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && sudo dpkg -i erlang-solutions_2.0_all.deb
"         sudo apt-get update
"         sudo apt-get install esl-erlang
" st: (preinstalled)
" nasm: sudo apt install nasm

" Call the function CompileAndRun (<F9>)
map <F9> :call <SID>CompileAndRun()<CR>
imap <F9> <ESC>:call <SID>CompileAndRun()<CR>
"" Runs the code in the file using the filetype
function! s:CompileAndRun()
    let l:file = expand('%:p') " The absolute path to the file
    let l:noext = expand('%:p:r') " The path to the file without the extension
    let l:path = expand('%:p:h') " The absolute path to the file without the name
    let l:name = expand('%:t:r') " The file name without the extension
    
    " The possible commands
    let l:command_map = {
        \'haxe'      : 'haxe --main ' . l:file . ' --interp',
        \'dart'      : 'dart run ' . l:file,
        \'java'      : 'java ' . l:file,
        \'kotlin'    : 'kscript ' . l:file,
        \'scala'     : 'scala ' . l:file,
        \'groovy'    : 'groovy -classpath ' . l:path . ' ' . l:name,
        \'clojure'   : 'clojure ' . l:file,
        \'lisp'      : 'clisp ' . l:file,
        \'hy'        : 'hy ' . l:file,
        \'python'    : 'python3 ' . l:file,
        \'r'         : 'r ' . l:file,
        \'julia'     : 'julia ' . l:file,
        \'nim'       : 'nimrun ' . l:path,
        \'c'         : 'gcc ' . l:file . ' -o ' . l:noext . ' && ' . l:noext . ' && rm ' . l:noext,
        \'cpp'       : 'g++ ' . l:file . ' -o ' . l:noext . ' && ' . l:noext . ' && rm ' . l:noext,
        \'cs'        : 'mcs ' . l:file . ' && mono ' . l:noext . '.exe && rm ' . l:noext . '.exe',
        \'d'         : 'rdmd ' . l:file,
        \'rust'      : 'cargo script ' . l:file,
        \'go'        : 'go run ' . l:file,
        \'fortran'   : 'gfortran ' . l:file . ' -o ' . l:name . ' && ' . l:noext . ' && rm ' . l:noext,
        \'pascal'    : 'instantfpc ' . l:file,
        \'haskell'   : 'runghc ' . l:file,
        \'ocaml'     : 'ocaml ' . l:file,
        \'lua'       : 'lua ' . l:file,
        \'dosbatch'  : 'cmd.exe /c //wsl$/Ubuntu' . l:file,
        \'powershell': 'powershell.exe ' . l:file,
        \'sh'        : 'chmod +x ' . l:file . ' && ' . l:file,
        \'perl'      : 'perl ' . l:file,
        \'php'       : 'php ' . l:file,
        \'javascript': 'node ' . l:file,
        \'typescript': 'ts-node ' . l:file,
        \'coffee'    : 'coffee ' . l:file,
        \'ruby'      : 'ruby ' . l:file,
        \'crystal'   : 'crystal ' . l:file,
        \'elixir'    : 'elixir ' . l:file,
        \'erlang'    : 'escript ' . l:file,
        \'st'        : 'gst ' . l:file,
        \'nasm'       : 'nasm -felf64 ' . l:file . ' -o ' . l:noext . '.o && ld ' . l:noext . '.o -o ' . l:noext . ' && ' . l:noext . ' && rm ' . l:noext . '.o ' . l:noext
    \}
    
    " Get the command
    let l:command = get(l:command_map, &filetype, '')
    
    " If can't execute the file, show an error
    if l:command == ''
        echohl ErrorMsg " Highligh echoes red
        " Echo "[ERROR]"
        echo '[ERROR]'
        echohl Normal " Remove echo highlighting
        " Give an error message
        echon &filetype . ' files cannot be executed.'
    else
        " Save the current file
        exec 'w'
        " Create a new buffer
        exec 'belowright vnew'
        " Start a terminal
        exec 'term ' . l:command
        " Enable insert mode
        exec 'startinsert'
    endif
endfunction

" Commands:
" haxe: (preinstalled with NPM)
" dart: (none)
" java: (installed)
" kotlin: (installed)
" scala: (installed)
" groovy: (insatlled)
" clojure: sudo apt install leiningen
" lisp: (installed)
" hy: (installed)
" python: (preinstalled)
" r: (installed)
" julia: (installed)
" nim: (installed)
" c: (none)
" cpp: wget https://root.cern.ch/download/cling//cling_2020-11-05_ROOT-ubuntu2004.tar.bz2
"      tar -xf cling_2020-11-05_ROOT-ubuntu2004.tar.bz2
"      export PATH=$PATH:(/path/to/cling_2020-11-05_ROOT-ubuntu2004)/bin
" cs: (installed)
" d: sudo apt-get update -y
"    sudo apt-get install -y dub
" rust: rustup toolchain add nightly
"       cargo +nightly install papyrus
" go: go install -i https://github.com/sbinet/igo
"     sudo mv (/path/to/$GOROOT)/bin/igo /usr/bin
" fortran: gem install frepl (requires Ruby)
" pascal: (none)
" haskell: (installed)
" ocaml: (installed)
" lua: (insatlled)
" dosbatch: (installed for WSL)
" powershell: (installed for WSL)
" sh: (preinstalled)
" perl: (preinstalled)
" lua: (installed)
" php: (installed)
" javascript: (installed)
" typescript: (installed)
" coffee: (installed)
" ruby: (installed)
" crystal: git clone https://github.com/crystal-community/icr.git
"          cd icr
"          make (requires Make)
"          sudo make install (requires Make)
" elixir: (installed)
" erlang: (installed)
" st: (preinstalled)
" nasm: sudo apt install libedit-dev
"       git clone https://github.com/yrp604/rappel.git
"       cd rappel
"       CC=clang make (requires Clang)
"       sudo mv bin/rappel /usr/bin

"augroup test
"    autocmd!
"    autocmd BufLeave * echomsg "BufLeave, " . bufname('%') . ", " . bufnr('%')
"    autocmd BufWinLeave * echomsg "BufWinLeave, " . bufwinnr('%') . ", " . bufwinid('%')
"    autocmd BufHidden * echomsg "BufHidden"
"    autocmd BufUnload * echomsg "BufUnload"
"    autocmd BufDelete * echomsg "BufDelete"
"    autocmd BufWipeout * echomsg "BufWipeout"
"augroup END

let s:code_repl_nrs = {} " A map of (code buffer number) - (REPL buffer number)
let s:last_leaved_buffer_nr = -1 " The number of the last leaved buffer

autocmd BufLeave,BufDelete * let s:last_leaved_buffer_nr = bufnr('%')
autocmd BufUnload * call <SID>StopREPL(s:last_leaved_buffer_nr) " Stop the REPL when closing the code buffer
autocmd BufWinEnter * call s:StartREPL() " Start a REPL when entering a buffer
"" Runs a REPL using the filetype
function! s:StartREPL()
    " The possible commands
    let l:command_map = {
        \'haxe'      : 'npx haxe-repl',
        \'dart'      : '',
        \'java'      : 'jshell',
        \'kotlin'    : 'kotlin',
        \'scala'     : 'scala',
        \'groovy'    : 'groovysh',
        \'clojure'   : 'lein repl',
        \'lisp'      : 'clisp',
        \'hy'        : 'hy',
        \'python'    : 'python3',
        \'r'         : 'R',
        \'julia'     : 'julia',
        \'nim'       : 'nim secret',
        \'c'         : '',
        \'cpp'       : 'cling',
        \'cs'        : 'charp',
        \'d'         : 'dub run drepl',
        \'rust'      : 'papyrus',
        \'go'        : 'igo',
        \'fortran'   : 'frepl',
        \'pascal'    : '',
        \'haskell'   : 'ghci',
        \'ocaml'     : 'ocaml',
        \'lua'       : 'lua',
        \'dosbatch'  : 'cmd.exe',
        \'powershell': 'powershell.exe',
        \'sh'        : 'bash',
        \'perl'      : 'perl -de1',
        \'php'       : 'php -a',
        \'javascript': 'node',
        \'typescript': 'ts-node',
        \'coffee'    : 'npx coffee',
        \'ruby'      : 'irb',
        \'crystal'   : 'icr',
        \'elixir'    : 'iex',
        \'erlang'    : 'erl',
        \'st'        : 'gst',
        \'nasm'      : 'rappel'
    \}
    
    " Get the command
    let l:command = get(l:command_map, &filetype, '')
    
    " If a REPL can be started, start it
    if l:command != ''
        let l:code_nr = bufnr('%') " Get the number of the code buffer
        " Create a new buffer at the bottom 1/4 the size
        exec 'belowright ' . (&lines / 4) . ' new'
        let s:code_repl_nrs[l:code_nr] = bufnr('%') " Save the number pair
        " Start a terminal
        exec 'term ' . l:command
        " Go back to the code area
        exec 'wincmd p'
    endif
endfunction

"" Stops a REPL given the number of the current buffer
function! s:StopREPL(buffer_nr)
    let l:repl_nr = get(s:code_repl_nrs, a:buffer_nr . '', -1) " Get the number of the REPL buffer
    if l:repl_nr != -1
        exec l:repl_nr . 'bdelete!'
    endif
endfunction

"" Send file to desktop
map <c-d> :call <SID>SendToDesktop()<CR>
function! s:SendToDesktop()
    exec "w"
    exec "!cpdt %:p"
endfunction
