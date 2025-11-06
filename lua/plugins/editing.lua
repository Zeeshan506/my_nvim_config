return {
	{
		-- Easily delete, change, add, and find surroundings
		"kylechui/nvim-surround",
		version = "*", -- Always latest stable
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		-- Highlight, edit, and navigate code using a fast incremental parsing library
		"wellle/targets.vim",
		event = "VeryLazy",
	},

	{
		-- Colorizes color codes in files
		"norcalli/nvim-colorizer.lua",
		event = "BufReadPre",
		config = function()
			require("colorizer").setup()
		end,
	},
}
