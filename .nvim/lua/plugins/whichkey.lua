local opts = {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
}

local vopts = {
	mode = "v",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
}

local vmappings = {
	["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
	l = {
		name = "LSP",
		a = { "<cmd>Lspsaga code_action<>", "Code Action" },
	},
}

local mappings = {
	["/"] = {
		"<Plug>(comment_toggle_linewise_current)",
		"Comment toggle current line",
	},

	["b"] = {
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"Buffers",
	},
	d = {
		name = "+debug", -- group name
		c = { "<Cmd>lua require('dap').continue()<CR>", "Continue" },
		o = { "<Cmd>lua require('dap').step_over()<CR>", "Step Over" },
		i = { "<Cmd>lua require('dap').step_into()<CR>", "Step Into" },
		u = { "<Cmd>lua require('dap').step_out()<CR>", "Step Out" },
		b = { "<Cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle Breakpoint" },
		B = {
			"<Cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
			"Set Conditional Breakpoint",
		},
		l = { "<Cmd>lua require('dap').run_last()<CR>", "Run Last" },
	},
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	["w"] = { "<cmd>w!<CR>", "Save" },
	["q"] = { "<cmd>q!<CR>", "Quit" },
	["c"] = { "<cmd>lua close_buffer_prompt()<CR>", "Close Buffer" },
	["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
	["f"] = {
		"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"Find files",
	},
	["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
	["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },

	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
	},

	l = {
		name = "LSP",
		a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
		d = {
			"<cmd>Telescope diagnostics bufnr=0<cr>",
			"Document Diagnostics",
		},
		w = {
			"<cmd>Telescope diagnostics<cr>",
			"Workspace Diagnostics",
		},
		f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = {
			"<cmd>Lspsaga diagnostic_jump_next<CR>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>Lspsaga diagnostic_jump_prev<cr>",
			"Prev Diagnostic",
		},
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
		r = { "<cmd>Lspsaga rename<cr>", "Rename" },
		R = { "<cmd>Lspsaga finder<cr>", "Find references" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
	},

	s = {
		name = "Search",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		r = { "<cmd>Spectre<cr>", "Find and replace" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
	},

	T = {
		name = "Terminal",
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},

	t = {
		name = "Tests",
		r = {
			"<cmd>Neotest run<cr>",
			"Run tests",
		},
		s = {
			"<cmd>Neotest stop<cr>",
			"Stop tests",
		},
		i = {
			"<cmd>Neotest summary<cr>",
			"Summary",
		},
		o = {
			"<cmd>Neotest output<cr>",
			"Output",
		},
		O = {
			"<cmd>Neotest output-panel<cr>",
			"Output panel",
		},
	},

	n = { "<cmd>lua require('notify').dismiss()<cr>", "Dismiss all notifications" },
}

function _G.close_buffer_prompt()
	-- Check if the current buffer is modified
	if vim.bo.modified then
		-- Confirm with the user
		local choice = vim.fn.confirm("Buffer has unsaved changes. Close anyway?", "&Yes\n&No", 2)
		if choice == 1 then
			-- User chose 'Yes', close the buffer
			vim.cmd("bd!")
		end
	else
		-- Buffer not modified, just close it
		vim.cmd("bd")
	end
end

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		require("which-key").setup({
			plugins = {
				marks = true,
				registers = true,
				spelling = {
					enabled = true,
					suggestions = 20,
				},
				presets = {
					operators = false,
					motions = true,
					text_objects = true,
					windows = true,
					nav = true,
					z = true,
					g = true,
				},
			},

			icons = {
				breadcrumb = icons.ui.DoubleChevronRight,
				separator = icons.ui.BoldArrowRight,
				group = icons.ui.Plus .. " ",
			},

			popup_mappings = {
				scroll_down = "<c-d>",
				scroll_up = "<c-u>",
			},

			window = {
				border = "rounded",
				position = "bottom",
				margin = { 1, 0, 1, 0 },
				padding = { 2, 2, 2, 2 },
				winblend = 0,
			},

			layout = {
				height = { min = 4, max = 25 },
				width = { min = 20, max = 50 },
				spacing = 3,
				align = "left",
			},

			ignore_missing = true,

			hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },

			show_help = true,

			triggers = "auto",

			triggers_blacklist = {
				i = { "j", "k" },
				v = { "j", "k" },
			},
		})

		local wk = require("which-key")

		wk.register(mappings, opts)
		wk.register(vmappings, vopts)
	end,
}
