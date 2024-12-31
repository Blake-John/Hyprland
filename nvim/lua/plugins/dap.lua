return {
	{
		-- core plugin of debug
		"mfussenegger/nvim-dap",
		event = "InsertEnter",
		keys = {
			{ "<leader>db", function () require ("dap").toggle_breakpoint () end, desc = "Toggle Breakpoint" },
			{ "<leader>dra", function () require ("dap").continue ({ before = get_args }) end, desc = "Run with Args" },
			{ "<leader>drc", function () require ("dap").run_to_cursor () end, desc = "Run to Cursor" },
			{ "<leader>dc", function () require ("dap").continue () end, desc = "Continue" },
			-- { "<leader>dg", function () require ("dap").goto_ () end, desc = "Go before Line" },
			{ "<leader>dn", function () require ("dap").step_over () end, desc = "Next (Step Over)" },
			{ "<leader>ds", function () require ("dap").step_into () end, desc = "Step Into" },
			{ "<leader>do", function () require ("dap").step_out () end, desc = "Step Out" },
			{ "<leader>dh", function () require ("dap.ui.widgets").hover () end, desc = "Hover"}
		},
		config = function ()
			-- require ("dap.ext.vscode").load_launchjs ("launch.json", { codelldb = { "c", "cpp" } })

			local install_root_dir = vim.fn.stdpath("data") .. "/mason"
			local extension_path = install_root_dir .. "/packages/codelldb/extension/"
			local codelldb_path = extension_path .. "adapter/codelldb"

			require ("dap").configurations.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = codelldb_path,
					args = { "--port", "${port}" },

					-- On windows you may have to uncomment this:
					-- detached = false,
				},
			}
			require ("dap").configurations.cpp = {
				{
					name = "Launch",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					args = function ()
						local argv = {}
						arg = vim.fn.input(string.format("argv: "))
						for a in string.gmatch(arg, "%S+") do
							table.insert(argv, a)
						end
						vim.cmd('echo ""')
						return argv
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = true,
				},
			}
		end
	},

	{
		-- for the communication of mason's dap and the nvim-dap
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		config = function ()
			require ("mason-nvim-dap").setup ({
				handlers = {}
			})
		end,
	},

	-- add the ui of the dap plugin
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "nvim-neotest/nvim-nio" },
		keys = {
			{ "<leader>du", function () require ("dapui").toggle () end, desc = "DAP UI" },
		},
		config = function ()
			require ("dapui").setup ()
		end,
	},
}
