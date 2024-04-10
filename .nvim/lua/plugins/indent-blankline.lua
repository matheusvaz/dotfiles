return {
	"lukas-reineke/indent-blankline.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	main = "ibl",
	lazy = false,
	opts = {
		enabled = true,
		indent = {
			char = icons.ui.LineLeft,
		},
	},
}
