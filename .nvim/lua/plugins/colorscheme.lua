return {
	{ "EdenEast/nightfox.nvim" },
	{
		"folke/tokyonight.nvim",
		config = function()
			cmd("colorscheme " .. colorscheme)
		end,
	},
}
