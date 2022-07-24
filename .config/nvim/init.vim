" ---------------------------- Plugins ---------------------------- "

call plug#begin('~/.config/nvim/autoload/')

Plug 'catppuccin/nvim', {'as': 'catppuccin'}

" ---------------------------- Settings --------------------------- "

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