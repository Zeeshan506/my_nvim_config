return {
	"folke/snacks.nvim",
	event = "BufReadPre", -- Trigger on buffer read
	opts = {
		windows = {
			border = "rounded",
			winblend = 8,
			padding = { 1, 2, 1, 2 },
		},
		markdown = {
			enabled = true,
			highlight = true,
			border = "rounded",
		},
		scroll = { enabled = false },
		indent = {
			scope = { enabled = false },
		},
	},
}
