return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			theme = "tokyonight",
		},
	},
	{

		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opt = { transparent = true },
		config = function()
			vim.cmd.colorscheme("solarized-osaka")
		end,
	},
}
