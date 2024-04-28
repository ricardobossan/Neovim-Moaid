local api = vim.api

-- Function to create autocmd groups
local function augroup(name)
    return vim.api.nvim_create_augroup("moaid_" .. name, { clear = true })
end

-- Function to set options for markdown files
local function setup_markdown_options()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
    vim.cmd("filetype plugin on")
    vim.cmd("set syntax=markdown")
    vim.g.vim_markdown_folding_style_pythonic = 1
    vim.g.vim_markdown_folding_level = 1
    vim.g.vim_markdown_toc_autofit = 1
    vim.g.vim_markdown_follow_anchor = 1
    vim.g.vim_markdown_frontmatter = 1
    vim.g.vim_markdown_toml_frontmatter = 1
    vim.g.vim_markdown_json_frontmatter = 1
    vim.g.vim_markdown_strikethrough = 1
    vim.g.vim_markdown_new_list_item_indent = 2
    vim.g.vim_markdown_edit_url_in = 'tab'
    vim.cmd("set conceallevel=2")
    vim.cmd("set wrap linebreak")
    vim.g.markdown_fenced_languages = {'html', 'python', 'bash=sh', 'csharp=cs'}
end

-- Auto commands for markdown files
augroup("markdown_autocmds")
api.nvim_create_autocmd("FileType", { pattern = "markdown", callback = setup_markdown_options })
augroup("")

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Resize splits if window got resized
api.nvim_create_autocmd({ "VimResized" }, {
    group = augroup("resize_splits"),
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- Go to last loc when opening a buffer
api.nvim_create_autocmd("BufReadPost", {
    group = augroup("last_loc"),
    callback = function()
        local exclude = { "gitcommit" }
        local buf = vim.api.nvim_get_current_buf()
        if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
            return
        end
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Close some filetypes with <q>
api.nvim_create_autocmd("FileType", {
    group = augroup("close_with_q"),
    pattern = {
        "PlenaryTestPopup", "help", "lspinfo", "man", "notify",
        "qf", "spectre_panel", "startuptime", "tsplayground",
        "neotest-output", "checkhealth", "neotest-summary",
        "neotest-output-panel",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
end,
})

-- Wrap and check for spell in text filetypes
api.nvim_create_autocmd("FileType", {
group = augroup("wrap_spell"),
pattern = { "gitcommit", "markdown" },
callback = function()
vim.opt.wrap = true
vim.opt.spell = true
end,
})

-- Enable syntax highlighting on buffer enter
api.nvim_create_autocmd("BufEnter", {
group = augroup("syntax_highlight"),
command = "syntax on",
})

-- Set wrap and linebreak on buffer enter
api.nvim_create_autocmd("BufEnter", {
group = augroup("wrap_linebreak"),
command = "set wrap linebreak",
})

-- Enable filetype plugin on buffer enter for markdown files
api.nvim_create_autocmd("FileType", {
group = augroup("filetype_plugin"),
pattern = "markdown",
command = "filetype plugin on",
})

-- Set foldlevel to 1 on buffer enter for markdown files
api.nvim_create_autocmd("BufEnter", {
group = augroup("foldlevel"),
pattern = "markdown",
command = "set foldlevel=1",
})

-- Close autocmd group definitions
augroup("")
