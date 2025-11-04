return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = 20,
				open_mapping = [[<C-\>]], -- Ctrl + backslash toggles terminal
				hide_numbers = true,
				shade_filetypes = {},
				shade_terminals = true,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				direction = "float", -- floating terminal
				close_on_exit = true,
				float_opts = {
					border = "curved",
					winblend = 3,
				},
			})

			-- Optional: toggle a lazygit terminal
			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
			vim.keymap.set("n", "<leader>gg", function()
				lazygit:toggle()
			end, { desc = "Toggle LazyGit" })
		end,
	},
}
