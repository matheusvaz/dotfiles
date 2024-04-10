local M = {}

M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	kmap.set("n", "gD", "<CMD>Lspsaga peek_definition<CR>", opts)
	kmap.set("n", "gd", "<CMD>Lspsaga goto_definition<CR>", opts)
	kmap.set("n", "gS", "<CMD>vsplit | Lspsaga goto_definition<CR>", opts)
	kmap.set("n", "gl", "<CMD>Lspsaga show_cursor_diagnostics<CR>", opts)
	kmap.set("n", "K", "<CMD>Lspsaga hover_doc<CR>", opts)
end

M.typescript_organise_imports = {
	description = "Organise Imports",
	function()
		local params = {
			command = "_typescript.organizeImports",
			arguments = { vim.fn.expand("%:p") },
		}
		-- reorganise imports
		vim.lsp.buf.execute_command(params)
	end,
}

return M
