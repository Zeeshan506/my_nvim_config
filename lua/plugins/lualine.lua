return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy", -- lazy-load after startup
		opts = function()
			local function fg(name)
				local ok, hl = pcall(vim.api.nvim_get_hl_by_name, name, true)
				if ok and hl.foreground then
					return string.format("#%06x", hl.foreground)
				end
			end

			return {
				options = {
					theme = "auto", -- automatically adapt to current colorscheme
					globalstatus = vim.o.laststatus == 3,
					disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = { "filename" },
					lualine_x = {
						{
							"diff",
							symbols = { added = " ", modified = " ", removed = " " },
						},
						{
							function()
								if package.loaded["lazy.status"] then
									local lazy = require("lazy.status")
									return lazy.has_updates() and lazy.updates() or ""
								end
								return ""
							end,
							color = { fg = fg("Special") or "#00afff" },
						},
					},
					lualine_y = { "progress", "location" },
					lualine_z = {
						function()
							return " " .. os.date("%R")
						end,
					},
				},
				extensions = { "neo-tree", "lazy", "fzf" },
			}
		end,
	},
}
