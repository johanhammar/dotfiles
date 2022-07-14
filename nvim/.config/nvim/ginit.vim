" Neovim QT

" Fix copy & paste
"set clipboard^=unnamed.unnamedplus

"https://github.com/equalsraf/neovim-qt/issues/327
source $VIMRUNTIME/mswin.vim

" https://www.reddit.com/r/neovim/comments/9n7sja/liga_source_code_pro_is_not_a_fixed_pitch_font/
let s:fontsize = 12
let s:font = "Hack"

"GuiFont! Hack:h11
execute "GuiFont! " . s:font . ":h" . s:fontsize

function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! " . s:font . ":h" . s:fontsize
endfunction

" Change font size using scroll wheel
noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a

