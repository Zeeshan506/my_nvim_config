return {
	"folke/snacks.nvim",
	event = "VeryLazy",
	opts = {
		-- ⚡ Performance-focused animations
		animation = {
			enabled = true,
			fps = 120,
			win_open = { enabled = true, duration = 150, type = "slide" },
			win_close = { enabled = true, duration = 150, type = "slide" },
		},

		-- ⚙️ Simplified scroll and indent visuals
		scroll = { enabled = false },
		indent = {
			scope = {
				enabled = true,
				char = "│",
			},
			animate = { enabled = true }, -- 🚫 Disable indent animation for speed
			winblend = 8,
			padding = { 1, 2, 1, 2 },
		},

		-- 🪟 Clean UI settings
		windows = { border = "rounded" },
		notifier = {
			enabled = true,
			timeout = 2500,
		},
		markdown = {
			enabled = true,
			highlight = true,
			border = "rounded",
		},

		-- 🧠 Terminal Integration
		terminal = {
			enabled = true,
			start_insert = true,
			float = { border = "rounded" },
		},

		-- 🏠 Minimalist Doom-style Dashboard
		dashboard = {
			enabled = true,
			header = {
				[[                                                                    ]],
				[[    ██████╗ ██╗  ██╗ █████╗ ██╗  ██╗██╗   ██╗███╗   ███╗             ]],
				[[   ██╔════╝ ██║  ██║██╔══██╗██║  ██║██║   ██║████╗ ████║             ]],
				[[   ███████╗ ███████║███████║███████║██║   ██║██╔████╔██║             ]],
				[[   ╚════██║ ██╔══██║██╔══██║██╔══██║██║   ██║██║╚██╔╝██║             ]],
				[[   ███████║ ██║  ██║██║  ██║██║  ██║╚██████╔╝██║ ╚═╝ ██║             ]],
				[[   ╚══════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝             ]],
				[[                                                                    ]],
			},
			buttons = {
				{ icon = " ", text = "Find File", key = "f", cmd = "Telescope find_files" },
				{ icon = " ", text = "Recent Files", key = "r", cmd = "Telescope oldfiles" },
				{ icon = " ", text = "New File", key = "n", cmd = "ene" },
				{ icon = " ", text = "Lazy", key = "l", cmd = "Lazy" },
				{ icon = " ", text = "Quit", key = "q", cmd = "qall" },
			},
		},
	},
}
