return {
	{ "kyazdani42/nvim-web-devicons" },
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		config = function()
			local function on_attach(bufnr)
				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				local api = require("nvim-tree.api")

				kmap.set("n", "l", api.node.open.edit, opts("Open"))
				kmap.set("n", "o", api.node.open.edit, opts("Open"))
				kmap.set("n", "<CR>", api.node.open.edit, opts("Open"))
				kmap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
				kmap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
				kmap.set("n", "C", api.tree.change_root_to_node, opts("CD"))

				api.config.mappings.default_on_attach(bufnr)
			end

			require("nvim-tree").setup({
				auto_reload_on_write = false,
				disable_netrw = false,
				hijack_cursor = false,
				hijack_netrw = true,
				hijack_unnamed_buffer_when_opening = false,
				sort_by = "name",
				root_dirs = {},
				prefer_startup_root = false,
				sync_root_with_cwd = true,
				reload_on_bufenter = false,
				respect_buf_cwd = false,
				on_attach = on_attach,
				select_prompts = false,
				view = {
					adaptive_size = false,
					centralize_selection = true,
					width = 30,
					side = "left",
					preserve_window_proportions = false,
					number = false,
					relativenumber = false,
					signcolumn = "yes",
					float = {
						enable = false,
						quit_on_focus_loss = true,
						open_win_config = {
							relative = "editor",
							border = "rounded",
							width = 30,
							height = 30,
							row = 1,
							col = 1,
						},
					},
				},
				renderer = {
					add_trailing = false,
					group_empty = false,
					highlight_git = true,
					full_name = false,
					highlight_opened_files = "none",
					root_folder_label = ":t",
					indent_width = 2,
					indent_markers = {
						enable = false,
						inline_arrows = true,
						icons = {
							corner = "└",
							edge = "│",
							item = "│",
							none = " ",
						},
					},
					icons = {
						webdev_colors = useicons,
						git_placement = "before",
						padding = " ",
						symlink_arrow = " ➛ ",
						show = {
							file = useicons,
							folder = useicons,
							folder_arrow = useicons,
							git = useicons,
						},
						glyphs = {
							default = icons.ui.Text,
							symlink = icons.ui.FileSymlink,
							bookmark = icons.ui.BookMark,
							folder = {
								arrow_closed = icons.ui.TriangleShortArrowRight,
								arrow_open = icons.ui.TriangleShortArrowDown,
								default = icons.ui.Folder,
								open = icons.ui.FolderOpen,
								empty = icons.ui.EmptyFolder,
								empty_open = icons.ui.EmptyFolderOpen,
								symlink = icons.ui.FolderSymlink,
								symlink_open = icons.ui.FolderOpen,
							},
							git = {
								unstaged = icons.git.FileUnstaged,
								staged = icons.git.FileStaged,
								unmerged = icons.git.FileUnmerged,
								renamed = icons.git.FileRenamed,
								untracked = icons.git.FileUntracked,
								deleted = icons.git.FileDeleted,
								ignored = icons.git.FileIgnored,
							},
						},
					},
					special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
					symlink_destination = true,
				},
				hijack_directories = {
					enable = false,
					auto_open = true,
				},
				update_focused_file = {
					enable = true,
					debounce_delay = 15,
					update_root = true,
					ignore_list = {},
				},
				diagnostics = {
					enable = useicons,
					show_on_dirs = false,
					show_on_open_dirs = true,
					debounce_delay = 50,
					severity = {
						min = vim.diagnostic.severity.HINT,
						max = vim.diagnostic.severity.ERROR,
					},
					icons = {
						hint = icons.diagnostics.Hint,
						info = icons.diagnostics.Information,
						warning = icons.diagnostics.Warning,
						error = icons.diagnostics.Error,
					},
				},
				filters = {
					dotfiles = false,
					git_clean = false,
					no_buffer = false,
					custom = { "node_modules", "\\.cache", "^.git$" },
					exclude = {},
				},
				filesystem_watchers = {
					enable = true,
					debounce_delay = 50,
					ignore_dirs = {},
				},
				git = {
					enable = true,
					ignore = false,
					show_on_dirs = true,
					show_on_open_dirs = true,
					timeout = 200,
				},
				actions = {
					use_system_clipboard = true,
					change_dir = {
						enable = true,
						global = false,
						restrict_above_cwd = false,
					},
					expand_all = {
						max_folder_discovery = 300,
						exclude = {},
					},
					file_popup = {
						open_win_config = {
							col = 1,
							row = 1,
							relative = "cursor",
							border = "shadow",
							style = "minimal",
						},
					},
					open_file = {
						quit_on_open = false,
						resize_window = false,
						window_picker = {
							enable = true,
							picker = "default",
							chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
							exclude = {
								filetype = { "notify", "lazy", "qf", "diff", "fugitive", "fugitiveblame" },
								buftype = { "nofile", "terminal", "help" },
							},
						},
					},
					remove_file = {
						close_window = true,
					},
				},
				trash = {
					cmd = "trash",
					require_confirm = true,
				},
				live_filter = {
					prefix = "[FILTER]: ",
					always_show_folders = true,
				},
				tab = {
					sync = {
						open = false,
						close = false,
						ignore = {},
					},
				},
				notify = {
					threshold = vim.log.levels.INFO,
				},
				log = {
					enable = false,
					truncate = false,
					types = {
						all = false,
						config = false,
						copy_paste = false,
						dev = false,
						diagnostics = false,
						git = false,
						profile = false,
						watcher = false,
					},
				},
				system_open = {
					cmd = nil,
					args = {},
				},
			})
		end,
	},
}
