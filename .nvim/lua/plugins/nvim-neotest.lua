return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-jest",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-jest")({
					jestCommand = "npm test --",
					env = { CI = true },
					cwd = function(path)
						return vim.fn.getcwd()
					end,
				}),
			},
		})
	end,
}
