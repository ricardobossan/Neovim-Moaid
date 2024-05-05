return {
	"mrjones2014/legendary.nvim",
	commit = "67acc7d5ce7598ea159e1c689cc0f323bcbfb297",
	version = "v2.1.0",
	-- since legendary.nvim handles all your keymaps/commands,
	-- its recommended to load legendary.nvim before other plugins
	priority = 10000,
	lazy = false,
	-- sqlite is only needed if you want to use frecency sorting
	-- dependencies = { 'kkharji/sqlite.lua' }
}
