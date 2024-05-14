return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	config = function()
		require("nvim-treesitter.configs").setup({
			build = ":TSUpdate",
			indent = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
			event = {
				"BufReadPre",
				"BufNewFile",
			},
			ensure_installed = {
				"c",
				"cpp",
				"php",
				"rust",
				"markdown",
				"json",
				"javascript",
				"typescript",
				"yaml",
				"html",
				"css",
				"markdown",
				"bash",
				"lua",
				"dockerfile",
				"gitignore",
				"python",
				"vue",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-s>",
					node_incremental = "<C-s>",
					scope_incremental = false,
					node_decremental = "<BS>",
				},
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
			},
		})
	end,
}
