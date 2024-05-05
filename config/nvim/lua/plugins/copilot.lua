return {
	"github/copilot.vim",
	commit = "79e1a892ca9b4fa6234fd25f2930dba5201700bd",
	config = function()
		vim.g.copilot_no_tab_map = true
		vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
	end
}
