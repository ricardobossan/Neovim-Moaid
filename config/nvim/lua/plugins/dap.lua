return {
	"mfussenegger/nvim-dap",
	commit = "780fd4dd06b0744b235a520d71660c45279d9447",
	dependencies = {
		-- fancy UI for the debugger
		{
			"rcarriga/nvim-dap-ui",
			commit = "d845ebd798ad1cf30aa4abd4c4eff795cdcfdd4f",
			-- stylua: ignore
			keys = {
				{ "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
				{ "<leader>de", function() require("dapui").eval() end,     desc = "Eval",  mode = { "n", "v" } },
			},
			opts = {},
			config = function(_, opts)
				-- setup dap config by VsCode launch.json file
				-- require("dap.ext.vscode").load_launchjs()
				Dap = require("dap")
				local dapui = require("dapui")
				dapui.setup(opts)
				Dap.listeners.after.event_initialized["dapui_config"] = function()
					dapui.open({})
				end
				Dap.listeners.before.event_terminated["dapui_config"] = function()
					dapui.close({})
				end
				Dap.listeners.before.event_exited["dapui_config"] = function()
					dapui.close({})
				end

				local whichkey = require("which-key")
				local legendary_whichkey = require("legendary.integrations.which-key")

				local opts = {
					mode = "n",
					prefix = "<leader>",
					buffer = nil,
					silent = true,
					noremap = true,
					nowait = false,
				}

				local keymap = {
					d = {
						name = "Debugger",
						R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
						E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
						C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
						U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
						--b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
						c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
						d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
						e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
						g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
						h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
						S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
						i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
						o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
						p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
						q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
						r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
						s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
						b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
						x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
						u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },

					}
				}

				whichkey.register(keymap, opts)
				legendary_whichkey.bind_whichkey(keymap, opts, true)
				legendary_whichkey.parse_whichkey(keymap, opts, true)
			end,
		},

		-- virtual text for the debugger
		{
			"theHamsta/nvim-dap-virtual-text",
			commit = "d4542ac257d3c7ee4131350db6179ae6340ce40b",
			opts = {},
		},
	}
}
