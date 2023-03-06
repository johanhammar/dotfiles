-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local nvim_tree = require('nvim-tree')

local function go_to_prev_window()
    vim.cmd("wincmd p")
end

nvim_tree.setup({
    view = {
        mappings = {
            custom_only = false,
            list = {
                { key = "<Tab>", action = "preview", action_cb = go_to_prev_window },
            },
        },
    },
})

vim.keymap.set("n", "<leader>t", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>g", vim.cmd.NvimTreeFindFile)

-- vim.api.nvim_create_autocmd("BufEnter", {
--  group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
--  pattern = "NvimTree_*",
--  callback = function()
--    local layout = vim.api.nvim_call_function("winlayout", {})
--    if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end
--  end
--})
