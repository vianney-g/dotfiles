let mapleader=","
set termguicolors

" load plugins
runtime ./plug.vim


" ALL ABOUT LOOK & FEEL

" theme
set background=dark
let g:nord_cursor_line_number_background = 1
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1

augroup nord-themes-overrides:
	autocmd!
	" Make comments a little more visible as I can't see them
	  autocmd ColorScheme nord highlight Comment ctermfg=14 guifg=#AAAAFF
augroup END

colorscheme nord

" line number and highlight
set relativenumber
set cursorline

" allow buffers to be hidden and not saved
set hidden

" Display path of current file in terminal title
set title

" python venv
let g:python3_host_prog = "/home/vianney/.virtualenvs/pynvim/bin/python3.9"
" FZF
"
nnoremap <c-p> :Telescope find_files<cr>
nnoremap <leader><leader>g :Telescope live_grep<CR>
nnoremap <leader><leader>G :Telescope grep_string<CR>
nnoremap <leader><leader>b :Telescope buffers<CR>
nnoremap <leader><leader>m :Telescope marks<CR>
nnoremap <leader><leader>r :Telescope registers<CR>
nnoremap <leader><leader>d :Telescope diagnostics<CR>
nnoremap <leader><leader>u :Telescope lsp_references<CR>
nnoremap <leader><leader>e :Telescope emoji<CR>
nnoremap <leader><leader>n :ZkNotes<CR>

" git stuff
nmap <leader>gs :G<CR>
noremap <leader>gb :Git blame<cr>
nnoremap <leader>gs :Telescope git_status<CR>
nnoremap <leader>gc :Telescope git_bcommits<CR>


"Better UI with Lspsaga
nnoremap <silent>K :Lspsaga hover_doc<CR>
nnoremap <leader>k :Lspsaga signature_help<CR>
nnoremap <leader>r :Lspsaga rename<CR>
nnoremap <leader>a :Lspsaga code_action<CR>
vnoremap <leader>a :Lspsaga range_code_action<CR>
nnoremap <leader>D :Lspsaga preview_definition<CR>
nnoremap <leader>d :vsplit \| lua vim.lsp.buf.definition()<CR>
nnoremap <leader>er :Lspsaga diagnostic_jump_next<CR>
nnoremap <leader>ER :Lspsaga diagnostic_jump_prev<CR>
nnoremap <leader>u :Lspsaga lsp_finder<CR>
nnoremap <silent> <A-t> :Lspsaga open_floaterm<CR>
tnoremap <silent> <A-t> <C-\><C-n>:Lspsaga close_floaterm<CR>

set completeopt=menuone,noinsert,noselect
inoremap <expr> <Tab> pumvisible() ? "\<C-n>": "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>": "\<S-Tab>"

let g:completion_customize_lsp_label = {
	\ 'Text':          '',
	\ 'Method':        '𝓶',
	\ 'Function':      '',
	\ 'Constructor':   '𝓬',
	\ 'Field':         '',
	\ 'Variable':      '',
	\ 'Class':         '',
	\ 'Interface':     '',
	\ 'Module':        '',
	\ 'Property':      '',
	\ 'Unit':          '',
	\ 'Value':         '',
	\ 'Enum':          '',
	\ 'Keyword':       '',
	\ 'Snippet':       '﬌',
	\ 'Color':         '',
	\ 'File':          '',
	\ 'Reference':     '',
	\ 'Folder':        '',
	\ 'EnumMember':    '',
	\ 'Constant':      '',
	\ 'Struct':        '',
	\ 'Event':         '',
	\ 'Operator':      '',
	\ 'TypeParameter': ''
\}

" Change grep to ripgrep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" Easy buffer navigation
nmap <leader>; :bnext<CR>

" Execute command in tmux
map <leader>pp :VimuxPromptCommand<CR>
map <leader>pz :VimuxZoomRunner<CR>

" tmux navigation
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-l> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>

" Abbreviations
iabbrev @@ vianney.gremmel@lengow.com

" neovide stuff :)
let g:neovide_cursor_vfx_mode = "railgun"
let g:neovide_fullscreen=v:true

" keep focus centered (and unfold) while moving
nnoremap n nzzzv
nnoremap N Nzzzv
