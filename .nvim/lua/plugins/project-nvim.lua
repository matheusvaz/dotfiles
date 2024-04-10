local function get_cache_dir()
	local lvim_cache_dir = vim.fn.expand("~/.dotfiles/.nvim/cache")
	if vim.fn.isdirectory(lvim_cache_dir) == 0 then
		return vim.call("stdpath", "cache")
	end
	return lvim_cache_dir
end

return {
	"ahmedkhalf/project.nvim",
	config = function()
		require("project_nvim").setup({
			active = true,
			on_config_done = nil,
			manual_mode = false,
			detection_methods = { "pattern" },
			patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pom.xml" },
			ignore_lsp = {},
			exclude_dirs = {},
			show_hidden = false,
			silent_chdir = true,
			scope_chdir = "global",
			datapath = get_cache_dir(),
		})
	end,
    event = "VimEnter",
	cmd = "Telescope projects",
}
