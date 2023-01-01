vim.g.mapleader = ","

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader><space>", vim.cmd.nohlsearch)

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Buffers
vim.keymap.set("n", "<leader>b", vim.cmd.buffers)

vim.keymap.set("n", "<leader>s<left>", ":leftabove vnew<cr>")
vim.keymap.set("n", "<leader>s<right>", ":rightbelow vnew<cr>")
vim.keymap.set("n", "<leader>s<up>", ":leftabove new<cr>")
vim.keymap.set("n", "<leader>s<down>", ":rightbelow new<cr>")

-- Switch between two last buffers
vim.keymap.set("n", "<leader><leader>", "<C-^>")

-- Tab between buffers
vim.keymap.set("n", "<tab>", "<c-w>w")
vim.keymap.set("n", "<S-tab>", "<c-w>W")

-- Go to home and end using capitalized directions
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
