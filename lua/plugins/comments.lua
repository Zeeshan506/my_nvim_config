return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({
			padding = true, -- Add a space between comment and code
			sticky = true, -- Keep the cursor in place
			mappings = {
				basic = true, -- Enable basic mappings (gcc, gc)
				extra = true, -- Enable extra mappings (gbc, gb)
			},
			pre_hook = nil, -- Hook to run before commenting
			post_hook = nil, -- Hook to run after commenting
		})
	end,
}
