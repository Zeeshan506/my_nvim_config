return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup({
				signsg = {
					add = { text = "▎" },
					change = { text = "▎" },
					delete = { text = "▁" },
					topdelete = { text = "▔" },
					changedelete = { text = "~" },
				},
				current_line_blame = true,
				current_line_blame_opts = {
					delay = 400,
					virt_text_pos = "right_align",
				},
			})
		end,
	},
}
