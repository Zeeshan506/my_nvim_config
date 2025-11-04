return {
	-- Load Copilot core only when typing or calling command
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		cmd = "Copilot",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
		},
		config = function(_, opts)
			require("copilot").setup(opts)
		end,
	},

	-- Load Copilot CMP only when typing (depends on nvim-cmp & copilot.lua)
	{
		"zbirenbaum/copilot-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/nvim-cmp",
			"zbirenbaum/copilot.lua",
		},
		config = function()
			require("copilot_cmp").setup()
		end,
	},

	-- Chat plugin lazy-loaded on keybind
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			"zbirenbaum/copilot.lua",
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope.nvim", optional = true },
		},
		opts = {
			model = "gpt-4o",
			selection = function()
				return require("CopilotChat.select").visual_with_fallback()
			end,
			window = {
				layout = "float",
				width = 0.45,
				height = 0.6,
				border = "rounded",
			},
		},
		config = function(_, opts)
			require("CopilotChat").setup(opts)
		end,
		keys = {
			{ "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat: Toggle" },
			{ "<leader>cC", "<cmd>CopilotChatClose<cr>", desc = "CopilotChat: Close" },
			{ "<leader>cr", "<cmd>CopilotChatReset<cr>", desc = "CopilotChat: Reset" },
			{ "<leader>ce", "<cmd>CopilotChatExplain<cr>", mode = { "n", "v" }, desc = "Explain code" },
			{ "<leader>cf", "<cmd>CopilotChatFix<cr>", mode = { "n", "v" }, desc = "Fix code" },
			{ "<leader>co", "<cmd>CopilotChatOptimize<cr>", mode = { "n", "v" }, desc = "Optimize code" },
			{ "<leader>cd", "<cmd>CopilotChatDocs<cr>", mode = { "n", "v" }, desc = "Generate docs" },
			{ "<leader>ct", "<cmd>CopilotChatTests<cr>", mode = { "n", "v" }, desc = "Generate tests" },
			{ "<leader>cm", "<cmd>CopilotChatModels<cr>", desc = "Choose model" },
			{
				"<leader>cp",
				function()
					local ok, t = pcall(require, "CopilotChat.integrations.telescope")
					if ok then
						t.pick()
					else
						vim.cmd("CopilotChatToggle")
					end
				end,
				desc = "Prompt Picker (Telescope if available)",
			},
		},
	},
}
