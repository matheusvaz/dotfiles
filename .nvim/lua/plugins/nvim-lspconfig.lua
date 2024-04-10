local on_attach = require("core.lsp").on_attach
local typescript_organise_imports = require("core.lsp").typescript_organise_imports

local config = function()
	require("neoconf").setup({})

	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local lspconfig = require("lspconfig")
	local capabilities = cmp_nvim_lsp.default_capabilities()

	vim.fn.sign_define(
		"DiagnosticSignError",
		{ text = icons.diagnostics.Error, texthl = "DiagnosticSignError", numhl = "" }
	)
	vim.fn.sign_define(
		"DiagnosticSignWarn",
		{ text = icons.diagnostics.Warning, texthl = "DiagnosticSignWarn", numhl = "" }
	)
	vim.fn.sign_define(
		"DiagnosticSignHint",
		{ text = icons.diagnostics.Hint, texthl = "DiagnosticSignHint", numhl = "" }
	)
	vim.fn.sign_define(
		"DiagnosticSignInfo",
		{ text = icons.diagnostics.Information, texthl = "DiagnosticSignInfo", numhl = "" }
	)

	-- Lua
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
		flags = {
			debounce_text_changes = 100,
		},
	})

	-- Typescript
	lspconfig.tsserver.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"typescript",
			"javascript",
			"typescriptreact",
			"javascriptreact",
		},
		commands = {
			TypeScriptOrganizeImports = typescript_organise_imports,
		},
		settings = {
			typescript = {
				indentStyle = "space",
				indentSize = 2,
			},
		},
		root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
	})

	-- typescriptreact, javascriptreact, css, sass, scss, less, svelte, vue
	lspconfig.emmet_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = {
			"typescriptreact",
			"javascriptreact",
			"javascript",
			"css",
			"sass",
			"scss",
			"less",
			"vue",
			"html",
		},
	})

	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")
	local eslint = require("efmls-configs.linters.eslint")
	local prettier_d = require("efmls-configs.formatters.prettier_d")

	-- configure efm server
	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"vue",
			"html",
			"css",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				typescript = { eslint, prettier_d },
				javascript = { eslint, prettier_d },
				javascriptreact = { eslint, prettier_d },
				typescriptreact = { eslint, prettier_d },
				vue = { eslint, prettier_d },
				html = { prettier_d },
				css = { prettier_d },
			},
		},
	})
end

-- Format on save
local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = lsp_fmt_group,
	callback = function()
		local efm = vim.lsp.get_active_clients({ name = "efm" })

		if vim.tbl_isempty(efm) then
			return
		end

		vim.lsp.buf.format({ name = "efm", async = true })
	end,
})

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
	},
}
