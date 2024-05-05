return {
	"Exafunction/codeium.nvim",
	commit = "cd5913ff5481229b15186293d1d46dd9500789f9",
	dependencies = {
		{
			"nvim-lua/plenary.nvim",
			commit = "0c31c398261567cda89b66ddffc69d39495f63ae",
		},
		{
			"hrsh7th/nvim-cmp",
			commit = "feed47fd1da7a1bad2c7dca456ea19c8a5a9823a",
		},
	},
	config = function()
		require("codeium").setup({})
	end,
}
