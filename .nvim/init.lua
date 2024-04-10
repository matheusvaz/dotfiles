-- Globals
g = vim.g
cmd = vim.cmd
opt = vim.opt
kmap = vim.keymap

-- GUI
font = "FiraCode Nerd Font"
fontsize = "14"
colorscheme = "tokyonight-storm"
useicons = true
icons = require("core.icons")

require("core.keymaps")
require("core.plugins")
require("core.settings")

-- Pre-load telescope and prepare it to launch without delay
vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	once = true,
	callback = function()
		if vim.fn.argc() == 0 and vim.fn.line2byte("$") == -1 then
			cmd('silent! echo ""') -- Clears any initial messages to avoid flash
			cmd("enew") -- Start with a clean new buffer
			vim.fn.timer_start(1, function()
				require("telescope").extensions.projects.projects()
			end)
		end
	end,
})
