-- print ("load whichkey.lua")

return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		-- init = function ()
		-- 	vim.o.timeout = true
		-- 	vim.o.timeoutlen = 300
		-- end,
		opts = {
			defaults = {
				spec = {
				},
				triggers = {
					{ "<auto>", mode = "nixsotc" },
				},
				plugins = {
					spelling = {
						enabled = true,
						suggestions = 20
					}
				},
			},
			win = {
				no_overlap = false,
				-- border = "single"
				border = "rounded"
			}
		},
		config = function (_, opts)
			require("which-key").setup(opts)
			require("which-key").add({
				{
					mode = { "n", "v" },
					{ "<leader>", group = "normal" },
					{ "<leader>s", group = "search" },
					{ "<leader>b", group = "buffer" },
					{ "<leader>bc", group = "close buffers" },
					{ "<leader>d", group = "Debug" },
					{ "<leader>dr", group = "run" },
					{ "g", group = "goto" },
					{ "]", group = "jump to next" },
					{ "[", group = "jump to previous" }
				}
			})
			-- config = function (_, opts)
			-- 	require ("which-key").setup (opts)
			-- end
		end
	}
}
