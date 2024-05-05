---[[ Global Variables
function Is_windows()
	return package.config:sub(1, 1) == "\\"
end -- Function to adjust paths and commands based on the operating system

local function getHome_OSAgnostic()
	if os.getenv("HOME") then
		return os.getenv("HOME")
	elseif os.getenv("USERPROFILE") then
		return os.getenv("USERPROFILE")
	else
		error("Unable to determine the home directory.")
	end
end

HOME = getHome_OSAgnostic()

-- @brief Path separator based on the operating system
PS = package.config:sub(1, 1)
--]]



vim.loader.enable()

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local ops = {
	change_detection = {
		notify = false
	}
}

require("config.options")

require("lazy").setup({

	spec = {
		{ import = "plugins" },
	},
	install = { colorscheme = { "nightfox", "habamax" } },
	change_detection = {
		notify = false
	},
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				"man",
				"rplugin",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	}
})

require("config.autocmds")
require("config.keymap")
require('config.dap.init')
