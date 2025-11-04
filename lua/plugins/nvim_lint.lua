return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufNewFile" }, -- load on file open
	config = function()
		local lint = require("lint")

		-- Filetype-specific linters
		lint.linters_by_ft = {
			fish = { "fish" },
			-- ['*'] = { 'global-linter' },
			-- ['_'] = { 'fallback-linter' },
		}

		-- Debounce helper
		local function debounce(ms, fn)
			local timer = vim.loop.new_timer()
			return function(...)
				local args = { ... }
				timer:start(ms, 0, function()
					timer:stop()
					vim.schedule_wrap(fn)(unpack(args))
				end)
			end
		end

		-- Lint function
		local function run_lint()
			local names = lint._resolve_linter_by_ft(vim.bo.filetype)
			if #names == 0 then
				vim.list_extend(names, lint.linters_by_ft["_"] or {})
			end
			vim.list_extend(names, lint.linters_by_ft["*"] or {})

			if #names > 0 then
				lint.try_lint(names)
			end
		end

		vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
			group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
			callback = debounce(100, run_lint),
		})
	end,
}
