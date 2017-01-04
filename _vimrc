source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" ��ʾ�к�
set nu

" ��ʾ��β���Ʊ��
set list

" ȡ���ļ�����
set nobackup
set noundofile

" ����
" set encoding=utf-8
set fileencoding=gbk
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1

" ����
set autoindent
set smartindent
set cindent
set expandtab

" Tab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" �۵�
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" ��ɫ����
colorscheme desert

" ����
set guifont=������:h10w5
set linespace=3

" ���Һ��Դ�Сд
set ignorecase

" �½���ǩҳ
map <F2> :tabnew 
" ��ǩҳ��ת
map <C-TAB> :tabp<cr>
map <C-TAB> :tabn<cr>

" ִ��python
map <F5> :!python %<cr>

" Vundle ��� �����װ����
filetype off
set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
call vundle#begin('$VIM/vimfiles/bundle/')
Bundle 'gmarik/Vundle.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Bundle 'Yggdroot/indentLine'
Bundle 'jiangmiao/auto-pairs'
Bundle 'scrooloose/nerdcommenter'
Bundle 'ctrlpvim/ctrlp.vim'
" Bundle 'dyng/ctrlsf.vim'
Bundle 'scrooloose/syntastic'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'tell-k/vim-autopep8'
Bundle 'tpope/vim-fugitive'
call vundle#end()
filetype plugin indent on

" NERDTree ��� ����Ŀ¼
map <F3> :NERDTreeToggle<CR>
let NERDTreeChDirMode = 1
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore = ['\.pyc$', '\.swp$']

" indentLine ��� ����ָʾ��
let g:indentLine_char = '|'
let g:indentLine_enabled = 1

" auto-pairs ��� �������Ų�ȫ
" let g:AutoPairsFlyMode = 1

" NERDcommenter ��� ����ע��
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" syntastic ��� �﷨���
let python_highlight_all = 1

" airline ��� ״̬��
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

" Rainbow Parentheses ��� ������ɫ
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" vim-autopep8 ��� PEP8��ʽ��
let g:autopep8_disable_show_diff = 1
