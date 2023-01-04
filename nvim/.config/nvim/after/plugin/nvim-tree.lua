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
