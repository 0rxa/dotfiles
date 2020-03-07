" Global  
execute pathogen#infect()
syntax on
filetype plugin indent on
syntax on
filetype indent on
" hi LineNr ctermfg=80
" hi CursorLineNr ctermfg=50
set autoindent
set cindent
set number
set hls
set incsearch
set relativenumber
set encoding=utf-8
set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P
set laststatus=2

autocmd Filetype html setlocal tabstop=4
autocmd Filetype css setlocal tabstop=4
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent loadview
augroup END

command Q qa
command W wa
nnoremap <silent> <C-l> :nohl<CR><C-l>
nnoremap <C-f> 		:%s///gc<LEFT><LEFT><LEFT><LEFT>
nnoremap <C-p>		:tabprevious<CR>
nnoremap <C-n>		:tabnext<CR>
nnoremap <F1>  		:wq!<ENTER>
inoremap <F1>  		<ESC>:wq!<ENTER>
nnoremap <F2>  		:q!<ENTER>
inoremap <F2>  		<ESC>:q!<ENTER>
nnoremap <F12> 		<ESC>:!`echo $SHELL`<ENTER>
inoremap <F12> 		<ESC>:!`echo $SHELL`<ENTER>
nnoremap <F10> 		:w !sudo tee %<ENTER>
inoremap <F10> 		<ESC>:w !sudo tee %<ENTER>


" C/C++/Java
autocmd FileType   cpp      nnoremap  <F3> :w<ENTER>:!clear && g++ % -o %:r<CR>
autocmd FileType c          nnoremap  <F3> :w<ENTER>:!clear && gcc % -o %:r<CR>
autocmd FileType c,cpp      nnoremap  <F4> :!clear && ./%:r<CR>
autocmd FileType c,cpp 	    nnoremap -i o#include <><LEFT>
autocmd FileType c,cpp 	    nnoremap =i o#include ""<LEFT>
autocmd FileType   cpp      nnoremap -u ousing namespace std;
autocmd FileType c,cpp      nnoremap -m o<ENTER>int main(int argc, char* argv[])<ENTER>{<ENTER><ENTER>}<UP><TAB>
autocmd FileType c          nnoremap -p oputs("");<LEFT><LEFT><LEFT>
autocmd FileType c,cpp,java inoremap (" ("");<LEFT><LEFT><LEFT>
autocmd FileType       java nnoremap pc :r! echo %:r<ENTER>0ipublic class $<CR>{<CR><CR>}<UP><ESC>
autocmd FileType       java nnoremap pm i<TAB>public static void main(String[] args)<CR>{<CR><CR>}<UP><TAB><TAB>
autocmd FileType       java nnoremap -p oSystem.out.println();<LEFT><LEFT>
autocmd FileType       java nnoremap <F3> :w<ENTER>:!clear && javac %<ENTER>
autocmd FileType       java inoremap <F3> <ESC>:w<ENTER>:!clear && javac %<ENTER>
autocmd FileType       java nnoremap <F4> :w<ENTER>:!clear && java %:r<ENTER>
autocmd FileType       java inoremap <F4> <ESC>:w<ENTER>:!clear && java %:r<ENTER>



" Bash
autocmd FileType sh nnoremap <F3> :w<ENTER>:!clear && ./%<ENTER>
autocmd FileType sh inoremap <F3> <ESC>:w<ENTER>:!clear && ./%<ENTER>
autocmd FileType sh nnoremap -i i#!/bin/bash<CR><CR>
autocmd FileType sh nnoremap -e iecho -n ""<LEFT> 
autocmd FileType sh nnoremap -w owhile [  ]; do<CR><CR>done<ESC>?while<ENTER>e<RIGHT><RIGHT><RIGHT><RIGHT>i
autocmd FileType sh nnoremap !s 0xj
autocmd FileType sh nnoremap @s 0i<TAB><ESC>j
autocmd FileType sh nnoremap @c 0i#<ESC>j



" Python
autocmd FileType python nnoremap <F3> :w<ENTER>:!clear && python ./% <ENTER>
autocmd FileType python inoremap <F3> :w<ENTER>:!clear && python ./% <ENTER>
autocmd FileType python nnoremap !s 0xj
autocmd FileType python nnoremap @s 0i<TAB><ESC>j
autocmd FileType python nnoremap @c 0i#<ESC><Down>

" JavaScript
autocmd FileType javascript nnoremap <F3> :w<ENTER>:!clear && node ./% <ENTER>
autocmd FileType javascript inoremap <F3> :w<ENTER>:!clear && node ./% <ENTER>
autocmd FileType javascript inoremap (" ("");<LEFT><LEFT><LEFT>
autocmd FileType javascript inoremap ({ ({<ENTER><ENTER>});<ESC>kcc
autocmd FileType javascript inoremap {<RETURN> {<CR><CR>}<UP><ESC>cc

" Vue
autocmd BufNewFile,BufRead *.vue set syntax=html
autocmd BufNewFile,BufRead *.vue nnoremap <F3> :w<ENTER>:!st -e zsh -ic "nodemon ./%"&;disown;exit<ENTER>
autocmd BufNewFile,BufRead *.vue inoremap <F3> :w<ENTER>:!st -e zsh -ic "nodemon ./%"&;disown;exit<ENTER>
autocmd BufNewFile,BufRead *.vue inoremap (" ("");<LEFT><LEFT><LEFT>
autocmd BufNewFile,BufRead *.vue inoremap {<RETURN> {<CR><CR>}<UP><ESC>cc
