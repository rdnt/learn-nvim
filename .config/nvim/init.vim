" ---------------------------- Settings --------------------------- "

" configure nerdtree shortcuts
" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

" nnoremap <C-t> :NERDTreeToggle<CR>

"augroup cmds
"    autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()
"augroup END

" enable mouse scroll
set mouse=a

" make sign column transparent
highlight clear SignColumn

" use esc key as nohighlight shortcut
map <esc> :noh <CR>

" set shell to zsh (set to interactive to load .zshrc)
set shell=zsh\ -i

" ignore search case
set ignorecase

" highlight search occurrences
set hlsearch

" incremental search (show results while typing)
set incsearch

" tab character indents with 4 spaces
set shiftwidth=4

" set tabs to appear as 4 spaces
set tabstop=4

" enable line number on gutter
set number
