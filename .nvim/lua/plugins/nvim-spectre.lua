return {
	"windwp/nvim-spectre",
	config = function()
		require("spectre").setup()
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",
	},
}
