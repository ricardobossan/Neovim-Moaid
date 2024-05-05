return {
	"nvim-tree/nvim-tree.lua",
	commit = "08a0aa1a3b7411ee0a7887c8818528b1558cef96",
	lazy = false,
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", commit = "bb6d4fd1e010300510172b173ab5205d37af084f" },
	},
	config = function()
		-- examples for your init.lua

		-- disable netrw at the very start of your init.lua (strongly advised)
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- set termguicolors to enable highlight groups
		vim.opt.termguicolors = true

		-- OR setup with some options
		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			view = {
				adaptive_size = true,
				--[[
				mappings = {
					list = {
						{ key = "u", action = "dir_up" },
					},
				},
				--]]
			},
			renderer = {
				group_empty = false,
			},
			filters = {
				dotfiles = true,
			},
		})

		local function open_nvim_tree(data)
			--[[
	-- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
	if data.file ~= nil then
		vim.cmd.cd(data.file)
	end
	--]]

			-- open the tree
			require("nvim-tree.api").tree.open()
			--vim.cmd("SessionRestore")
		end

		vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

		local whichkey = require("which-key")
		local legendary_whichkey = require("legendary.integrations.which-key")

		local opts = {
			mode = "n",
			prefix = "<leader>",
			buffer = nil,
			silent = true,
			noremap = true,
			nowait = false,
		}

		local keymap = {
			e = { "<cmd>NvimTreeToggle<CR>", "File Explorer" }
		}

		whichkey.register(keymap, opts)
		legendary_whichkey.bind_whichkey(keymap, opts, true)
		legendary_whichkey.parse_whichkey(keymap, opts, true)
	end,
}
