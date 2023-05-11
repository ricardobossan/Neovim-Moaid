vim.g.mapleader = " "

-- save document
vim.keymap.set("n", "<C-s>", vim.cmd.w, { desc = "Save Buffer", silent = true })
vim.keymap.set("i", "<C-s>", vim.cmd.w, { desc = "Save Buffer", silent = true })
vim.keymap.set("v", "<C-s>", vim.cmd.w, { desc = "Save Buffer", silent = true })

-- save all documents
-- vim.keymap.set("n", "<C-S-s>", vim.cmd.wall, { silent = true })
-- vim.keymap.set("i", "<cs-s>", vim.cmd.wall, { silent = true })
-- vim.keymap.set("v", "<cs-R>", vim.cmd.wall, { silent = true })

-- vim.keymap.set('n', '<leader>mq', ':wa<CR>', { desc = "Save All Buffers", })

-- Delete text
vim.keymap.set('i', '<C-Del>', "<Esc>ce")
vim.keymap.set('i', '<C-backspiace>', "<Esc>cb")
vim.keymap.set('n', '<C-Del>', "ce")
vim.keymap.set('n', '<C-backspace>', "cb")

-- vim.keymap.set('n', '<leader>q', ':q!<CR>:q!<CR>:q!<CR>')
vim.keymap.set('n', '<leader>q', ':qa<CR>:qa<CR>:qa<CR>')
vim.keymap.set('n', '<leader>Q', ':q!<CR>:q!<CR>:q!<CR>')

-- Split navigation and management
vim.keymap.set('n', '<leader>bb', ':bprev<CR>', { desc = 'Goto Previous Buffer', silent = true })
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Goto Next Buffer', silent = true })
-- vim.keymap.set('n', '<leader>c', ':bprev<CR>:bdelete #<CR>')
vim.keymap.set('n', '<leader>bd', ':bprev<CR>:bdelete #<CR>', { desc = 'Close Current Buffer' })
vim.keymap.set('n', '<leader>bD', "<cmd>:%bd<CR>", { desc = 'Close All Buffers' })
vim.keymap.set('n', '<leader>bf', "<cmd>:BufferLinePick<CR>", { desc = 'Pick Buffer' })
vim.keymap.set('n', '<leader>bs', "<cmd>:BufferLinePick<CR>", { desc = 'Pick Buffer' })
vim.keymap.set('n', '<leader>bp', "<cmd>:BufferLineTogglePin<CR>", { desc = 'Pin Buffer' })
vim.keymap.set('n', '<leader>br', "<cmd>:e!<CR>", { desc = 'Reload Buffer' })

-- Move between splits
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', { desc = 'Goto Left Buffer', silent = true })
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', { desc = 'Goto Right Buffer', silent = true })
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', { desc = 'Goto Below Buffer', silent = true })
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', { desc = 'Goto Above Buffer', silent = true })

vim.keymap.set('n', "<S-q>", '<cmd>:q<CR>', { desc = "Close Without Saving" })

-- Reise splits
vim.keymap.set('n', '<C-Right>', ':vertical-resize +1<CR>', { silent = true })
vim.keymap.set('n', '<C-Left>', ':vertical-resize -1<CR>', { silent = true })
vim.keymap.set('n', '<C-Up>', ':resize -1<CR>', { silent = true })
vim.keymap.set('n', '<C-Down>', ':resize +1<CR>', { silent = true })

-- Move current line / block with Alt-j/k a la vscode.
vim.keymap.set('n', "<M-j>", ":m .+1<CR>==", { silent = true })
vim.keymap.set('n', "<M-k>", ":m .-2<CR>==", { silent = true })

-- Better line / block movement
-- vim.keymap.set('n', "<A-j>", ":m '>+1<CR>gv-gv", { silent = true })
-- vim.keymap.set('n', "<A-k>", ":m '<-2<CR>gv-gv", { silent = true })

-- Better indenting in Visual mode
vim.keymap.set('v', '>', ">gv")
vim.keymap.set('v', '<', "<gv")

vim.keymap.set('i', "<C-k>", 'k')

vim.keymap.set('n', '<leader>ps', "<cmd>:w<CR>:so<CR>:Lazy sync<CR>")
-- vim.keymap.set('n', '<leader>ms', "<cmd>:w<CR>:so<CR>")
vim.keymap.set('i', '<C-c>', '<Esc>')

vim.keymap.set("n", "<leader>fs", vim.cmd.wall, { desc = "Save All Buffers", silent = true })
vim.keymap.set("v", "<leader>fs", vim.cmd.wall, { desc = "Save All Buffers", silent = true })
vim.keymap.set('n', '<leader>fa', "gg<S-v>G<CR>", { desc = "Select All File" })
vim.keymap.set('n', '<leader>fC', '<cmd>:%y+<CR>', { desc = { 'Copy All File To OS' } })
-- vim.keymap.set('n', '<leader>fV', 'gg<S-v>G<CR><leader>fv')
vim.keymap.set('n', '<leader>fv', '"+p', { desc = "Paste from OS" })
vim.keymap.set('v', '<leader>fv', '"+p', { desc = "Paste from OS" })
vim.keymap.set('v', '<leader>fc', '"+y', { desc = "Copy to OS" })
vim.keymap.set('n', '<leader>fh', '<cmd>:nohls<CR>', { desc = "No HLS" })

vim.keymap.set('n', '<leader>ms', "<cmd>:w<CR>:so<CR>", { desc = "Shout Out" })
-- vim.keymap.set('n', '<leader>c', '"+y<CR>')
-- vim.keymap.set('i', '<leader>c', '"+y<CR>')
-- vim.keymap.set('v', '<leader>c', '"+y<CR>')
-- vim.keymap.set('n', '<leader>v', '"+p<CR>')
-- vim.keymap.set('i', '<leader>v', '"+p<CR>')
-- vim.keymap.set('v', '<leader>v', '"+p<CR>')
