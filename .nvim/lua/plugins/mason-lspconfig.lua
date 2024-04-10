return {
	"williamboman/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"efm",
			"lua_ls",
			"tsserver",
		},
		automatic_installation = true,
	},
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
