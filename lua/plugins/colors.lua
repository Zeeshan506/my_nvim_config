return {
	-- Colorscheme
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = { transparent = true },
		config = function()
			vim.cmd.colorscheme("solarized-osaka")

			-- Table of highlight groups to control
			local hl_groups = { "Normal", "NormalFloat", "StatusLine", "VertSplit", "CursorLine", "Pmenu", "TabLine" }

			-- Default transparency
			local transparent = true

			local function set_transparency(state)
				for _, group in ipairs(hl_groups) do
					if state then
						-- semi-transparent: 80% opacity
						vim.api.nvim_set_hl(0, group, { bg = "NONE" })
					else
						-- opaque
						vim.api.nvim_set_hl(0, group, { bg = "#002b36" })
					end
				end
				-- Refresh lualine to apply bg changes
				if package.loaded["lualine"] then
					require("lualine").refresh()
				end
			end

			-- Apply initial transparency
			set_transparency(transparent)

			-- Expose toggle function globally
			_G.ToggleTransparency = function()
				transparent = not transparent
				set_transparency(transparent)
			end

			-- Keymap: <leader>tt to toggle
			vim.keymap.set("n", "<leader>tt", _G.ToggleTransparency, { desc = "Toggle transparency" })
		end,
	},

	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			theme = "tokyonight",
		},
	},
}
