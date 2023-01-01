require("johanh.set")
require("johanh.remap")

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

--[[   
" Automatic formatting
function! <SID>StripTrailingSpace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
--]]

local paste_group = vim.api.nvim_create_augroup('Paste', { clear = true })
vim.api.nvim_create_autocmd('InsertLeave', {
  command = 'set cursorline nopaste',
  group = paste_group,
  pattern = '*'
})

