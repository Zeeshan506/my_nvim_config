return {
	-- Theme manager: Themery
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			require("themery").setup({
				themes = {
					{ name = "Kanagawa", colorscheme = "kanagawa" },
					{ name = "One Dark", colorscheme = "onedark" },
					{ name = "Gruvbox Material", colorscheme = "gruvbox-material" },
					{ name = "OldWorld", colorscheme = "oldworld" },
					{ name = "OneDark", colorscheme = "onedark" },
					{ name = "Eldritch", colorscheme = "eldritch" },
					{ name = "Poimandres", colorscheme = "poimandres" },
					{ name = "Zenbones", colorscheme = "zenbones" },
					{ name = "Miasma", colorscheme = "miasma" },
					{ name = "Solarized Osaka", colorscheme = "solarized-osaka" },
					{ name = "Zenwritten", colorscheme = "zenwritten" },
					{ name = "Neobones", colorscheme = "neobones" },
					{ name = "Vimbones", colorscheme = "vimbones" },
					{ name = "Rosebones", colorscheme = "rosebones" },
					{ name = "Forestbones", colorscheme = "forestbones" },
					{ name = "Nordbones", colorscheme = "nordbones" },
					{ name = "Tokyobones", colorscheme = "tokyobones" },
					{ name = "Seoulbones", colorscheme = "seoulbones" },
					{ name = "Duckbones", colorscheme = "duckbones" },
					{ name = "Zenburned", colorscheme = "zenburned" },
					{ name = "Kanagawabones", colorscheme = "kanagawabones" },
					{ name = "Randombones", colorscheme = "randombones" },
					{ name = "Kanagawa Wave", colorscheme = "kanagawa-wave" },
					{ name = "Kanagawa Dragon", colorscheme = "kanagawa-dragon" },
					{ name = "Kanagawa Lotus", colorscheme = "kanagawa-lotus" },
				},
				livePreview = true,
			})

			-- Keybinding to open Themery picker
		end,
	},
	-- Themes installed via Lazy.nvim
	{ "rebelot/kanagawa.nvim", lazy = false },
	{ "sainnhe/gruvbox-material", lazy = false },
	{ "dgox16/oldworld.nvim", lazy = false },
	{ "anavarasu/onedark.nvim", lazy = false },
	{ "eldritch-theme/eldritch.nvim", lazy = false },
	{ "olivercederborg/poimandres.nvim", lazy = false, dependencies = "rktjmp/lush.nvim" },
	{ "zenbones-theme/zenbones.nvim", lazy = false },
	{ "xero/miasma.nvim", lazy = false },
	{ "craftzdog/solarized-osaka.nvim", lazy = false, priority = 1000 },

	-- Default active theme setup (Solarized Osaka)
	{
		"solarized-osaka.nvim",
		lazy = false,
		config = function()
			vim.cmd.colorscheme("solarized-osaka")

			-- Fix bracket highlight contrast
			vim.api.nvim_set_hl(0, "MatchParen", {
				bg = "#000000",
				fg = "#BCC6CC",
				bold = true,
			})

			-- Base highlight adjustments for transparency (always on)
			local hl_groups = { "Normal", "NormalFloat", "StatusLine", "VertSplit", "CursorLine", "Pmenu", "TabLine" }
			for _, group in ipairs(hl_groups) do
				vim.api.nvim_set_hl(0, group, { bg = "NONE" })
			end
		end,
	},
}
