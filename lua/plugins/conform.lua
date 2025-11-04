return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	lazy = true,
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>cF",
			function()
				require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
			end,
			mode = { "n", "x" },
			desc = "Format Injected Langs",
		},
	},

	init = function()
		-- Enable auto-formatting on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				require("conform").format()
			end,
		})
	end,
	opts = {
		default_format_opts = {
			timeout_ms = 3000,
			async = false,
			quiet = false,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			lua = { "stylua" },
			fish = { "fish_indent" },
			sh = { "shfmt" },
			python = { "black" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
		},
		formatters = {
			injected = { options = { ignore_errors = true } },
			-- custom overrides, e.g.
			shfmt = { prepend_args = { "-i", "2", "-ci" } },
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)
	end,
}
