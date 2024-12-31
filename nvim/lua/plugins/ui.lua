

return {
	{
		"rktjmp/lush.nvim"
	},
	{
		dir = "~/.config/nvim/lua/plugins/colorfulcode-dark/",
		lazy = false,
		config = function ()
			vim.cmd ("colorscheme colorfulcode-dark")
		end
	},
	-- {
	-- 	"loganswartz/polychrome.nvim"
	-- },
	-- {
	-- 	"projekt0n/github-nvim-theme",
	-- 	lazy = false,
	-- 	config = function ()
	-- 		vim.cmd ("colorscheme github_light")
	-- 	end
	-- },
	-- {
	-- 	"EdenEast/nightfox.nvim",
	-- 	lazy = false
	-- 	-- config = function ()
	-- 	-- 	vim.cmd ("colorscheme nightfox-dark")
	-- 	-- end
	-- },
	--
	-- show the color in the nvim
	{
		"norcalli/nvim-colorizer.lua",
		event = "VeryLazy",
		config = function ()
			require ("colorizer").setup {
				"*";
			}
		end
	},

	{
		"MunifTanjim/nui.nvim",
		config = function ()
			require ("nui.popup")({
				border = {
					style = 'rounded'
				},
			})
		end

		},

	-- tree file explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support
		},
		keys = {
			{
				"<leader>e",
				"<esc><cmd>Neotree toggle<CR>",
				desc = "Explorer"
			}
		},
		config = function ()
			vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "DiagnosticSignError"})
			vim.fn.sign_define("DiagnosticSignWarn", {text = " ", texthl = "DiagnosticSignWarn"})
			vim.fn.sign_define("DiagnosticSignInfo", {text = " ", texthl = "DiagnosticSignInfo"})
			vim.fn.sign_define("DiagnosticSignHint", {text = "", texthl = "DiagnosticSignHint"})
			require ("neo-tree").setup ({
				default_component_configs = {
					indent = {
						with_expanders = true,
						expander_collapsed = "",
						expander_expanded = "",
						expander_highlight = "NeoTreeExpander"
					}
				}
			})
		end
	},

	-- mini
	{
		-- this plugin will lead to the scroll be stucked
		-- {
		-- 	"echasnovski/mini.animate",
		-- 	version = "false",
		-- 	event = "VeryLazy",
		-- 	config = function ()
		-- 		require ("mini.animate").setup ()
		-- 	end
		-- },
		{
			"echasnovski/mini.indentscope",
			event = "VeryLazy",
			config = function ()
				require ("mini.indentscope").setup ({
					symbol = "│",
					-- symbol = "▏",
					-- options = { 
					-- 	try_as_border = true,
					-- 	border = "both"
					-- }
				})
			end
		}
	},

	-- indent hint
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		config = function ()
			require ("ibl").update ({
				indent = {
					char = "│",
					tab_char = "│",
				},
				scope = {
					enabled = false
				}
			})
		end
	},

	-- winbar above to show the struct
	{
		"fgheng/winbar.nvim",
		event = "VeryLazy",
		config = function ()
			require ("winbar").setup ({
				enabled = true,
				show_file_path = true,
				show_symbols = true,
				colors = {
						path = '', -- You can customize colors like #c946fd
						file_name = '',
						symbols = '',
						guibg = ''

				},

				icons = {
						file_icon_default = '',
						seperator = '>',
						editor_state = '●',
						lock_icon = '',
				},
			})
		end
	},

	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		keys = {
			{ "<leader>bcr", "<cmd>BufferLineCloseRight<CR>", desc = "Close Right Buffers" },
			{ "<leader>bcl", "<cmd>BufferLineCloseLeft<CR>", desc = "Close Left Buffers" },
			{ "<leader>bco", "<cmd>BufferLineCloseOthers<CR>", desc = "Close Other Buffers" },
			{ "<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "Pin the Buffer" },
			{ "<leader>1", "<cmd>lua require ('bufferline').go_to (1, true)<CR>", desc = "Go to Buffer 1" },
			{ "<leader>2", "<cmd>lua require ('bufferline').go_to (2, true)<CR>", desc = "Go to Buffer 2" },
			{ "<leader>3", "<cmd>lua require ('bufferline').go_to (3, true)<CR>", desc = "Go to Buffer 3" },
			{ "<leader>4", "<cmd>lua require ('bufferline').go_to (4, true)<CR>", desc = "Go to Buffer 4" },
			{ "<leader>5", "<cmd>lua require ('bufferline').go_to (5, true)<CR>", desc = "Go to Buffer 5" },
			{ "<leader>6", "<cmd>lua require ('bufferline').go_to (6, true)<CR>", desc = "Go to Buffer 6" },
		},
		config = function ()
			require ("bufferline").setup ({
				options = {
					themable = true,
					numbers = "ordinal",
					diagnostics = "nvim_lsp",
					diagnostics_indicator = function(count, level, diagnostics_dict, context)
						local icon = level:match("warning") and " " or " "
						return " " .. icon .. count
					end,
					-- diagnostics_indicator = function(count, level, diagnostics_dict, context)
					-- 	local s = " "
					-- 	for e, n in pairs(diagnostics_dict) do
					-- 		local sym = e == "error" and " "
					-- 		or (e == "warning" and " " or "" )
					-- 		s = s .. n .. sym
					-- 	end
					-- 	return s
					-- end,
					indicator = {
						icon = " >",
						style = "icon",
					},
					show_tab_indicators = true,
					offsets = {
						{
							filetype = "neo-tree",
							text = "Neo Tree",
							text_align = "left",
							separator = true,
							highlight = "String"
						},
					},
					groups = {
						items = {
							require('bufferline.groups').builtin.pinned:with({ icon = "" })
						}
		            },

				},
			})
		end
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function ()
			local linecolors = {
				blue	=	"#268bd2",
				green	=	"#448c27",
				yellow	=	"#d39f03",
				purple	=	"#6c71c4",
				cyan	=	"#2aa198",
				blake	=	"#000000"
			}
			local colorfultheme = {
				normal = {
					a = { bg = linecolors.blue, fg = linecolors.blake, gui = "bold" },
					b = { bg = "#ffffff00", fg = linecolors.blue },
					c = { bg = "#ffffff00", fg = linecolors.blue }
				},

				insert = {
					a = { bg = linecolors.green, fg = linecolors.blake, gui = "bold" },
					b = { bg = "#ffffff00", fg = linecolors.green },
					c = { bg = "#ffffff00", fg = linecolors.green }
				},
				
				visual = {
					a = { bg = linecolors.yellow, fg = linecolors.blake, gui = "bold" },
					b = { bg = "#ffffff00", fg = linecolors.yellow },
					c = { bg = "#ffffff00", fg = linecolors.yellow }
				},

				replace = {
					a = { bg = linecolors.purple, fg = linecolors.blake, gui = "bold" },
					b = { bg = "#ffffff00", fg = linecolors.purple },
					c = { bg = "#ffffff00", fg = linecolors.purple }
				},

				command = {
					a = { bg = linecolors.cyan, fg = linecolors.blake, gui = "bold" },
					b = { bg = "#ffffff00", fg = linecolors.cyan },
					c = { bg = "#ffffff00", fg = linecolors.cyan }
				},

				inactivate =  {
					a = { bg = "#606060", fg = linecolors.blake, gui = "bold" },
					b = { bg = "#ffffff00", fg = "#606060" },
					c = { bg = "#ffffff00", fg = "#606060" }
				},

			}
			require ("lualine").setup ({
				options = {
					theme = colorfultheme,
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "selectioncount", "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" }
				},
			})
		end
	}
}
