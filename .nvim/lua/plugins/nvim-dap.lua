vim.api.nvim_set_keymap("n", "<F5>", '<Cmd>lua require("dap").continue()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F10>", '<Cmd>lua require("dap").step_over()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F11>", '<Cmd>lua require("dap").step_into()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F12>", '<Cmd>lua require("dap").step_out()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<Leader>b",
	'<Cmd>lua require("dap").toggle_breakpoint()<CR>',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>B",
	'<Cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<Leader>lp", '<Cmd>lua require("dap").run_last()<CR>', { noremap = true, silent = true })

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"theHamsta/nvim-dap-virtual-text", -- Enhances DAP UI by showing values next to variables during debugging
		"rcarriga/nvim-dap-ui", -- Provides a more user-friendly interface for DAP
		"Pocco81/DAPInstall.nvim", -- Simplifies the installation of various debug adapters
	},
	config = function()
		local dap = require("dap")

		-- General DAP settings
		dap.defaults.fallback.terminal_win_cmd = "50vsplit new"

		-- Node.js adapter configuration
		dap.adapters["pwa-node"] = {
			type = "executable",
			command = "node", -- Path to node executable
			args = { os.getenv("HOME") .. "/.vscode/extensions/ms-vscode.js-debug/src/debugServerMain.js" }, -- Adjust the path to where the debug server main file is located
		}


		-- Load DAP UI Enhancements
		require("dapui").setup()
		require("nvim-dap-virtual-text").setup()
	end,
}
